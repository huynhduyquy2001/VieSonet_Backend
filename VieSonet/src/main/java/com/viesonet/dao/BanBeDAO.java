package com.viesonet.dao;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import com.viesonet.entity.BanBe;

public interface BanBeDAO extends JpaRepository<BanBe, String> {
	List<BanBe> findFriendByUserphone(String sdt, Sort sort);
}
