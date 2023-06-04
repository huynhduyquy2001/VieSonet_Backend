package com.viesonet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	public String dangNhap() {
		String user = cookieService.getValue("user");

		if (user != null) {
			String pass = cookieService.getValue("pass");
		}
		return "dangNhap";
	}

	@PostMapping("/dangnhap")
	public String dangNhap2(Model m) {
		String sdt = paramService.getString("sdt", "");
		String matKhau = paramService.getString("matKhau", "");
		boolean remember = paramService.getBoolean("ghiNho", false);	
		
		NguoiDung nDung = dao.findById(sdt).orElse(null);
		
		if (nDung != null && matKhau.equals(nDung.getMatKhau())) {
			sessionService.set("username", sdt);
			if (remember) {
				cookieService.add("user", sdt, 10);
				cookieService.add("pass", matKhau, 10);
			} else {
				cookieService.delete("user");
				cookieService.delete("pass");
			}
			m.addAttribute("message", "chính xác !");
//			return "index";
		} else {
			m.addAttribute("message", "Thông tin đăng nhập không chính xác !");
		}
		return "dangNhap";
	}
}
