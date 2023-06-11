package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.viesonet.entity.DanhSachYeuThich;

public interface DanhSachYeuThichDAO extends JpaRepository<DanhSachYeuThich, String> {
	@Query("select ds from DanhSachYeuThich ds where ds.nguoiDung.sdt=?1 and ds.baiViet.maBaiViet=?2")
	DanhSachYeuThich findByKey(String sdt, int maBaiViet);
	@Query("select ds from DanhSachYeuThich ds where ds.nguoiDung.sdt=?1")
	List<DanhSachYeuThich> findBySdt(String sdt);
}
