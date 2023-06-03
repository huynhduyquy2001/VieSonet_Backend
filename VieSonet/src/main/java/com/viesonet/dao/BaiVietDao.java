package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.viesonet.entity.BaiViet;

public interface BaiVietDAO extends JpaRepository<BaiViet, String> {
	@Query("SELECT bv, COUNT(bv.danhSachBinhLuan) FROM BaiViet bv JOIN bv.danhSachBinhLuan GROUP BY bv")
    List<Object[]> findAllBaiVietWithCommentCount();
}
