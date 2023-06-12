package com.viesonet.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;


import com.viesonet.entity.LoaiViPham;
import com.viesonet.entity.NguoiDung;

public interface LoaiViPhamDAO extends JpaRepository<LoaiViPham, Integer> {
	Boolean existsByMaLoai(int maLoai);
	LoaiViPham save(LoaiViPham entity);
	LoaiViPham findByMaLoai(int maLoai);
	

	
}
