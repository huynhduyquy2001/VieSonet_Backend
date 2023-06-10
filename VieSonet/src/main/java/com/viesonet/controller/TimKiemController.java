package com.viesonet.controller;

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
import com.viesonet.service.SessionService;

import jakarta.persistence.EntityNotFoundException;

@Controller

public class TimKiemController {
	@Autowired
	private NguoiDungDAO nguoiDungDao;

	@Autowired
	private DanhSachKetBanDAO DSKB;
	@Autowired
	SessionService SS;

	@Autowired
	private BanBeDAO BBDAO;


	

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
	
	@PostMapping("/timKiemTheoTen")
	public String timKiemTheoTen( Model m, @RequestParam("tuKhoaCuaToi" )String tuKhoa) {
	    List<NguoiDung> danhSach = nguoiDungDao.findByhoTenContaining(tuKhoa);
	    m.addAttribute("danhSachTimKiem", danhSach);
	    return "TimKiem";
	}
	@GetMapping("/timKiem")
	public String timKiem() {
	    
	    return "TimKiem";
	}


//	 @GetMapping("/tim-kiem1")
//	    public String timKiem1(@RequestParam(name ="sdt1", required = false) String sdt, Model model) {
//	        NguoiDung nguoiDung = nguoiDungDao.findBySdt(sdt);
//	        model.addAttribute("sdt1", sdt);
//	        String sdtCN = SS.get("sdt");
//	        if (nguoiDung != null) {
//	            model.addAttribute("nguoiDung", nguoiDung);
//	            
//	        } else {
//	            model.addAttribute("error", "Không tìm thấy người dùng với số điện thoại này!");
//	        }
//	        DSBB(model);
//	        DSBanBe(model, sdt);
//	        return "TimKiem";
//	    }
//	@GetMapping("/tim-kiem1")
//	public String timKiem2(@RequestParam(name = "hoTen", required = false) String hoTen, Model model) {
//		if (hoTen != null) {
//			List<NguoiDung> dsNguoiDung = nguoiDungDao.findByhoTenContaining(hoTen);
//			model.addAttribute("dsNguoiDung", dsNguoiDung);
//		}
//		String sdtCN = SS.get("sdt");
//		// DSBanBe(model, sdtCN);
//
//		DSBB(model);
//		return "TimKiem";
//	}

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

}
