package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.viesonet.entity.BanBe;
import com.viesonet.entity.DanhSachKetBan;
import com.viesonet.entity.NguoiDung;
import com.viesonet.entity.NguoiDungJson;


public interface NguoiDungDAO extends JpaRepository<NguoiDung, String> {
	@Query("SELECT bv.nguoiDung.hoTen, bv.nguoiDung.anhDaiDien, bv.nguoiDung.sdt FROM BaiViet bv WHERE bv.maBaiViet = :maBaiViet")
	Object findNguoiDungByMaBaiViet(@Param("maBaiViet") int maBaiViet);
	
	NguoiDung findByHoTen(String hoTen);
	NguoiDung findBySdt(String sdt);
	NguoiDung findByEmail(String email);
	Boolean existsBySdt(String sdt);


	NguoiDung save(NguoiDung entity);
	
	@Query("SELECT nd.sdt, nd.vaiTro FROM NguoiDung nd WHERE nd.sdt = :sdt")
	Object[] findNguoiDung(@Param("sdt") String sdt);
	@Query("select sdt from NguoiDung where sdt =?1")
	NguoiDung timsdt(@Param("sdt") String sdt);
	
	
	List<NguoiDung> findByhoTenContaining(String hoTen);
	
	@Query("SELECT DISTINCT nd FROM NguoiDung nd JOIN BanBe bb ON bb.sdt = nd.sdt WHERE nd.sdt NOT IN (SELECT bb2.sdtBb FROM BanBe bb2 WHERE bb2.sdt = :sdt)")
	List<NguoiDung> findUnrelatedFriends(@Param("sdt") String sdt);
	
	@Query("SELECT DISTINCT b.nguoiDung.hoTen, b.nguoiDung.anhDaiDien, b.nguoiDung.sdt, b.sdtBb , b.nguoiDung.sdt FROM BanBe b WHERE b.nguoiDung.hoTen like %:hoTen%")
	List<Object> timNguoiDung(@Param("hoTen") String hoTen);
	
	@Query("SELECT DISTINCT b.nguoiDung.hoTen, b.nguoiDung.anhDaiDien, b.nguoiDung.sdt, b.sdtBb FROM BanBe b WHERE b.nguoiDung.sdt like %:hoTen%")
	List<Object> timNguoiDungTheoSDT(@Param("hoTen") String hoTen);
	@Query("SELECT u FROM NguoiDung u WHERE u.sdt=:sdt")
	NguoiDung findBySoDienThoai(String sdt);
}
