package com.viesonet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.dao.ThongBaoDAO;
import com.viesonet.entity.NguoiDung;
import com.viesonet.entity.ThongBao;
import com.viesonet.service.SessionService;

@Controller
public class DieuKhoanController {
	@Autowired
	NguoiDungDAO NguoiDungDAO;
	@Autowired
	SessionService session;

	@Autowired
	ThongBaoDAO thongBaoDao;
	@GetMapping("/dieukhoan")
	public String dieuKhoan(Model m) {
		String sdt = session.get("sdt");
		NguoiDung taiKhoan = NguoiDungDAO.getById(sdt);
		m.addAttribute("taiKhoan", taiKhoan);
		// lấy danh sách thông báo
				List<ThongBao> thongBao = thongBaoDao.findByUser(sdt, Sort.by(Direction.DESC, "ngayThongBao"));
				m.addAttribute("thongBao", thongBao);
				m.addAttribute("thongBaoChuaXem", thongBaoDao.demThongBaoChuaXem(sdt));
		return "dieuKhoan";
	}
}
