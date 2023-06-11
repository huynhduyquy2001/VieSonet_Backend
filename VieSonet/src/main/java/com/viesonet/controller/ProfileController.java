package com.viesonet.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
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
       // Kiểm tra có session chưa
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
//			System.out.println(topKetBan.size());
			
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
//		@PostMapping("/baiviet/update/{maBaiViet}")
//		@ResponseBody
//		public String chinhSuaBV(Model m,@RequestParam("photo_file") MultipartFile photofile,@RequestParam("moTaBaiDang") String moTaBaiDang,@PathVariable int maBaiViet) {
//			String sdt = session.get("sdt");
//			BaiViet baiDang = baiVietDao.getById(maBaiViet);
//			// Lấy ngày và giờ hiện tại
//			Calendar cal = Calendar.getInstance();
//			Date ngayGioDang = cal.getTime();
//			//Lấy thông tin từ input
//			
//			System.out.println("Ma BV: "+baiDang.getMaBaiViet());
//			int cheDo = param.getInt("cheDo", 1);
//			baiDang.setMoTa(moTaBaiDang);
//			baiDang.setCheDo(cheDoDao.getById(cheDo));
//			baiDang.setNguoiDung(nguoiDungDao.getById(sdt));
//			if (photofile.isEmpty())
//				baiDang.setHinhAnh("");
//			else {
//				baiDang.setHinhAnh(photofile.getOriginalFilename());
//			}
//			if (baiDang.getMoTa().equals("") && baiDang.getHinhAnh().equals("")) {
//
//			} else {
//				baiVietDao.saveAndFlush(baiDang);
//			}
//			return "redirect:/profile";
//			
//		}
	
	@GetMapping("/baiviet/view/{maBaiViet}")
	@ResponseBody
	public BinhLuanResponse xemBaiVietChiTiet(@PathVariable int maBaiViet) {
		Object baiViet = baiVietDao.findBaiVietByMaBaiViet(maBaiViet);
		List<Object> danhSachBinhLuan = dsblDao.findBinhLuanByMaBaiViet(maBaiViet, Sort.by(Direction.DESC, "ngayBinhLuan"));
		return new BinhLuanResponse(baiViet, danhSachBinhLuan);
	}	
	
	@PostMapping("/profile/thembinhluan/{maBaiViet}")
	@ResponseBody
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
	}
	
	@GetMapping("/profile/binhluan/{maBaiViet}")
	@ResponseBody
	public BinhLuanResponse xemBinhLuanCN(@PathVariable int maBaiViet) {
		Object baiViet = baiVietDao.findBaiVietByMaBaiViet(maBaiViet);
		List<Object> danhSachBinhLuan = dsblDao.findBinhLuanByMaBaiViet(maBaiViet, Sort.by(Direction.DESC, "ngayBinhLuan"));
		return new BinhLuanResponse(baiViet, danhSachBinhLuan);
	}
	
	@GetMapping("profile/thich/{maBaiViet}")
	@ResponseBody
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
	//Lấy thông tin người dùng khác
	@GetMapping("/nguoiDung/{sdt}")
	public String getNguoiDung(@PathVariable("sdt") String sdtLa, Model m) {
		String sdtHt = session.get("sdt");
		NguoiDung nguoiDung = nguoiDungDao.findBySdt(sdtHt);
		NguoiDung nguoiDungLa = nguoiDungDao.findBySdt(sdtLa);
        List<BanBe> listBb = banBeDao.findFriendByUserphone(sdtLa);
		List<Order> orders = new ArrayList<Order>();
		// Số lượng bạn bè
		
		orders.add(new Order(Direction.DESC, "ngayDang"));
		Sort sort = Sort.by(orders);
		if(nguoiDung.equals(nguoiDungLa)) {
			//Chọn tự click bản thân sẽ về trang cá nhân
			return "redirect:/profile";
		}else {
			m.addAttribute("nguoiDung", nguoiDungDao.findBySoDienThoai(sdtLa));
			m.addAttribute("nguoiDungHienTai", nguoiDungDao.findBySoDienThoai(sdtHt));
			m.addAttribute("BaiVietCaNhan", baiVietDao.findBySdt(sdtLa, sort));
			m.addAttribute("SlBanbe", listBb.size());
			List<BanBe> list = banBeDao.findFriends(sdtLa);
			List<DanhSachKetBan> dsKb = dskbDao.findFriends(sdtLa);
			
		    

			//Kiểm tra có phải bạn bè hay người lạ
			boolean checker = false;
			//Phân biệt 3 trạng thái sau khi phân biệt bạn hay người lạ
			//+ 0: Chưa kết bạn và không có gửi lời mời từ 2 phía
			//+ 1: Chưa kết bạn nhưng người dùng gửi lời mời cho người lạ
			//+ 2: Chưa kết bạn nhưng người lạ gửi lời mời cho người dùng
			int trangThai = 0;
			//Đưa vòng lặp kiểm tra 2 chiều(Vì hiển thị giống nên không sao)
			for (BanBe banBe : list) {
			    if ((banBe.getNguoiDung().getSdt().equals(sdtHt) && banBe.getBanBe().getSdt().equals(sdtLa)) || 
			    	(banBe.getNguoiDung().getSdt().equals(sdtLa) && banBe.getBanBe().getSdt().equals(sdtHt))	) {
			        // Nếu tìm thấy số điện thoại trùng, đánh dấu là có
			        checker = true;
			        // Dừng vòng lặp
			        break;
			    }
			}
			m.addAttribute("checker", checker);
			//Điều kiện là chưa kết bạn với nhau
			if(checker==false) {
				//Có 3 điều kiện khác nhau đã nêu trên
				for(DanhSachKetBan dskb : dsKb) {
					if ((dskb.getNguoiDung().getSdt().equals(sdtHt) && dskb.getNguoiLa().getSdt().equals(sdtLa)) ) {
					        // Trạng thái 2: Chưa kết bạn nhưng người dùng gửi lời mời từ người lạ
					        trangThai = 2;
					        Integer maLoiMoi = dskb.getMaLoiMoi();
					        m.addAttribute("lmkb", maLoiMoi);
					        System.out.println("maLoiMoi: " + maLoiMoi);
					        // Dừng vòng lặp
					        break;
					} else if (dskb.getNguoiDung().getSdt().equals(sdtLa) && dskb.getNguoiLa().getSdt().equals(sdtHt)) {
							// Trạng thái 1: Chưa kết bạn nhưng người lạ gửi lời mời cho người dùng
							trangThai = 1;
							// Dừng vòng lặp
							break;
					}
				}
			}
			m.addAttribute("trangThai", trangThai);
			// Số lượng bạn bè
			return "trangCaNhanNguoiDungKhac";	
		}
	}
	@GetMapping("profile/dongy/{maLoiMoi}")
	public String dongYKetBan(@PathVariable int maLoiMoi) {
		String sdt = session.get("sdt");
		NguoiDung nguoiDung = nguoiDungDao.getById(sdt);
		DanhSachKetBan ds = dskbDao.getById(maLoiMoi);
		NguoiDung nguoiLa = ds.getNguoiLa();
		BanBe banBe = new BanBe();
		banBe.setNguoiDung(nguoiDung);
		banBe.setBanBe(nguoiLa);
		banBe.setNgayKb(new Date());
		banBeDao.saveAndFlush(banBe);
		dskbDao.deleteById(maLoiMoi);
		return "redirect:/nguoiDung";
	}
	
	@GetMapping("profile/tuchoi/{lmkb}/nguoiDung/{nguoiDung}")
	public String tuChoiKetBan(@PathVariable int lmkb, @PathVariable String nguoiDung) {
//		System.out.println("maLoiMoi: " + maLoiMoi);
		dskbDao.deleteById(lmkb);
		System.out.println("nguoiDung: " + nguoiDung);
		System.out.println("lmkb: " + lmkb);
		System.out.println("redirect:/nguoiDung/{" + nguoiDung + "}");
		return "redirect:/nguoiDung/" + nguoiDung;
	}	
	
}
