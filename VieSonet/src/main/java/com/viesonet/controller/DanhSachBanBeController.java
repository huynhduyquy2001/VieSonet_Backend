package com.viesonet.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	NguoiDungDAO nguoiDungDAO;
	@Autowired
	private DanhSachKetBanDAO dskbDao;

	@GetMapping("/DanhSachBanBe")
	public String DanhSachBanBe( String sdt, Model model) {
		//model.addAttribute("sdt", sdt);
		DSBB(model);
		String sdtCN = Session.get("sdt");
//		DSBanBe(model, sdtCN);
		List<BanBe> list = BanBeDAO.findFriends(sdtCN);
		model.addAttribute("danhSachBanBe",list);
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
	
	@GetMapping("/DanhSachBanBe/dongy/{maLoiMoi}")
	public String dongYKetBan(@PathVariable int maLoiMoi) {
		// thêm người ta vào danh sách bạn bè
		String sdt = Session.get("sdt");
		NguoiDung nguoiDung = nguoiDungDAO.getById(sdt);
		DanhSachKetBan ds = dskbDao.getById(maLoiMoi);
		NguoiDung nguoiLa = ds.getNguoiLa();

		BanBe banBe = new BanBe();
		banBe.setNguoiDung(nguoiDung);
		banBe.setBanBe(nguoiLa);
		banBe.setNgayKb(new Date());
		BanBeDAO.saveAndFlush(banBe);

		// thêm mình vào danh sách bạn bè của ng ta
		BanBe banBee = new BanBe();
		banBee.setNguoiDung(nguoiLa);
		banBee.setBanBe(nguoiDung);
		banBee.setNgayKb(new Date());
		BanBeDAO.saveAndFlush(banBee);
		//dskbDao.deleteById(maLoiMoi);
		return "redirect:/DanhSachBanBe";
	}
	
	@GetMapping("/DanhSachBanBe/tuchoi/{maLoiMoi}")
	public String tuChoiKetBan(@PathVariable int maLoiMoi) {
		dskbDao.deleteById(maLoiMoi);
		return "redirect:/DanhSachBanBe";
	}
	
	//Xóa bạn
		@GetMapping("/DanhSachBanBe/xoa/{maBanBe}")
		public String XoaBan(@PathVariable String maBanBe) {
			BanBeDAO.deleteById(maBanBe);
			return "redirect:/DanhSachBanBe";
		}
	// Lấy dữ liệu người dùng đăng nhập vào trên Session
	public void DSBB(Model model) {	
		String sdtCN = Session.get("sdt");
		NguoiDung dsNguoiDung2 = nguoiDungDao.findBySdt(sdtCN);
		model.addAttribute("dsNguoiDung2", dsNguoiDung2);
	}

}
