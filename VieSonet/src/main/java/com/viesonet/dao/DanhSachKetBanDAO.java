package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.viesonet.entity.BanBe;
import com.viesonet.entity.DanhSachKetBan;
import com.viesonet.entity.NguoiDung;

public interface DanhSachKetBanDAO extends JpaRepository<DanhSachKetBan, Integer> {
	DanhSachKetBan findByNguoiDungAndNguoiLa(NguoiDung nguoiDung, NguoiDung nguoiLa);

	@Query("select kb from DanhSachKetBan kb where kb.nguoiLa.sdt =?1")
	List<DanhSachKetBan> findDsBySdt(String soDienThoai);

	DanhSachKetBan getByNguoiLaAndNguoiDung(NguoiDung nguoiDung, NguoiDung nguoiLa);

	@Query("SELECT bb FROM DanhSachKetBan bb WHERE bb.nguoiDung.sdt = ?1 OR bb.nguoiLa.sdt = ?1")
	List<DanhSachKetBan> findFriends(String soDienThoai);

	@Query("SELECT bb.maLoiMoi FROM DanhSachKetBan bb WHERE bb.nguoiDung.sdt like ?1 AND bb.nguoiLa.sdt like ?1")
	List<Integer> findMaLoiMoiByNguoiDungAndNguoiLa(String nguoiDung, String nguoiLa);
	
	@Query("select kb from DanhSachKetBan kb where kb.nguoiLa.sdt =?1")
	List<DanhSachKetBan> findDsBySdttest(String soDienThoai);
	
	
	
}
