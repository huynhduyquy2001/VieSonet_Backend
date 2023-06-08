package com.viesonet.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.viesonet.entity.DanhSachKetBan;
import com.viesonet.entity.NguoiDung;

public interface DanhSachKetBanDAO extends JpaRepository<DanhSachKetBan, String> {
	DanhSachKetBan findByNguoiDungAndNguoiLa(NguoiDung nguoiDung, NguoiDung nguoiLa);

}
