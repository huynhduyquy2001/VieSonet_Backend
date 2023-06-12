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
	
	@Query("SELECT DISTINCT nd FROM NguoiDung nd JOIN BanBe bb ON bb.sdt = nd.sdt WHERE nd.sdt NOT IN (SELECT bb2.sdtBb FROM BanBe bb2 WHERE bb2.sdt = :sdt)")
	List<NguoiDung> findUnrelatedFriends(@Param("sdt") String sdt);
	
	@Query("SELECT DISTINCT b.nguoiDung.hoTen, b.nguoiDung.anhDaiDien, b.nguoiDung.sdt, b.sdtBb , b.nguoiDung.sdt FROM BanBe b WHERE b.nguoiDung.hoTen like %:hoTen%")
	List<Object> timNguoiDung(@Param("hoTen") String hoTen);
	
	@Query("SELECT DISTINCT b.nguoiDung.hoTen, b.nguoiDung.anhDaiDien, b.nguoiDung.sdt, b.sdtBb FROM BanBe b WHERE b.nguoiDung.sdt like %:hoTen%")
	List<Object> timNguoiDungTheoSDT(@Param("hoTen") String hoTen);
}
