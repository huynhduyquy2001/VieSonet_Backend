package com.viesonet.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.viesonet.dao.BaiVietDao;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.dao.BaiVietDao;
import com.viesonet.dao.BanBeDAO;
import com.viesonet.dao.CheDoDAO;
import com.viesonet.dao.DanhSachBinhLuanDAO;
import com.viesonet.dao.DanhSachKetBanDAO;
import com.viesonet.dao.DanhSachYeuThichDAO;
import com.viesonet.entity.BaiViet;
import com.viesonet.entity.BanBe;
import com.viesonet.entity.BinhLuanResponse;
import com.viesonet.entity.DanhSachBinhLuan;
import com.viesonet.entity.DanhSachKetBan;
import com.viesonet.entity.DanhSachYeuThich;
import com.viesonet.entity.NguoiDung;
import com.viesonet.service.ParamService;
import com.viesonet.service.SessionService;

@Controller
public class IndexController {
	@Autowired
	BaiVietDao baiVietDao;

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
	CheDoDAO cheDoDao;

	@Autowired
	SessionService session;

	@Autowired
	ParamService paramService;

	// lấy thông tin người dùng

	@RequestMapping("/index")
	public String getBaiVietCuaBanBe(Model m) {
		String sdt = session.get("sdt");
		NguoiDung taiKhoan = nguoiDungDAO.getById(sdt);
		
		// lấy danh sách bài viết từ danh sách bạn bè
		List<BanBe> listBb = banBeDao.findFriendByUserphone(sdt);
		List<String> sdtBanBeList = listBb.stream().map(banBe -> banBe.getBanBe().getSdt())
				.collect(Collectors.toList());

		List<Order> orders = new ArrayList<Order>();
		orders.add(new Order(Direction.DESC, "ngayDang"));
		Sort sort = Sort.by(orders);
		List<BaiViet> dsBaiViet = baiVietDao.findByNguoiDungSdtIn(sdtBanBeList, Sort.by(Direction.DESC, "ngayDang"));
		m.addAttribute("DanhSachBv", dsBaiViet);
		
		//Lấy danh sách bài viết đã thích
		
		Set<Integer> maBaiVietDaThich = new HashSet<>();
		List<DanhSachYeuThich> dsyt = dsytDao.findBySdt(sdt);
		for (DanhSachYeuThich ds : dsyt) {
		    int maBaiViet = ds.getBaiViet().getMaBaiViet();
		    maBaiVietDaThich.add(maBaiViet);
		    System.out.println(maBaiViet);
		}
		m.addAttribute("maBaiVietDaThich", maBaiVietDaThich);
		

		
		// lấy một vài bạn bè từ danh sách bạn bè
		List<BanBe> topBanBe = new ArrayList<>();
		for (int i = 0; i < Math.min(5, listBb.size()); i++) {
			topBanBe.add(listBb.get(i));
		}
		m.addAttribute("topBanbe", topBanBe);
		// Số lượng bạn bè
		m.addAttribute("SlBanbe", listBb.size());
		// danh sách kết bạn
		List<DanhSachKetBan> danhSachKetBan = dskbDao.findDsBySdt("0939790002");
		m.addAttribute("SlKb", danhSachKetBan.size());
		List<DanhSachKetBan> topKetBan = new ArrayList<>();
		for (int i = 0; i < Math.min(3, danhSachKetBan.size()); i++) {
			topKetBan.add(danhSachKetBan.get(i));
		}
		m.addAttribute("topKetBan", topKetBan);
		System.out.println(topKetBan.size());
		return "index";
	}

	@ResponseBody
	@GetMapping("/binhluan/{maBaiViet}")
	public BinhLuanResponse xemBinhLuan(@PathVariable int maBaiViet) {
		Object baiViet = baiVietDao.findBaiVietByMaBaiViet(maBaiViet);
		List<Object> danhSachBinhLuan = dsblDao.findBinhLuanByMaBaiViet(maBaiViet, Sort.by(Direction.DESC, "ngayBinhLuan"));
		return new BinhLuanResponse(baiViet, danhSachBinhLuan);
	}

	@PostMapping("index/dangbai")
	@ResponseBody
	public String dangBai(@RequestParam("photo_file") MultipartFile photofile) {
		BaiViet baiDang = new BaiViet();
		if (photofile.isEmpty()) {
			baiDang.setHinhAnh("");
		} else {
			baiDang.setHinhAnh(photofile.getOriginalFilename());
		}
		String sdt = session.get("sdt");
		int cheDo = paramService.getInt("cheDo", 1);
		baiDang.setMoTa(paramService.getString("moTaBaiDang", ""));
		// Lấy ngày và giờ hiện tại
		Calendar cal = Calendar.getInstance();
		Date ngayGioDang = cal.getTime();

		// Chuyển đổi sang kiểu Timestamp
		Timestamp timestamp = new Timestamp(ngayGioDang.getTime());
		baiDang.setNgayDang(timestamp);
		baiDang.setLuotThich(0);
		baiDang.setLuotBinhLuan(0);
		baiDang.setTrangThai(true);
		baiDang.setCheDo(cheDoDao.getById(cheDo));
		baiDang.setNguoiDung(nguoiDungDAO.getById(sdt));
		if (baiDang.getMoTa().equals("") && baiDang.getHinhAnh().equals("")) {

		} else {
			baiVietDao.saveAndFlush(baiDang);
		}
		return "Bài viết đã được đăng thành công!";
	}
	@GetMapping("index/dongy/{maLoiMoi}")
	public String dongYKetBan(@PathVariable int maLoiMoi) {
		String sdt = session.get("sdt");
		NguoiDung nguoiDung = nguoiDungDAO.getById(sdt);
		DanhSachKetBan ds = dskbDao.getById(maLoiMoi);
		NguoiDung nguoiLa = ds.getNguoiLa();
		BanBe banBe = new BanBe();
		banBe.setNguoiDung(nguoiDung);
		banBe.setBanBe(nguoiLa);
		banBe.setNgayKb(new Date());
		banBeDao.saveAndFlush(banBe);
		dskbDao.deleteById(maLoiMoi);
		return "redirect:/index";
	}
	@GetMapping("index/tuchoi/{maLoiMoi}")
	public String tuChoiKetBan(@PathVariable int maLoiMoi) {
		dskbDao.deleteById(maLoiMoi);
		return "redirect:/index";
	}
	
	@GetMapping("index/thich/{maBaiViet}")
	public void thichBaiViet(@PathVariable int maBaiViet) {
		String sdt = session.get("sdt");
		DanhSachYeuThich baiVietYeuThich = dsytDao.findByKey(sdt, maBaiViet);
		if(baiVietYeuThich == null) {
			baiVietYeuThich = new DanhSachYeuThich();
			baiVietYeuThich.setNgayYeuThich(new Date());
			baiVietYeuThich.setBaiViet(baiVietDao.getById(maBaiViet));
			baiVietYeuThich.setNguoiDung(nguoiDungDAO.getById(sdt));
			dsytDao.saveAndFlush(baiVietYeuThich);
		}else {
			baiVietYeuThich.setNgayYeuThich(new Date());
			baiVietYeuThich.setBaiViet(baiVietDao.getById(maBaiViet));
			baiVietYeuThich.setNguoiDung(nguoiDungDAO.getById(sdt));
			dsytDao.delete(baiVietYeuThich);
		}
	}
	
	@PostMapping("/index/thembinhluan/{maBaiViet}")
	@ResponseBody
	public String themBinhLuan(@PathVariable int maBaiViet, @RequestParam("binhLuanCuaToi") String binhLuan) {
	    // Xử lý logic thêm bình luận
	    String sdt = session.get("sdt");
	    DanhSachBinhLuan entity = new DanhSachBinhLuan();
	    entity.setBaiViet(baiVietDao.getById(maBaiViet));
	    entity.setChiTiet(binhLuan);
	    entity.setNgayBinhLuan(new Date());
	    entity.setNguoiDung(nguoiDungDAO.getById(sdt));
	    dsblDao.saveAndFlush(entity);
	    return "ok";
	}

	@GetMapping("/profile/nguoiDung/{sdtLa}")
	public String xemTrangCaNhanNguoiKhac(Model m, @PathVariable String sdtLa) {
		String sdt = session.get("sdt");
		NguoiDung nguoiDung = new NguoiDung();
		m.addAttribute("message","SDT là"+sdtLa);
		
		return "trangCaNhanNguoiDungKhac";
	}
	
}
