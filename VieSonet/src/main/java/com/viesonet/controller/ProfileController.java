package com.viesonet.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.viesonet.dao.BaiVietDao;
import com.viesonet.dao.BanBeDAO;
import com.viesonet.dao.CheDoDAO;
import com.viesonet.dao.DanhSachBinhLuanDAO;
import com.viesonet.dao.DanhSachKetBanDAO;
import com.viesonet.dao.DanhSachYeuThichDAO;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.BaiViet;
import com.viesonet.entity.BanBe;
import com.viesonet.entity.BinhLuanResponse;
import com.viesonet.entity.DanhSachBinhLuan;
import com.viesonet.entity.DanhSachKetBan;
import com.viesonet.entity.DanhSachYeuThich;
import com.viesonet.entity.NguoiDung;
import com.viesonet.service.ParamService;
import com.viesonet.service.SessionService;

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
	BaiVietDao baiVietDao;

	@Autowired
	BanBeDAO banBeDao;
	
	@Autowired
	DanhSachBinhLuanDAO dsblDao;

	@Autowired
	DanhSachKetBanDAO dskbDao;
	
	@Autowired
	DanhSachYeuThichDAO dsytDao;
	
	@Autowired
	CheDoDAO cheDoDao;
	
	@Autowired
	SessionService session;
	
	@Autowired
	ParamService param;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	
	@RequestMapping("/profile")
	public String index(Model m, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		String sdt = null;
		NguoiDung nguoiDung = null;
<<<<<<< HEAD
        // Kiểm tra có session chưa
=======
		List<BanBe> listBb = banBeDao.findFriendByUserphone(sdt);
		List<String> sdtBanBeList = listBb.stream().map(banBe -> banBe.getBanBe().getSdt())
				.collect(Collectors.toList());
//        // Kiểm tra có session chưa
>>>>>>> parent of 0c9f949 (change7)
        if (session.getAttribute("sdt") != null) {
            sdt = (String) session.getAttribute("sdt");
            nguoiDung = nguoiDungDao.findBySdt(sdt);
        } 
        // Nếu không có, kiểm tra cookie
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
        List<BanBe> listBb = banBeDao.findFriendByUserphone(sdt);
		List<String> sdtBanBeList = listBb.stream().map(banBe -> banBe.getBanBe().getSdt())
				.collect(Collectors.toList());
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
	
	//Đăng bài viết
	@PostMapping("/profile/dangbai")
	public String dangBai( @RequestParam("photo_file") MultipartFile photofile, Model m) {
		BaiViet baiDang = new BaiViet();
		if (photofile.isEmpty())
			baiDang.setHinhAnh("");
		else {
			baiDang.setHinhAnh(photofile.getOriginalFilename());
		}
		String sdt = session.get("sdt");
		int cheDo = param.getInt("cheDo", 1);
		// Lấy ngày và giờ hiện tại
		Calendar cal = Calendar.getInstance();
		Date ngayGioDang = cal.getTime();
		//Lấy thông tin từ input
		baiDang.setMoTa(param.getString("moTaBaiDang", ""));
		baiDang.setNgayDang(new Date());
		baiDang.setLuotThich(0);
		baiDang.setLuotBinhLuan(0);
		baiDang.setTrangThai(true);
		baiDang.setCheDo(cheDoDao.getById(cheDo));
		baiDang.setNguoiDung(nguoiDungDao.getById(sdt));
		if (baiDang.getMoTa().equals("") && baiDang.getHinhAnh().equals("")) {

		} else {
			baiVietDao.saveAndFlush(baiDang);
		}
		return "redirect:/profile";
	}
	
	
	//Chỉnh sửa ảnh đại diện
	@PostMapping("/profile/avatar")
	public String chinhSuaADD(Model m, @RequestParam("photo_file") MultipartFile photofile) {
	    String sdt = session.get("sdt");
	    NguoiDung add = nguoiDungDao.findBySdt(sdt);
	    if (!photofile.isEmpty()) {
	            add.setAnhDaiDien(photofile.getOriginalFilename());
	            nguoiDungDao.saveAndFlush(add);
	    }
	    return "redirect:/profile";
	}
	
	//Chỉnh sửa ảnh bìa
	@PostMapping("/profile/background")
	public String chinhSuaAB(Model m, @RequestParam("photo_file2") MultipartFile photofile) {
	    String sdt = session.get("sdt");
	    NguoiDung add = nguoiDungDao.findBySdt(sdt);
	    if (!photofile.isEmpty()) {
	            add.setAnhBia(photofile.getOriginalFilename());
	            nguoiDungDao.saveAndFlush(add);
	        
	    }
	    return "redirect:/profile";
	}
	
	//Cập nhật thông tin người dùng
	@PostMapping("/profile/update")
	public String chinhSuaTT(Model m,@ModelAttribute("nguoiDung") NguoiDung nguoiDung) {
		NguoiDung thongTin = new NguoiDung();
		String sdt = session.get("sdt");

		NguoiDung nguoiDungHienTai = nguoiDungDao.findBySdt(sdt);
		nguoiDungHienTai.setHoTen(nguoiDung.getHoTen());
	    nguoiDungHienTai.setEmail(nguoiDung.getEmail());
	    nguoiDungHienTai.setDiaChi(nguoiDung.getDiaChi());
	    nguoiDungHienTai.setGioiThieu(nguoiDung.getGioiThieu());
		nguoiDungDao.saveAndFlush(nguoiDungHienTai);
		return "redirect:/profile";
		
	}
	
	//Cập nhật thông tin bài viết
		@PostMapping("/baiviet/update/{maBaiViet}")
		public String chinhSuaBV(Model m,@RequestParam("photo_file")MultipartFile photofile, NguoiDung nguoiDung) {
			NguoiDung thongTin = new NguoiDung();
			BaiViet baiDang = new BaiViet();
			String sdt = session.get("sdt");

			NguoiDung nguoiDungHienTai = nguoiDungDao.findBySdt(sdt);
			nguoiDungHienTai.setHoTen(nguoiDung.getHoTen());
		    nguoiDungHienTai.setEmail(nguoiDung.getEmail());
		    nguoiDungHienTai.setDiaChi(nguoiDung.getDiaChi());
		    nguoiDungHienTai.setGioiThieu(nguoiDung.getGioiThieu());
			nguoiDungDao.saveAndFlush(nguoiDungHienTai);
			
			
			if (photofile.isEmpty())
				baiDang.setHinhAnh("");
			else {
				baiDang.setHinhAnh(photofile.getOriginalFilename());
			}
			int cheDo = param.getInt("cheDo", 1);
			// Lấy ngày và giờ hiện tại
			Calendar cal = Calendar.getInstance();
			Date ngayGioDang = cal.getTime();
			//Lấy thông tin từ input
			baiDang.setMoTa(param.getString("moTaBaiDang", ""));
			baiDang.setNgayDang(new Date());
			baiDang.setLuotThich(0);
			baiDang.setLuotBinhLuan(0);
			baiDang.setTrangThai(true);
			baiDang.setCheDo(cheDoDao.getById(cheDo));
			baiDang.setNguoiDung(nguoiDungDao.getById(sdt));
			if (baiDang.getMoTa().equals("") && baiDang.getHinhAnh().equals("")) {

			} else {
				baiVietDao.saveAndFlush(baiDang);
			}
			return "redirect:/profile";
			
		}
	
	@PostMapping("/profile/thembinhluan/{maBaiViet}")
	@ResponseBody
<<<<<<< HEAD
	public String themBinhLuan(@PathVariable int maBaiViet, @RequestParam("binhLuanCuaToi") String binhLuan) {
	    // Xử lý logic thêm bình luận
	    String sdt = session.get("sdt");
	    DanhSachBinhLuan entity = new DanhSachBinhLuan();
	    entity.setBaiViet(baiVietDao.getById(maBaiViet));
	    entity.setChiTiet(binhLuan);
	    entity.setNgayBinhLuan(new Date());
	    entity.setNguoiDung(nguoiDungDao.getById(sdt));
	    dsblDao.saveAndFlush(entity);
	    return "ok";
=======
	@GetMapping("/profile/binhluan/{maBaiViet}")
	public BinhLuanResponse xemBinhLuanCN(@PathVariable int maBaiViet) {
		Object baiViet = baiVietDao.findBaiVietByMaBaiViet(maBaiViet);
		List<Object> danhSachBinhLuan = dsblDao.findBinhLuanByMaBaiViet(maBaiViet);
		return new BinhLuanResponse(baiViet, danhSachBinhLuan);
>>>>>>> parent of 0c9f949 (change7)
	}
	
	@GetMapping("profile/thich/{maBaiViet}")
	public void thichBaiViet(@PathVariable int maBaiViet) {
		String sdt = session.get("sdt");
		DanhSachYeuThich baiVietYeuThich = dsytDao.findByKey(sdt, maBaiViet);
		if(baiVietYeuThich == null) {
			baiVietYeuThich = new DanhSachYeuThich();
			baiVietYeuThich.setNgayYeuThich(new Date());
			baiVietYeuThich.setBaiViet(baiVietDao.getById(maBaiViet));
			baiVietYeuThich.setNguoiDung(nguoiDungDao.getById(sdt));
			dsytDao.saveAndFlush(baiVietYeuThich);
		}else {
			baiVietYeuThich.setNgayYeuThich(new Date());
			baiVietYeuThich.setBaiViet(baiVietDao.getById(maBaiViet));
			baiVietYeuThich.setNguoiDung(nguoiDungDao.getById(sdt));
			dsytDao.delete(baiVietYeuThich);
		}
	}
	
}
