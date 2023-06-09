package com.viesonet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.viesonet.entity.BanBe;
import com.viesonet.entity.NguoiDung;

public interface NguoiDungDAO extends JpaRepository<NguoiDung, String> {
	NguoiDung findBySdt(String sdt);

	List<NguoiDung> findByhoTenContaining(String hoTen);

	@Query("SELECT DISTINCT nd FROM NguoiDung nd JOIN BanBe bb ON bb.sdt = nd.sdt WHERE nd.sdt NOT IN (SELECT bb2.sdtBb FROM BanBe bb2 WHERE bb2.sdt = :sdt)")
	List<NguoiDung> findUnrelatedFriends(@Param("sdt") String sdt);


}
