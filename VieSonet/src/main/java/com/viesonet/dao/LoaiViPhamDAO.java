package com.viesonet.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.viesonet.entity.LoaiViPham;

public interface LoaiViPhamDAO extends JpaRepository<LoaiViPham, Integer> {
	Boolean existsByMaLoai(int maLoai);
	LoaiViPham save(LoaiViPham entity);
	LoaiViPham findByMaLoai(int maLoai);
	

	
}
