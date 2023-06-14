package com.viesonet.dao;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.viesonet.entity.BaiViet;
import com.viesonet.entity.BanBe;
import com.viesonet.entity.NguoiDung;

public interface BanBeDAO extends JpaRepository<BanBe, String> {
	List<BanBe> findAllByNguoiDung(NguoiDung nguoiDung);

	BanBe findBysdtBb(String sdtBb);

	long countBySdt(String sdt);

	long countBySdtBb(String sdt);

	@Query("SELECT DISTINCT bb FROM BanBe bb WHERE bb.nguoiDung.sdt = ?1 OR bb.banBe.sdt = ?1")
	List<BanBe> findFriends(String soDienThoai);

	@Query("select bb from BanBe bb where bb.nguoiDung.sdt=?1")
	List<BanBe> findFriendByUserphone(String soDienThoai);

	@Query("SELECT b FROM BanBe b WHERE b.nguoiDung.sdt IN :sdtList OR b.banBe.sdt IN :sdtList")
	List<BanBe> timBanCuaBan(List<String> sdtList);

}
