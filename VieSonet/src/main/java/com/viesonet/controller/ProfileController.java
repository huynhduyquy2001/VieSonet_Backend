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
import com.viesonet.dao.DanhSachBinhLuanDAO;
import com.viesonet.dao.DanhSachKetBanDAO;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.BaiViet;
import com.viesonet.entity.BanBe;
import com.viesonet.entity.BinhLuanResponse;
import com.viesonet.entity.DanhSachKetBan;
import com.viesonet.entity.NguoiDung;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@Controller
public class ProfileController {
	@Autowired
	NguoiDungDAO nguoiDungDao;

	@Autowired
	BaiVietDAO baiVietDao;

	@Autowired
	BanBeDAO banBeDao;
	
	@Autowired
	DanhSachBinhLuanDAO dsblDao;

	@Autowired
	DanhSachKetBanDAO dskbDao;
	
//	String sdt = "0939790002";
//	NguoiDung nguoiDung = null;
	@RequestMapping("/profile")
	public String index(Model m, HttpServletRequest request, HttpServletResponse response) {
		List<BanBe> listBb = banBeDao.findFriendByUserphone("0939790002");
		List<String> sdtBanBeList = listBb.stream().map(banBe -> banBe.getBanBe().getSdt())
				.collect(Collectors.toList());
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		String sdt = "0939790002";
		NguoiDung nguoiDung = null;
//		m.addAttribute("list", list);
//        // Kiểm tra có session chưa
        if (session.getAttribute("sdt") != null) {
            sdt = (String) session.getAttribute("sdt");
            nguoiDung = nguoiDungDao.findBySdt(sdt);
        } 
//        // Nếu không có, kiểm tra cookie
        else if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("sdt")) {
                    sdt = cookie.getValue();
                    nguoiDung = nguoiDungDao.findBySdt(sdt);
                    session.setAttribute("sdt", sdt);
                    break;
                }
            }
        }
		//Nào có đăng nhập thì đổi
		if (nguoiDung != null) {
		//Sắp xếp giảm dần theo ngày đăng
			List<Order> orders = new ArrayList<Order>();
			orders.add(new Order(Direction.DESC, "ngayDang"));
			Sort sort = Sort.by(orders);
		//Load bài viết cá nhân
			m.addAttribute("BaiVietCaNhan", baiVietDao.findBySdt(sdt, sort));
			m.addAttribute("nguoiDung", nguoiDungDao.findBySoDienThoai(sdt));
			
			List<BanBe> topBanBe = new ArrayList<>();
			for (int i = 0; i < Math.min(5, listBb.size()); i++) {
				topBanBe.add(listBb.get(i));
			}
			m.addAttribute("topBanbe", topBanBe);
			// Số lượng bạn bè
			m.addAttribute("SlBanbe", listBb.size());
			// danh sách kết bạn
			List<DanhSachKetBan> danhSachKetBan = dskbDao.findDsBySdt(sdt);
			m.addAttribute("SlKb", danhSachKetBan.size());
			List<DanhSachKetBan> topKetBan = new ArrayList<>();
			for (int i = 0; i < Math.min(3, danhSachKetBan.size()); i++) {
				topKetBan.add(danhSachKetBan.get(i));
			}
			m.addAttribute("topKetBan", topKetBan);
			System.out.println(topKetBan.size());
			
		}

		// Nếu không, chuyển hướng về trang chủ
		return "trangCaNhan";
	}
//	@RequestMapping("/profile/update/{sdt}")
//	public String update(Model m) {
//		m.addAttribute("nguoiDung", nguoiDungDao.findBySoDienThoai("0939790002"));
//		nguoiDungDao.saveAndFlush("");
//		return "redirect:/profile";
//	}
	
	@ResponseBody
	@GetMapping("/binhluan-profile/{maBaiViet}")
	public BinhLuanResponse xemBinhLuanCaNhan(@PathVariable int maBaiViet) {

		Object baiViet = baiVietDao.findBaiVietByMaBaiViet(maBaiViet);
		List<Object> danhSachBinhLuan = dsblDao.findBinhLuanByMaBaiViet(maBaiViet);

		return new BinhLuanResponse(baiViet, danhSachBinhLuan);
	}
	
	@RequestMapping("/nguoidung/update/{sdt}")
    public String thaydoiNguoiDung(@ModelAttribute("sdt") NguoiDung nguoiDung) {
        nguoiDungDao.saveAndFlush(nguoiDung);
        return "redirect:/profile";
    }
	
	@PostMapping("index/dangbai")
	public String dangBai( @RequestParam("photo_file") MultipartFile photofile, Model m) {
		BaiViet baiDang = new BaiViet();
		if (photofile.isEmpty())
			baiDang.setHinhAnh("");
		else {
			baiDang.setHinhAnh(photofile.getOriginalFilename());
		}
		String sdt = session.get("sdt");
		int cheDo = paramService.getInt("cheDo", 1);
		baiDang.setMoTa(paramService.getString("moTaBaiDang", ""));
		baiDang.setNgayDang(new Date());
		baiDang.setLuotThich(0);
		baiDang.setLuotBinhLuan(0);
		baiDang.setTrangThai(true);
		baiDang.setCheDo(cheDoDao.getById(cheDo));
		baiDang.setNguoiDung(nguoiDungDAO.getById(sdt));
		baiVietDao.saveAndFlush(baiDang);
		return "redirect:/";
		
	}
	
//	@PostMapping("/capnhatnguoidung")
//	public String capNhatNguoiDung(@ModelAttribute("nguoiDung") NguoiDung nguoiDung, Model model) {
//		
//		
//	}
}
