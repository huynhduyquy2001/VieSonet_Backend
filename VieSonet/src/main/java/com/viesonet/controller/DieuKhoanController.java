package com.viesonet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.NguoiDung;
import com.viesonet.service.SessionService;

@Controller
public class DieuKhoanController {
	@Autowired
	NguoiDungDAO NguoiDungDAO;
	@Autowired
	SessionService session;

	@GetMapping("/dieukhoan")
	public String dieuKhoan(Model m) {
		String sdt = session.get("sdt");
		NguoiDung taiKhoan = NguoiDungDAO.getById(sdt);
		m.addAttribute("taiKhoan", taiKhoan);
		return "dieuKhoan";
	}
}
