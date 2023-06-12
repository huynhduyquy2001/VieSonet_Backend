package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.viesonet.entity.BaiVietViPham;
import com.viesonet.entity.BanBe;

public interface BaiVietViPhamDAO extends JpaRepository<BaiVietViPham, Integer> {
	@Query("select bv from BaiVietViPham bv where bv.trangThai = true")
	List<BaiVietViPham> findDanhSachToCao();
	
	@Query("select bv from BaiVietViPham bv where bv.trangThai = false")
	List<BaiVietViPham> findDanhSachViPham();

    
	@Modifying
    @Query("UPDATE BaiVietViPham bv SET bv.trangThai = false WHERE bv.baiViet.maBaiViet = :maBaiViet")
    void danhDauViPham(@Param("maBaiViet") int maBaiViet);
	
	
	@Query("select bv.nguoiDung.hoTen, bv.loaiViPham.chiTiet, bv.ngayToCao, bv.baiViet.maBaiViet from BaiVietViPham bv where bv.trangThai = true")
	List<Object> loadDanhSach();
}
