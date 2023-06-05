package com.viesonet.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.NguoiDung;
import com.viesonet.service.CookieService;
import com.viesonet.service.ParamService;
import com.viesonet.service.SessionService;

@Controller
public class DangNhapController {
	@Autowired
	ParamService paramService;
	@Autowired
	CookieService cookieService;
	@Autowired
	SessionService sessionService;
	@Autowired
	NguoiDungDAO dao;

	@GetMapping("/dangnhap")
	public String dangNhap(Model m) {
		String user = cookieService.getValue("user");

		if (user != null) {
			String pass = cookieService.getValue("pass");
			m.addAttribute("user", user);
			m.addAttribute("pass", pass);
		}
		return "dangNhap";
	}

	@PostMapping("/dangnhap")
	public String dangNhap2(@RequestParam(name = "sdt", required = false) String sdt, Model m) {
//		String sdt = paramService.getString("sdt", "");
		String matKhau = paramService.getString("matKhau", "");
		boolean remember = paramService.getBoolean("ghiNho", true);
		NguoiDung nDung = dao.findBySdt(sdt);
		if (sdt.equals(nDung.getSdt()) && matKhau.equals(nDung.getMatKhau())) {
			m.addAttribute("message1", "");
			sessionService.set("sdt", sdt);
			if (remember) {
				cookieService.add("user", sdt, 10);
				cookieService.add("pass", matKhau, 10);
			} else {
				cookieService.delete("user");
				cookieService.delete("pass");
			}
//			return "index";
		} else {
			m.addAttribute("message", "Thông tin đăng nhập không chính xác !");
		}

		return "dangNhap";
	}
}
