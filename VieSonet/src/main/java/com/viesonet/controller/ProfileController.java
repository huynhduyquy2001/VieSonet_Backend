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
import com.viesonet.entity.CheDo;
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
            NguoiDung taiKhoan = nguoiDungDao.getById(sdt);
    		m.addAttribute("taiKhoan", taiKhoan);
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
			List<BaiViet> listBv = baiVietDao.findBySdt(sdt, sort);
			List<BaiViet> danhSachBaiVietCty = new ArrayList<>();
		//Load bài viết cá nhân
			
			//Kiểm tra bài viết 
			for(BaiViet bv : listBv) {
				Boolean trangThaiBv = bv.getTrangThai();
				if(trangThaiBv) {
					//Lấy chế độ bài viết
					danhSachBaiVietCty.add(bv); 
				} else {
					danhSachBaiVietCty.remove(bv); 
				}	
			}
			//Hiển thị bài viết
			m.addAttribute("BaiVietCaNhan", danhSachBaiVietCty);
			
			
			
			
//			m.addAttribute("BaiVietCaNhan", baiVietDao.findBySdt(sdt, sort));
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
			List<DanhSachKetBan> danhSachKetBan1 = dskbDao.findDsBySdttest(sdt);
			m.addAttribute("SlKb", danhSachKetBan1.size());
			List<DanhSachKetBan> topKetBan = new ArrayList<>();
			for (int i = 0; i < Math.min(3, danhSachKetBan1.size()); i++) {
				topKetBan.add(danhSachKetBan1.get(i));
			}
			m.addAttribute("topKetBan", topKetBan);
//			System.out.println(topKetBan.size());
			
		}

		// Nếu không, chuyển hướng về trang chủ
		return "trangCaNhan";
	}
	
	//Đăng bài viết
	@PostMapping("/profile/dangbai")
	public String dangBai( @RequestParam("photo_file") MultipartFile photofile,@RequestParam("cheDo") int selectedValue ,Model m) {
		BaiViet baiDang = new BaiViet();
		if (photofile.isEmpty())
			baiDang.setHinhAnh("");
		else {
			baiDang.setHinhAnh(photofile.getOriginalFilename());
		}
		String sdt = session.get("sdt");
		int cheDo = param.getInt("cheDo", selectedValue);
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
	@GetMapping("/profile/anbaiviet/{maBaiViet}")
	public String anBaiViet(Model m, @PathVariable int maBaiViet) {
		BaiViet baiDang = baiVietDao.getById(maBaiViet);
		String sdt = session.get("sdt");
		baiDang.setTrangThai(false);
//		baiDang.setNguoiDung(nguoiDungDao.getById(sdt));
		baiVietDao.saveAndFlush(baiDang);
		return "redirect:/profile";
	}
	
	
	//Chỉnh sửa ảnh đại diện
	@PostMapping("/profile/avatar")
	public String chinhSuaADD(Model m, @RequestParam("photo_file") MultipartFile photofile) {
	    String sdt = session.get("sdt");
	    BaiViet baiDang = new BaiViet();
	    int cheDo = param.getInt("cheDo", 1);
	    Calendar cal = Calendar.getInstance();
		Date ngayGioDang = cal.getTime();
	    NguoiDung add = nguoiDungDao.findBySdt(sdt);
	    if (!photofile.isEmpty()) {
	            add.setAnhDaiDien(photofile.getOriginalFilename());
	            baiDang.setHinhAnh(photofile.getOriginalFilename());
	            baiDang.setMoTa(param.getString("moTaBaiViet", ""));
	    		baiDang.setNgayDang(new Date());
	    		baiDang.setLuotThich(0);
	    		baiDang.setLuotBinhLuan(0);
	    		baiDang.setTrangThai(true);
	    		baiDang.setCheDo(cheDoDao.getById(cheDo));
	    		baiDang.setNguoiDung(nguoiDungDao.getById(sdt));
	            nguoiDungDao.saveAndFlush(add);
	            baiVietDao.saveAndFlush(baiDang);
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
	    nguoiDungHienTai.setMoiQuanHe(nguoiDung.getMoiQuanHe());
	    nguoiDungHienTai.setDiaChi(nguoiDung.getDiaChi());
	    nguoiDungHienTai.setGioiThieu(nguoiDung.getGioiThieu());
		nguoiDungDao.saveAndFlush(nguoiDungHienTai);
		return "redirect:/profile";
		
	}
	
//	//Đăng xuất
//	@GetMapping("/dangxuat")
//	public String dangXuat() {
//		session.remove("sdt");
//		session.remove("vt");
//		return "redirect:/dangnhap";
//	}
	
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
	
	@GetMapping("/profile/xoabinhluan/{maBaiViet}/{maBinhLuan}")
	@ResponseBody
	public BinhLuanResponse xoaBinhLuanCN(@PathVariable int maBaiViet,@PathVariable int maBinhLuan) {
		dsblDao.deleteById(maBinhLuan);
		Object baiViet = baiVietDao.findBaiVietByMaBaiViet(maBaiViet);
		List<Object> danhSachBinhLuan = dsblDao.findBinhLuanByMaBaiViet(maBaiViet, Sort.by(Direction.DESC, "ngayBinhLuan"));
		return new BinhLuanResponse(baiViet, danhSachBinhLuan);
	}
	
	@PostMapping("/profile/suabinhluan/{maBaiViet}")
	@ResponseBody
	public String chinhSuaBinhLuan(@PathVariable int maBaiViet, @RequestParam("binhLuanCuaToi") String binhLuan) {
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
		return "redirect:/profile";
	}
	
	@GetMapping("profile/tuchoi/{maLoiMoi}")
	public String tuChoiKetBan(@PathVariable int maLoiMoi) {
		dskbDao.deleteById(maLoiMoi);
		return "redirect:/profile";
	}
	
	//---------------------------------Người dùng khác-------------------------------------------//
	//Lấy thông tin người dùng khác
	@GetMapping("/nguoiDung/{sdt}")
	public String getNguoiDung(@PathVariable("sdt") String sdtLa, Model m) {
		String sdtHt = session.get("sdt");
		BaiViet baiViet = new BaiViet();
		NguoiDung nguoiDung = nguoiDungDao.findBySdt(sdtHt);
		NguoiDung nguoiLa = nguoiDungDao.findBySdt(sdtLa);
		List<Order> orders = new ArrayList<Order>();
		orders.add(new Order(Direction.DESC, "ngayDang"));
		Sort sort = Sort.by(orders);
		//danh sách bạn của người lạ
        List<BanBe> listBb = banBeDao.findFriendByUserphone(sdtLa);
        //danh sách bài viết
        List<BaiViet> listBv = baiVietDao.findBySdt(sdtLa, sort);
        //
        List<BanBe> listbb = banBeDao.findFriends(sdtLa);
        
        NguoiDung taiKhoan = nguoiDungDao.getById(sdtHt);
		m.addAttribute("taiKhoan", taiKhoan);
		// Số lượng bạn bè
		if(nguoiDung.equals(nguoiLa)) {
			//Trả về trang cá nhân
			return "redirect:/profile";
		}else {
			//Lấy sdt người dùng khác
			m.addAttribute("nguoiDung", nguoiDungDao.findBySoDienThoai(sdtLa));
			
			//Lấy sdt bản thân
			
			m.addAttribute("nguoiDungHienTai", nguoiDungDao.findBySoDienThoai(sdtHt));
			//Đưa vào danh sách mới
			List<BaiViet> danhSachBaiVietCty = new ArrayList<>();
			
			//Kiểm tra bài viết 
			for(BaiViet bv : listBv) {
				Boolean trangThaiBv = bv.getTrangThai();
				if(trangThaiBv) {
					//Lấy chế độ bài viết
					String tenCheDo = bv.getCheDo().getTenCheDo();
					//Thích thì xem luôn mã bài viết
					int maBaiViet = bv.getMaBaiViet();
					System.out.println("Chế độ bài viết "+maBaiViet+" "+tenCheDo);
					if (tenCheDo.equals("Công khai")) {
						//Thêm vào ArraysList tạm thời
				        danhSachBaiVietCty.add(bv);
				    } else if (tenCheDo.equals("Bạn bè")){
				    	boolean baiVietChinhXac = false;
				        for (BanBe banBe : listbb) {
				            if (((banBe.getNguoiDung().getSdt().equals(sdtHt) && banBe.getBanBe().getSdt().equals(sdtLa)) || 
				                 (banBe.getNguoiDung().getSdt().equals(sdtLa) && banBe.getBanBe().getSdt().equals(sdtHt)))) {
				                baiVietChinhXac = true;
				                break;
				            }
				        }
				        if (baiVietChinhXac) {
				            danhSachBaiVietCty.add(bv);
				        }
				    }
					else if (tenCheDo.equals("Chỉ mình tôi")) {
				    	//Loại bỏ bài viết chỉ mình tôi
				    	danhSachBaiVietCty.remove(bv); 
				    }
				} else {
					danhSachBaiVietCty.remove(bv); 
				}	
			}
			//Hiển thị bài viết
			m.addAttribute("BaiVietCaNhan", danhSachBaiVietCty);
//			m.addAttribute("BaiVietCaNhan", baiVietDao.findBySdt(sdtLa, sort));
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
			    if (((banBe.getNguoiDung().getSdt().equals(sdtHt) && banBe.getBanBe().getSdt().equals(sdtLa)) || 
			    	(banBe.getNguoiDung().getSdt().equals(sdtLa) && banBe.getBanBe().getSdt().equals(sdtHt)))	) {
			        // Nếu tìm thấy số điện thoại trùng, đánh dấu là có
			        checker = true;
			        int maBanBe = banBe.getMaBanBe();
			        System.out.println("maLoiMoi: " + maBanBe);
			        m.addAttribute("mbb", maBanBe);
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
							// Trạng thái 1: Chưa kết bạn nhưng người lạ gửi lời mời cho người dùng
					        trangThai = 1;
					        //Lấy mã lời mời kết bạn
					        Integer maLoiMoi = dskb.getMaLoiMoi();
					        m.addAttribute("lmkb", maLoiMoi);
					        System.out.println("maLoiMoi: " + maLoiMoi);
					        // Dừng vòng lặp
					        break;
					} if (dskb.getNguoiDung().getSdt().equals(sdtLa) && dskb.getNguoiLa().getSdt().equals(sdtHt)) {
							// Trạng thái 2: Chưa kết bạn nhưng người dùng gửi lời mời từ người lạ
							trangThai = 2;
							//Lấy mã lời mời kết bạn
							Integer maLoiMoi = dskb.getMaLoiMoi();
							m.addAttribute("lmkb", maLoiMoi);
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
	
	//Đồng ý kết bạn từ trang người dùng khác
	@GetMapping("profile/dongy/{lmkb}/nguoiDung/{nguoiDung}")
	public String dongYKetBan(@PathVariable("nguoiDung") String sdt,@PathVariable int lmkb) {
		String sdtHt = session.get("sdt");
		NguoiDung nguoiDung = nguoiDungDao.getById(sdtHt);
//		DanhSachKetBan ds = dskbDao.getById(lmkb);
		NguoiDung nguoiDungLa = nguoiDungDao.findBySdt(sdt);	
		BanBe banBe = new BanBe();
		banBe.setNguoiDung(nguoiDung);
		banBe.setBanBe(nguoiDungLa);
		banBe.setNgayKb(new Date());
		banBeDao.saveAndFlush(banBe);
		dskbDao.deleteById(lmkb);
		return "redirect:/nguoiDung/" + sdt;
	}
	
	//Từ chối kết bạn từ trang người dùng khác
	@GetMapping("profile/tuchoi/{lmkb}/nguoiDung/{nguoiDung}")
	public String tuChoiKetBan(@PathVariable int lmkb, @PathVariable String nguoiDung) {
		dskbDao.deleteById(lmkb);
		return "redirect:/nguoiDung/" + nguoiDung;
	}	
	
	//Gửi lời mời kết bạn 
	@GetMapping("profile/guiLmkb/{nguoiDung}")
	public String guiLoiMoiKetBan(@PathVariable String nguoiDung,@PathVariable("nguoiDung") String sdt) {
		String sdtHt = session.get("sdt");
		DanhSachKetBan ds = new DanhSachKetBan();
		NguoiDung nguoiDungHT = nguoiDungDao.getById(sdtHt);
		NguoiDung nguoiLa = nguoiDungDao.findBySdt(sdt);
		ds.setNguoiDung(nguoiDungHT);
		ds.setNguoiLa(nguoiLa);
		ds.setNgayGui(new Date());
		dskbDao.saveAndFlush(ds);
		return "redirect:/nguoiDung/" + nguoiDung;
	}	
	
	//Hủy kết bạn
	@GetMapping("profile/huyketban/{nguoiDung}/{mbb}")
	public String huyKetBan(@PathVariable int mbb, @PathVariable String nguoiDung) {
		banBeDao.deleteById(String.valueOf(mbb));
		return "redirect:/nguoiDung/" + nguoiDung;
	}
	
}
