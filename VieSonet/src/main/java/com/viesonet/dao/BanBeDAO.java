package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.viesonet.entity.BanBe;

public interface BanBeDAO extends JpaRepository<BanBe, String> {
	@Query("select bb from BanBe bb where bb.nguoiDung.sdt=?1")
	List<BanBe> findFriendByUserphone(String soDienThoai);
	@Query("SELECT bb FROM BanBe bb WHERE bb.nguoiDung.sdt = ?1 OR bb.banBe.sdt = ?1")
	  List<BanBe> findFriends(String soDienThoai);
}
