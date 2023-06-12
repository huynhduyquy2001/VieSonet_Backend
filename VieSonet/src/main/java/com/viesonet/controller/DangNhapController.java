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
	public String dangNhap(Model m) {
		String user = cookieService.getValue("user");
		if (user != null) {
			String pass = cookieService.getValue("pass");
			m.addAttribute("user", user);
			m.addAttribute("pass", pass);
			return "redirect:/";
		}else if(sessionService.get("sdt") != null) {
			return "redirect:/";
		}else {
			return "dangNhap";
		}
	}
	
	@PostMapping("/dangnhap")
	public String dangNhap2( Model m) {
		String sdt = paramService.getString("sdt", "");
		String matKhau = paramService.getString("matKhau", "");
		boolean remember = paramService.getBoolean("ghiNho", false);
		try {
			NguoiDung nDung = dao.findBySdt(sdt);
			if (sdt.equals(nDung.getSdt()) && matKhau.equals(nDung.getMatKhau())) {
				if(nDung.getTrangThai() == false) {
					m.addAttribute("message", "Tài khoản này đã bị khóa do vi phạm điều khoản");
				}else {
					m.addAttribute("message1", "");
					sessionService.set("sdt", sdt);
					sessionService.set("vt", nDung.getVaiTro().getMaVaiTro());
					if (remember) {
						cookieService.add("user", sdt, 10);
						cookieService.add("pass", matKhau, 10);
					} else {
						cookieService.delete("user");
						cookieService.delete("pass");
					}
					return "redirect:/";
				}
			} else {
				m.addAttribute("message", "Thông tin đăng nhập không chính xác !");
			}
		} catch (Exception e) {
			m.addAttribute("message", "Số điện thoại không tồn tại");
		}
		return "dangNhap";
	}
}
