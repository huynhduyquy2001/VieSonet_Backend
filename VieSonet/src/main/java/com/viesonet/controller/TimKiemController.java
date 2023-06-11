package com.viesonet.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.hibernate.grammars.hql.HqlParser.IsNullPredicateContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.viesonet.dao.BanBeDAO;
import com.viesonet.dao.DanhSachKetBanDAO;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.BanBe;
import com.viesonet.entity.DanhSachKetBan;
import com.viesonet.entity.NguoiDung;
import com.viesonet.service.CookieService;
import com.viesonet.service.SessionService;

import jakarta.persistence.EntityNotFoundException;

@Controller

public class TimKiemController {
	@Autowired
	private NguoiDungDAO nguoiDungDao;
	@Autowired
	SessionService SS;
	@Autowired
	private DanhSachKetBanDAO dskbDao;
	@Autowired
	private BanBeDAO BBDAO;
	@Autowired
	SessionService Session;
	@Autowired
	CookieService cookie;

	@ResponseBody
	@GetMapping("/timKiemTheoTen")
	public List<Object> timKiemTheoTen(Model m, @RequestParam("tuKhoaCuaToi") String tuKhoa) {
		List<Object> danhSach = nguoiDungDao.timNguoiDung(tuKhoa);
		//m.addAttribute("danhSachTimKiem", danhSach);
		return danhSach;
	}
	@ResponseBody
	@GetMapping("/timKiemsdt")
	public List<Object> timKiemsdt(Model m, @RequestParam("tuKhoaCuaToi") String tuKhoa) {
		List<Object> danhSach1 = nguoiDungDao.timNguoiDungTheoSDT(tuKhoa);
		List<BanBe> list = BBDAO.findFriends(tuKhoa);
		m.addAttribute("danhSachBanBe",list);	
		 //m.addAttribute("danhSachTimKiem", danhSach1);
		return danhSach1;
	}

	@GetMapping("/timKiem")
	public String timKiem(Model m) {
		DSBB(m);
		return "TimKiem";
	}

	@GetMapping("/timKiem/ketBan/{maKB}")
	public String themLoiMoiKetBan(@PathVariable("sdt") String sdt , Model m) {
		String sdtND = Session.get("sdt");
		NguoiDung nguoiDung = nguoiDungDao.getById(sdtND);
		NguoiDung nguoiLa = nguoiDungDao.findBySdt(sdt);
		System.out.println("Ngưo"+nguoiDung.getSdt());
		if (nguoiDung.equals(nguoiLa)) {
			m.addAttribute("message", "Lỗi bạn k tự kết bạn dới chính mình");
			return "TimKiem";
		}
		if (nguoiLa == null) {
			m.addAttribute("message", "Chưa có kết bạn ✪ ω ✪");
			return "TimKiem";
		}
		 // Kiểm tra xem đã tồn tại lời mời kết bạn giữa hai người dùng hay chưa
		DanhSachKetBan ds = dskbDao.getByNguoiLaAndNguoiDung(nguoiDung,nguoiLa);
		if (ds != null) {
			m.addAttribute("message", "Đã có lời mời trước đó");
			return "TimKiem";
		}
		// Lưu thông tin lời mời vào CSDL
		ds = new DanhSachKetBan();
		ds.setNguoiDung(nguoiDung);
		ds.setNguoiLa(nguoiLa);
		ds.setNgayGui(new Date());
		dskbDao.saveAndFlush(ds);
		return "redirect:/timKiem";
	}

	
	// Lấy dữ liệu người dùng đăng nhập vào trên Session
	public void DSBB(Model model) {
		// Lấy dữ liệu người dùng đăng nhập vào trên Session
		String sdtCN = SS.get("sdt");
		NguoiDung dsNguoiDung2 = nguoiDungDao.findBySdt(sdtCN);
		model.addAttribute("dsNguoiDung2", dsNguoiDung2);
	}

}
