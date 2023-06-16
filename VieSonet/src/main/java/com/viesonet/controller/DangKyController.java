package com.viesonet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.dao.VaiTroDAO;
import com.viesonet.entity.NguoiDung;
import com.viesonet.entity.VaiTro;
import com.viesonet.service.ParamService;

@Controller
public class DangKyController {
	@Autowired
	ParamService paramService;
	@Autowired
	NguoiDungDAO dao;
	@Autowired
	VaiTroDAO vTDao;

	@GetMapping("/dangky")
	public String dangKy(Model model) {
		model.addAttribute("user", new NguoiDung());
		model.addAttribute("hienDangNhap","hidden");
		model.addAttribute("hienDangKy","");
		return "dangKy";
	}

	@RequestMapping("/dangky")
	public String dangKy2(@ModelAttribute("nguoiDung") NguoiDung item, Model m) {
		String xacNhanMatKhau = paramService.getString("xacNhanMatKhau", "");
		if (!dao.existsBySdt(item.getSdt())) {
			if(dao.existsByEmail(item.getEmail())) {
				m.addAttribute("message", "Email này đã được đăng ký");
			} else {
				if (item.getMatKhau().equalsIgnoreCase(xacNhanMatKhau)) {
					if (!item.getGioiTinh()) {
						item.setAnhDaiDien("avatar2.jpg");
					} else {
						item.setAnhDaiDien("avatar1.jpg");
					}
					item.setVaiTro(vTDao.getById(1));
					item.setTrangThai(true);
					item.setLuotViPham(0);
					item.setAnhBia("anhBia.jpg");
					dao.save(item);
				} else {
					m.addAttribute("message", "Mật khẩu và mật khẩu xác nhận không trùng khớp");
					return "dangKy";
				}
				m.addAttribute("message", "Đăng ký thành công");
				return "redirect:/dangnhap";
			}
		} else {
			m.addAttribute("message", "Tài khoản đã tồn tại");
		}
		return "dangKy";
	}



}
