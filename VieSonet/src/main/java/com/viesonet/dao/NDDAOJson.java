package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.viesonet.entity.NguoiDung;
import com.viesonet.entity.NguoiDungJson;


public interface NDDAOJson extends JpaRepository<NguoiDungJson, String> {
	
	@Query("SELECT nd FROM NguoiDungJson nd WHERE nd.sdt <> :sdt")
	List<NguoiDungJson> findDSNguoiDungKhacNguoiDungHienTai(@Param("sdt") String sdt);
	
	@Modifying
	@Query("UPDATE NguoiDungJson nd SET nd.luotViPham = 0 WHERE nd.sdt = :sdt")
	void resetLuotViPham(@Param("sdt") String sdt);
	
	@Modifying
	@Query("UPDATE NguoiDungJson nd SET nd.trangThai = false  WHERE nd.sdt = :sdt")
	void khoaTaiKhoan(@Param("sdt") String sdt);
	
	@Modifying
	@Query("UPDATE NguoiDungJson nd SET nd.trangThai = true  WHERE nd.sdt = :sdt")
	void moTaiKhoan(@Param("sdt") String sdt);
	
	@Modifying
	@Query("UPDATE NguoiDungJson nd SET nd.vaiTro.maVaiTro =:vaiTro  WHERE nd.sdt = :sdt")
	void doiVaitro(@Param("vaiTro") String vaiTro, @Param("sdt") String sdt);
	
	@Query("SELECT nd FROM NguoiDungJson nd WHERE nd.hoTen like %:ten%")
    List<NguoiDungJson> findByHoTen(@Param("ten") String ten);
	
	NguoiDungJson findBySdt(String sdt);
}
