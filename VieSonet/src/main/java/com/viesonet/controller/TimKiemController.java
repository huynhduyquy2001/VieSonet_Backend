package com.viesonet.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.hibernate.grammars.hql.HqlParser.IsNullPredicateContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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


	

//	@GetMapping("/KetBan")
//	public String KB(@PathVariable("sdt1") String sdt, Model m) {
//		String sdtCN = SS.get("sdt");
//		NguoiDung nguoiDung = nguoiDungDao.findBySdt(sdtCN);
//		NguoiDung nguoiDungLa = nguoiDungDao.findBySdt(sdt);
//		if (nguoiDung == null) {
//			m.addAttribute("error", "Số điện thoại người dùng trống!");
//		}
//		if (nguoiDungLa == null) {
//			m.addAttribute("error", "Số điện thoại người dùng lạ trống!");
//		}
//		if (nguoiDung.equals(nguoiDungLa)) {
//			m.addAttribute("error", "Số điện thoại trùng nè!");
//		}
//
//		DanhSachKetBan loiMoiKetBan = DSKB.findByNguoiDungAndNguoiLa(nguoiDung, nguoiDungLa);
//		if (loiMoiKetBan != null) {
//			m.addAttribute("error", "Đã có lời mời kết bạn từ người này");
//		}
//		// Tạo đối tượng lời mời kết bạn và lưu vào cơ sở dữ liệu
//		DanhSachKetBan danhSachKetBan = new DanhSachKetBan();
//		danhSachKetBan.setNguoiDung(nguoiDung);
//		danhSachKetBan.setNguoiLa(nguoiDungLa);
//		DSKB.save(danhSachKetBan);
//		// m.addAttribute("error", "Đã kết bạn ");
//		System.out.println("SDT ND" + nguoiDung.getSdt());
//		System.out.println("SDT NL" + nguoiDungLa.getSdt());
//
//		return "TimKiem";
//	}
	@ResponseBody
	@PostMapping("/timKiemTheoTen")
	public List<Object> timKiemTheoTen(Model m, @RequestParam("tuKhoaCuaToi") String tuKhoa) {
		List<Object> danhSach = nguoiDungDao.timNguoiDung(tuKhoa);
		//m.addAttribute("danhSachTimKiem", danhSach);
		return danhSach;
	}
	@ResponseBody
	@PostMapping("/timKiemsdt")
	public String timKiemsdt(@RequestParam("tuKhoaCuaToi") String tuKhoa) {
		//tìm thấy
	    NguoiDung nguoiDung = nguoiDungDao.timNguoiDungTheoSDT(tuKhoa);
	    if (nguoiDung != null) {
	        return "/nguoiDung/" + tuKhoa;
	    } else {
	        String message = "Số điện thoại này chưa đăng ký tài khoản";
	        return message;
	    }
	}
	
	@GetMapping("/timKiem")
	public String timKiem(Model m) {
		DSBB(m);
		String sdtCN = SS.get("sdt");
		String sdt = Session.get("sdt");
		NguoiDung taiKhoan = nguoiDungDao.getById(sdt);
		m.addAttribute("taiKhoan", taiKhoan);
		List<BanBe> list = BBDAO.findFriends(sdtCN);
		m.addAttribute("danhSachBanBe",list);	
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
//	public void DSBB(Model model) {
//		// Lấy dữ liệu người dùng đăng nhập vào trên Session
//		String sdtCN = SS.get("sdt");
//		NguoiDung dsNguoiDung2 = nguoiDungDao.findBySdt(sdtCN);
//		model.addAttribute("dsNguoiDung2", dsNguoiDung2);
//	}
//
//	private void DSBanBe(Model model, String sdtPF) {
//		// Hiện danh sách bạn bè của sdt nhập vào
//		String sdtCN = SS.get("sdt");
//		NguoiDung nguoiDung1 = nguoiDungDao.findBySdt(sdtPF);
//		NguoiDung nguoiDung2 = nguoiDungDao.findBySdt(sdtCN);
//		// BanBe banBe = BBDAO.findBysdtBb(sdtPF);
//		if (nguoiDung1 == null) {
//			// Truong hop khong tim duoc nguoi dungx
//			// Redirect ve trang chu hoac tra ve mot trang bao loi
//			model.addAttribute("error", "Bọn như làng!");
//		}
//		if (nguoiDung2 == null) {
//			// Truong hop khong tim duoc nguoi dungx
//			// Redirect ve trang chu hoac tra ve mot trang bao loi
//			model.addAttribute("message", "Bọn như làng!");
//		}
//		// if (nguoiDung1 != nguoiDung2) {
//		List<BanBe> danhSachBanBe = BBDAO.findAllByNguoiDung(nguoiDung1);
//		List<BanBe> danhSachBanBe1 = BBDAO.findAllByNguoiDung(nguoiDung2);
//		if (danhSachBanBe.isEmpty()) {
//			model.addAttribute("nguoiDung", nguoiDung1);
//			model.addAttribute("danhSachBanBe1", danhSachBanBe);
//		}
//
//		if (danhSachBanBe1.isEmpty()) {
//			model.addAttribute("nguoiDung1", nguoiDung2);
//
//		}
//		model.addAttribute("danhSachBanBe", danhSachBanBe);
//		// }
//		System.out.println(nguoiDung1.getSdt());
//		System.out.println(nguoiDung2.getSdt());
//	}
	public void DSBB(Model model) {
		// Lấy dữ liệu người dùng đăng nhập vào trên Session
		String sdtCN = SS.get("sdt");
		NguoiDung dsNguoiDung2 = nguoiDungDao.findBySdt(sdtCN);
		model.addAttribute("dsNguoiDung2", dsNguoiDung2);
	}

}
