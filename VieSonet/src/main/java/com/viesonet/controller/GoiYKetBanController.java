package com.viesonet.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.viesonet.dao.BanBeDAO;
import com.viesonet.dao.DanhSachKetBanDAO;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.BanBe;
import com.viesonet.entity.DanhSachKetBan;
import com.viesonet.entity.NguoiDung;
import com.viesonet.service.CookieService;
import com.viesonet.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class GoiYKetBanController {

	@Autowired
	private NguoiDungDAO nguoiDungDao;
	HttpServletRequest request;
	HttpServletResponse response;

	@Autowired
	SessionService Session;
	@Autowired
	CookieService cookie;
	@Autowired
	private BanBeDAO BanBeDAO;

	@Autowired
	private DanhSachKetBanDAO dskbDao;

	@GetMapping("/GoiYKB")
	public String GoiYKB(String sdt, Model model) {
		DSBB(model);
		String sdtCN = Session.get("sdt");
		// danh sách kết bạn và đếm số lượng kết bạn
		List<DanhSachKetBan> danhSachKetBan = dskbDao.findDsBySdt(sdtCN);
		model.addAttribute("SlKb", danhSachKetBan.size());
		List<DanhSachKetBan> topKetBan = new ArrayList<>();
		for (int i = 0; i < Math.min(3, danhSachKetBan.size()); i++) {
			topKetBan.add(danhSachKetBan.get(i));
		}
		model.addAttribute("topKetBan", topKetBan);
		
		
		
		//Danh sách bạn bè của người dùng
//		NguoiDung nguoiDung2 = nguoiDungDao.findBySdt(sdtCN);
//		List<BanBe> danhSachBanBe1 = BanBeDAO.findAllByNguoiDung(nguoiDung2);
//		model.addAttribute("BB", danhSachBanBe1);
		
		//Danh sách người dùng không phải là bạn của sđt đang đăng nhập
		List<NguoiDung> list = nguoiDungDao.findUnrelatedFriends(sdtCN);
		model.addAttribute("list", list);
		
		//Danh sách tất cả người dùng
//		List<NguoiDung> NDList = nguoiDungDao.findAll();
//		model.addAttribute("DSND", NDList);
//		System.out.println("KB " + danhSachKetBan.size());
		
		return "GoiYKetBan";
	}

	// Lấy dữ liệu người dùng đăng nhập vào trên Session
	public void DSBB(Model model) {
		String sdtCN = Session.get("sdt");
		NguoiDung dsNguoiDung2 = nguoiDungDao.findBySdt(sdtCN);
		model.addAttribute("dsNguoiDung2", dsNguoiDung2);
	}
}
