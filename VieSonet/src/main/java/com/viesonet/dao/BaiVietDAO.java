package com.viesonet.dao;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.viesonet.entity.BaiViet;
import com.viesonet.entity.PostWithComment;
import com.viesonet.entity.DanhSachYeuThich;

public interface BaiVietDAO extends JpaRepository<BaiViet, Integer> {
	@Query("SELECT b FROM BaiViet b WHERE b.nguoiDung.sdt IN :sdtList AND b.cheDo.maCheDo <> :maCheDo AND b.trangThai=:trangThai")
	List<BaiViet> findByNguoiDungSdtInAndCheDoMaCheDoNotIn(List<String> sdtList, Integer maCheDo, Boolean trangThai, Sort sort);


	
	
	List<BaiViet> findByNguoiDungSdtIn(List<String> sdtList, Sort sort);
	
	@Query("SELECT  bv.moTa, bv.hinhAnh, bv.ngayDang, bv.luotThich, bv.luotBinhLuan,  bv.nguoiDung.hoTen, bv.nguoiDung.anhDaiDien, bv.nguoiDung.sdt, bv.maBaiViet, bv.cheDo.maCheDo FROM BaiViet bv WHERE bv.maBaiViet = :maBaiViet")
	Object findBaiVietByMaBaiViet(@Param("maBaiViet") int maBaiViet);
	
	
	@Query("SELECT bv.nguoiDung.sdt FROM BaiViet bv WHERE bv.maBaiViet = :maBaiViet")
	BaiViet findByMaBaiViet(@Param("maBaiViet") int maBaiViet);
	
	@Query("SELECT bv FROM BaiViet bv WHERE bv.sdt = :sdt")
	  List<BaiViet> findBySdt(@Param("sdt") String sdt, Sort sort);
	
	@Query("select ds from DanhSachYeuThich ds where ds.nguoiDung.sdt=?1")
	List<BaiViet> findBySdt(String sdt);
	
	
}
	