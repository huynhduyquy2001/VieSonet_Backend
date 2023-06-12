package com.viesonet.dao;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.viesonet.entity.ThongBao;

public interface ThongBaoDAO extends JpaRepository<ThongBao, Integer> {
@Query("select tb from ThongBao tb where tb.nguoiDung.sdt=?1")
List<ThongBao> findByUser(String sdt, Sort sort);

@Query(value="select count(*) from ThongBao where sdt=?1 and trangThai=0", nativeQuery = true)
int demThongBaoChuaXem(String sdt);


}
