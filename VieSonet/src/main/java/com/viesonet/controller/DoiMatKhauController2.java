package com.viesonet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.NguoiDung;

import com.viesonet.service.ParamService;
import com.viesonet.service.SessionService;

@Controller
public class DoiMatKhauController2 {
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	NguoiDungDAO dao;

	@GetMapping("/DoiMatKhau")
	public String doiMatKhau() {
		return "doiMatKhau2";
	}

	@RequestMapping("/DoiMatKhau")
	public String doiMatKhau1(RedirectAttributes attrRedirect, Model m) {
		String matKhauMoi = paramService.getString("matKhauMoi", "");
		String matKhauXacNhan = paramService.getString("matKhauXacNhan", "");
		String sdt = sessionService.get("sdt");
		NguoiDung nDung = dao.findBySdt(sdt);
		System.out.println(nDung.getMatKhau());
		
		if (matKhauMoi.equals(nDung.getMatKhau())) {
			m.addAttribute("message", "Mật khẩu mới không được giống mật khẩu cũ");
		} else {
			if (matKhauMoi.equalsIgnoreCase(matKhauXacNhan)) {
				nDung.setMatKhau(matKhauMoi);
				dao.save(nDung);
				m.addAttribute("message", "Đổi mật khẩu thành công");
				sessionService.set("sdt", nDung.getSdt());
				return "redirect:/";
			} else {
				m.addAttribute("message", "Mật khẩu và mật khẩu xác nhận không khớp");
			}
		}

		return "doiMatKhau2";
	}

}
