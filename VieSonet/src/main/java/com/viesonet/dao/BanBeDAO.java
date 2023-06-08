package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.viesonet.entity.BanBe;
import com.viesonet.entity.NguoiDung;

public interface BanBeDAO extends JpaRepository<BanBe, String> {
	  List<BanBe> findAllByNguoiDung(NguoiDung nguoiDung);
	  BanBe findBysdtBb(String sdtBb);
}
