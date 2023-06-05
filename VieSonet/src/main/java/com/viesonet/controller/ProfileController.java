package com.viesonet.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.viesonet.dao.BaiVietDAO;
import com.viesonet.dao.BanBeDAO;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.BaiViet;
import com.viesonet.entity.BanBe;
import com.viesonet.entity.NguoiDung;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {
	@Autowired
	NguoiDungDAO nguoiDungDao;

	@Autowired
	BaiVietDAO baiVietDao;

	@Autowired
	BanBeDAO banBeDao;
	
	@RequestMapping("/profile")
	public String index(Model m, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		String sdt = "0939790002";
		NguoiDung nguoiDung = null;
		
//		List<Category> list = dao.findAll();
//		m.addAttribute("list", list);
//        // Kiểm tra có session chưa
//        if (session.getAttribute("sdt") != null) {
//            sdt = (String) session.getAttribute("sdt");
//            nguoiDung = nguoiDungRepository.findBySoDienThoai(sdt);
//        } 
//        // Nếu không có, kiểm tra cookie
//        else if (cookies != null) {
//            for (Cookie cookie : cookies) {
//                if (cookie.getName().equals("sdt")) {
//                    soDienThoai = cookie.getValue();
//                    nguoiDung = nguoiDungDao.findBySoDienThoai(sdt);
//                    session.setAttribute("sdt", sdt);
//                    break;
//                }
//            }
//        }
		//Nào có đăng nhập thì đổi
		if (nguoiDung == null) {
		//Sắp xếp giảm dần theo ngày đăng
			List<Order> orders = new ArrayList<Order>();
			orders.add(new Order(Direction.DESC, "ngayDang"));
			Sort sort = Sort.by(orders);
//			m.addAttribute("BaiVietCaNhan", baiVietDao.findAll(sort));
		//Load bài viết cá nhân
			m.addAttribute("BaiVietCaNhan", baiVietDao.findBySdt(sdt, sort));
			m.addAttribute("nguoiDung", nguoiDungDao.findBySoDienThoai(sdt));
			return "trangCaNhan";
		}

		// Nếu không, chuyển hướng về trang chủ
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/profile/update/{sdt}")
	public String update(Model m, @ModelAttribute("sdt") NguoiDung entity) {
		nguoiDungDao.saveAndFlush(entity);
		System.out.println(1);
		return "redirect:/profile";
	}
}
