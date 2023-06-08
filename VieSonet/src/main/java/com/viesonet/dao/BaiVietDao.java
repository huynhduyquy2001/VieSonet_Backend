package com.viesonet.dao;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.viesonet.entity.BaiViet;

public interface BaiVietDao extends JpaRepository<BaiViet, Integer> {
	
	List<BaiViet> findByNguoiDungSdtIn(List<String> sdtList, Sort sort);
	
	@Query("SELECT  bv.moTa, bv.hinhAnh, bv.ngayDang, bv.luotThich, bv.luotBinhLuan,  bv.nguoiDung.hoTen, bv.nguoiDung.anhDaiDien, bv.nguoiDung.sdt, bv.maBaiViet FROM BaiViet bv WHERE bv.maBaiViet = :maBaiViet")
	Object findBaiVietByMaBaiViet(@Param("maBaiViet") int maBaiViet);


}
