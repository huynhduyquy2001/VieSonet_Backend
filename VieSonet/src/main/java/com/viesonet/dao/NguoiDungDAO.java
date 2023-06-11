package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.viesonet.entity.BanBe;
import com.viesonet.entity.DanhSachKetBan;
import com.viesonet.entity.NguoiDung;

public interface NguoiDungDAO extends JpaRepository<NguoiDung, String> {
	@Query("select sdt from NguoiDung where sdt =?1")
	NguoiDung timsdt(@Param("sdt") String sdt);
	
	NguoiDung findBySdt(String sdt);
	
	List<NguoiDung> findByhoTenContaining(String hoTen);
	
	@Query("SELECT DISTINCT nd FROM NguoiDung nd JOIN BanBe bb ON bb.sdt = nd.sdt WHERE nd.sdt NOT IN (SELECT bb2.sdtBb FROM BanBe bb2 WHERE bb2.sdtBb = :sdt)")
	List<NguoiDung> findUnrelatedFriends(@Param("sdt") String sdt);
	
	@Query("SELECT obj.hoTen, obj.anhDaiDien ,obj.sdt FROM NguoiDung obj WHERE obj.hoTen LIKE %:hoTen%")
	List<Object> timNguoiDung(@Param("hoTen") String hoTen);
	
	@Query("SELECT obj.hoTen, obj.anhDaiDien ,obj.sdt FROM NguoiDung obj WHERE obj.sdt LIKE %:hoTen%")
	List<Object> timNguoiDungTheoSDT(@Param("hoTen") String hoTen);
}
