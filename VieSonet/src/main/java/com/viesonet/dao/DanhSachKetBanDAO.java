package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.viesonet.entity.DanhSachKetBan;
import com.viesonet.entity.NguoiDung;

public interface DanhSachKetBanDAO extends JpaRepository<DanhSachKetBan, String> {
	DanhSachKetBan findByNguoiDungAndNguoiLa(NguoiDung nguoiDung, NguoiDung nguoiLa);	
	@Query("select kb from DanhSachKetBan kb where kb.nguoiDung.sdt =?1")
	List<DanhSachKetBan> findDsBySdt(String soDienThoai);
}
