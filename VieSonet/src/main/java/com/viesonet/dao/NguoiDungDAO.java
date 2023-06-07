package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.viesonet.entity.NguoiDung;

public interface NguoiDungDAO extends JpaRepository<NguoiDung, String> {
	@Query("SELECT bv.nguoiDung.hoTen, bv.nguoiDung.anhDaiDien, bv.nguoiDung.sdt FROM BaiViet bv WHERE bv.maBaiViet = :maBaiViet")
	Object findNguoiDungByMaBaiViet(@Param("maBaiViet") int maBaiViet);
	NguoiDung findBySdt(String sdt);
	NguoiDung findByEmail(String email);
	Boolean existsBySdt(String sdt);
	
	NguoiDung save(NguoiDung entity);
}
