package com.viesonet.dao;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.viesonet.entity.DanhSachBinhLuan;
import com.viesonet.entity.DanhSachBinhLuanDTO;

public interface DanhSachBinhLuanDAO extends JpaRepository<DanhSachBinhLuan, Integer> {
	@Query("SELECT new com.viesonet.entity.DanhSachBinhLuanDTO(ds.chiTiet, ds.ngayBinhLuan, ds.nguoiDung.hoTen, ds.nguoiDung.anhDaiDien) FROM DanhSachBinhLuan ds WHERE ds.baiViet.maBaiViet = :maBaiViet")
	List<DanhSachBinhLuanDTO> findByBaiVietMaBaiViet(@Param("maBaiViet") int maBaiViet);
	
	@Query("SELECT ds.nguoiDung.hoTen,ds.nguoiDung.anhDaiDien, ds.chiTiet, ds.ngayBinhLuan, ds.maBinhLuan, ds.baiViet.maBaiViet FROM DanhSachBinhLuan ds WHERE ds.baiViet.maBaiViet = :maBaiViet")
	List<Object> findBinhLuanByMaBaiViet(@Param("maBaiViet") int maBaiViet, Sort sort);
	
	
	@Query("SELECT ds.nguoiDung.hoTen FROM DanhSachBinhLuan ds WHERE ds.maBinhLuan = :maBinhLuan")
	DanhSachBinhLuan findBinhLuan(@Param("maBinhLuan") int maBinhLuan);
}
