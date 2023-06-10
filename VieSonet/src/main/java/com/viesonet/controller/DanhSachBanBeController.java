package com.viesonet.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
public class DanhSachBanBeController {
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

	@GetMapping("/DanhSachBanBe")
	public String DanhSachBanBe( String sdt, Model model) {
		//model.addAttribute("sdt", sdt);
		DSBB(model);
		String sdtCN = Session.get("sdt");
//		DSBanBe(model, sdtCN);
		List<BanBe> list = BanBeDAO.findFriends(sdtCN);
		model.addAttribute("danhSachBanBe", list);
		//Đếm số lượng bạn bè
		long listBb = BanBeDAO.countBySdt(sdtCN);
		long listBbBB = BanBeDAO.countBySdtBb(sdtCN);
		long slbb = listBb + listBbBB;
		model.addAttribute("SlBanbe", slbb);

		// danh sách kết bạn và đếm số lượng kết bạn 
		List<DanhSachKetBan> danhSachKetBan = dskbDao.findDsBySdt(sdtCN);
		model.addAttribute("SlKb", danhSachKetBan.size());
		List<DanhSachKetBan> topKetBan = new ArrayList<>();
		for (int i = 0; i < Math.min(3, danhSachKetBan.size()); i++) {
			topKetBan.add(danhSachKetBan.get(i));
		}
		model.addAttribute("topKetBan", topKetBan);
		System.out.println("SL bạn bè " + slbb);
		return "DanhSachBanBe";
	}
	// Lấy dữ liệu người dùng đăng nhập vào trên Session
	public void DSBB(Model model) {	
		String sdtCN = Session.get("sdt");
		NguoiDung dsNguoiDung2 = nguoiDungDao.findBySdt(sdtCN);
		model.addAttribute("dsNguoiDung2", dsNguoiDung2);
	}

	private void DSBanBe(Model model, String sdtPF) {
		// Hiện danh sách bạn bè của sdt nhập vào
		String sdtCN = Session.get("sdt");
		NguoiDung nguoiDung1 = nguoiDungDao.findBySdt(sdtPF);
		NguoiDung nguoiDung2 = nguoiDungDao.findBySdt(sdtCN);
		// BanBe banBe = BBDAO.findBysdtBb(sdtPF);
		if (nguoiDung1 == null) {
			// Truong hop khong tim duoc nguoi dungx
			// Redirect ve trang chu hoac tra ve mot trang bao loi
			model.addAttribute("error", "Bọn như làng!");
		}
		if (nguoiDung2 == null) {
			// Truong hop khong tim duoc nguoi dungx
			// Redirect ve trang chu hoac tra ve mot trang bao loi
			model.addAttribute("message", "Bọn như làng!");
		}
		// if (nguoiDung1 != nguoiDung2) {
		List<BanBe> danhSachBanBe = BanBeDAO.findAllByNguoiDung(nguoiDung1);
		List<BanBe> danhSachBanBe1 = BanBeDAO.findAllByNguoiDung(nguoiDung2);
		if (danhSachBanBe.isEmpty()) {
			model.addAttribute("nguoiDung", nguoiDung1);
			model.addAttribute("danhSachBanBe1", danhSachBanBe);
		}

		if (danhSachBanBe1.isEmpty()) {
			model.addAttribute("nguoiDung1", nguoiDung2);

		}
		model.addAttribute("danhSachBanBe", danhSachBanBe);
	}

}
