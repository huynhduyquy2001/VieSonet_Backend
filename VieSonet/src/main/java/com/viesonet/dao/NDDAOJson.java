package com.viesonet.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.viesonet.entity.NguoiDungJson;


public interface NDDAOJson extends JpaRepository<NguoiDungJson, String> {
	
	@Query("SELECT nd FROM NguoiDungJson nd WHERE nd.sdt <> :sdt")
	List<NguoiDungJson> findDSNguoiDungKhacNguoiDungHienTai(@Param("sdt") String sdt);
	
	@Modifying
	@Query("UPDATE NguoiDungJson nd SET nd.luotViPham = 0 WHERE nd.sdt = :sdt")
	void resetLuotViPham(@Param("sdt") String sdt);
	
}
