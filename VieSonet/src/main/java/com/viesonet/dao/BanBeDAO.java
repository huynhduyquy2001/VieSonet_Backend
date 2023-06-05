package com.viesonet.dao;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.viesonet.entity.BanBe;

public interface BanBeDAO extends JpaRepository<BanBe, String> {
//	@Query("SELECT b COUNT(b.banBe) FROM BanBe b WHERE sdt=:sdt")
//	List<BanBe> findFriendByUserphone(String sdt);
	
	
}
