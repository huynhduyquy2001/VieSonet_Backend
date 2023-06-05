package com.viesonet.dao;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.viesonet.entity.BaiViet;
import com.viesonet.entity.NguoiDung;

public interface BaiVietDAO extends JpaRepository<BaiViet, String> {
	@Query("SELECT bv, COUNT(bv.danhSachBinhLuan) FROM BaiViet bv JOIN bv.danhSachBinhLuan GROUP BY bv")
    List<Object[]> findAllBaiVietWithCommentCount();
    
    @Query("SELECT bv FROM BaiViet bv WHERE bv.sdt = :sdt")
    List<BaiViet> findBySdt(@Param("sdt") String sdt, Sort sort);
    
    
}
