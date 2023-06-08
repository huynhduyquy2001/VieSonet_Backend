package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.viesonet.entity.NguoiDung;

public interface NguoiDungDAO extends JpaRepository<NguoiDung, String> {
	NguoiDung findBySdt(String sdt);
	List<NguoiDung> findByhoTenContaining(String hoTen);
}
