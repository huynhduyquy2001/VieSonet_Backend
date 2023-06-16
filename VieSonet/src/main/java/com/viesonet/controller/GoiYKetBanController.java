package com.viesonet.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.viesonet.dao.BanBeDAO;
import com.viesonet.dao.DanhSachBinhLuanDAO;
import com.viesonet.dao.DanhSachKetBanDAO;
import com.viesonet.dao.DanhSachYeuThichDAO;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.dao.ThongBaoDAO;
import com.viesonet.entity.BanBe;
import com.viesonet.entity.DanhSachKetBan;
import com.viesonet.entity.NguoiDung;
import com.viesonet.entity.ThongBao;
import com.viesonet.service.CookieService;
import com.viesonet.service.ParamService;
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
	NguoiDungDAO nguoiDungDAO;

	@Autowired
	BanBeDAO banBeDao;

	@Autowired
	DanhSachBinhLuanDAO dsblDao;

	@Autowired
	DanhSachKetBanDAO dskbDao;

	@Autowired
	DanhSachYeuThichDAO dsytDao;

	@Autowired
	SessionService Session;

	@Autowired
	ParamService paramService;
	
	@Autowired
	ThongBaoDAO thongBaoDao;

	@GetMapping("/GoiYKB")
	public String GoiYKB(String sdt, Model model) {
		DSBB(model);
		String sdtCN = Session.get("sdt");
		NguoiDung taiKhoan = nguoiDungDAO.getById(sdtCN);
		model.addAttribute("taiKhoan", taiKhoan);
		// danh sách lời mời kết bạn và đếm số lượng kết bạn
		List<DanhSachKetBan> danhSachKetBan = dskbDao.findDsBySdt(sdtCN);
		model.addAttribute("SlKb", danhSachKetBan.size());
		List<DanhSachKetBan> topKetBan = new ArrayList<>();
		for (int i = 0; i < Math.min(3, danhSachKetBan.size()); i++) {
			topKetBan.add(danhSachKetBan.get(i));
		}
		model.addAttribute("topKetBan", topKetBan);

		// lấy danh sách bạn bè
		List<BanBe> listBb = banBeDao.findFriends(sdtCN);

		List<String> sdtBb = listBb.stream().map(banBe -> {
			if (banBe.getBanBe().getSdt().equals(sdt)) {
				return banBe.getNguoiDung().getSdt();
			} else {
				return banBe.getBanBe().getSdt();
			}
		}).collect(Collectors.toList());
		System.out.println("Danh sach ban be" + sdtBb);
		// lấy danh sách bạn của bạn

		List<BanBe> danhSachBanCuaBan = banBeDao.timBanCuaBan(sdtBb);

		List<String> sdtBanCuaBan = danhSachBanCuaBan.stream().map(banBe -> {
			if (sdtBb.contains(banBe.getBanBe().getSdt())) {
				return banBe.getNguoiDung().getSdt();
			} else {
				return banBe.getBanBe().getSdt();
			}
		}).collect(Collectors.toList());

		System.out.println("Danh sach ban cua ban:" + sdtBanCuaBan);
		// loại những người đã là bạn của mình
		List<String> filteredList = sdtBanCuaBan.stream().filter(item -> !sdtBb.contains(item))
				.collect(Collectors.toList());

		System.out.println("sau khi loai nhung nguoi la ban cua minh còn: " + filteredList.size());

		// lấy danh sách lời mời kết bạn
		List<DanhSachKetBan> dskb = dskbDao.findFriends(sdtCN);
		List<String> danhSachLoiMoi = dskb.stream().map(loiMoi -> {
			if (loiMoi.getNguoiDung().getSdt().equals(sdt)) {
				return loiMoi.getNguoiDung().getSdt();
			} else {
				return loiMoi.getNguoiLa().getSdt();
			}
		}).collect(Collectors.toList());

		System.out.println("danh sách loi moi ket ban " + danhSachLoiMoi.size());
		// loại những người đã có trong danh sách kết bạn
		List<String> filteredList2 = filteredList.stream().filter(item -> !danhSachLoiMoi.contains(item))
				.collect(Collectors.toList());

		System.out.println("loai nhung nguoi trong danh sách loi moi ket ban" + filteredList2.size());
		model.addAttribute("list", nguoiDungDao.findNguoiDungBySdtIn(filteredList2));
		// lấy danh sách thông báo
		List<ThongBao> thongBao = thongBaoDao.findByUser(sdt, Sort.by(Direction.DESC, "ngayThongBao"));
		model.addAttribute("thongBao", thongBao);
		model.addAttribute("thongBaoChuaXem", "(" + thongBaoDao.demThongBaoChuaXem(sdt) + ")");
		return "GoiYKetBan";
	}

	@GetMapping("/GoiYKB/ketBan/{sdt}")
	public String themLoiMoiKetBan(@PathVariable("sdt") String sdt, Model m) {
		String sdtND = Session.get("sdt");
		NguoiDung nguoiDung = nguoiDungDao.getById(sdtND);
		NguoiDung nguoiLa = nguoiDungDAO.findBySdt(sdt);

		if (nguoiDung.equals(nguoiLa)) {
			m.addAttribute("message", "Lỗi bạn k tự kết bạn với chính mình");
			return "GoiYKetBan";
		}
		if (nguoiLa == null) {
			m.addAttribute("message", "Chưa có kết bạn ✪ ω ✪");
			return "GoiYKetBan";
		}
		// Kiểm tra xem đã tồn tại lời mời kết bạn giữa hai người dùng hay chưa
		DanhSachKetBan ds = dskbDao.getByNguoiLaAndNguoiDung(nguoiDung, nguoiLa);
		if (ds != null) {
			m.addAttribute("message", "Đã có lời mời trước đó");
			return "GoiYKetBan";
		}
		// Lưu thông tin lời mời vào CSDL
		ds = new DanhSachKetBan();
		ds.setNguoiDung(nguoiDung);
		ds.setNguoiLa(nguoiLa);
		ds.setNgayGui(new Date());
		dskbDao.saveAndFlush(ds);
		return "redirect:/GoiYKB";
	}

	@GetMapping("/GoiYKB/dongy/{maLoiMoi}")
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
		banBeDao.saveAndFlush(banBe);

		// thêm mình vào danh sách bạn bè của ng ta
		BanBe banBee = new BanBe();
		banBee.setNguoiDung(nguoiLa);
		banBee.setBanBe(nguoiDung);
		banBee.setNgayKb(new Date());
		banBeDao.saveAndFlush(banBee);
		dskbDao.deleteById(maLoiMoi);
		return "redirect:/GoiYKB";
	}

	@GetMapping("/GoiYKB/tuchoi/{maLoiMoi}")
	public String tuChoiKetBan(@PathVariable int maLoiMoi) {
		dskbDao.deleteById(maLoiMoi);
		return "redirect:/GoiYKB";
	}

	// Lấy dữ liệu người dùng đăng nhập vào trên Session
	public void DSBB(Model model) {
		String sdtCN = Session.get("sdt");
		NguoiDung dsNguoiDung2 = nguoiDungDao.findBySdt(sdtCN);
		model.addAttribute("dsNguoiDung2", dsNguoiDung2);
	}
}
