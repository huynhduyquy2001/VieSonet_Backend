package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.viesonet.entity.NguoiDung;

public interface NguoiDungDAO extends JpaRepository<NguoiDung, String> {
	@Query("SELECT u FROM NguoiDung u WHERE u.sdt=:sdt")
	List<NguoiDung> findBySoDienThoai(String sdt);
	
	NguoiDung findBySdt(String sdt);
	
}
