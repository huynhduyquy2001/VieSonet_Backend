package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.viesonet.entity.BanBe;
import com.viesonet.entity.NguoiDung;

public interface BanBeDAO extends JpaRepository<BanBe, String> {
	  List<BanBe> findAllByNguoiDung(NguoiDung nguoiDung);
	  BanBe findBysdtBb(String sdtBb);
	  long countBySdt(String sdt);
	  long countBySdtBb(String sdt);
	  @Query("SELECT DISTINCT bb FROM BanBe bb WHERE bb.nguoiDung.sdt = ?1 OR bb.banBe.sdt = ?1")
	  List<BanBe> findFriends(String soDienThoai);
}
