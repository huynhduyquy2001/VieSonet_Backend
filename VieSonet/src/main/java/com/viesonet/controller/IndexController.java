package com.viesonet.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.viesonet.dao.BaiVietDAO;

import com.viesonet.dao.BaiVietViPhamDAO;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.dao.ThongBaoDAO;
import com.viesonet.dao.BanBeDAO;
import com.viesonet.dao.CheDoDAO;
import com.viesonet.dao.DanhSachBinhLuanDAO;
import com.viesonet.dao.DanhSachKetBanDAO;
import com.viesonet.dao.DanhSachYeuThichDAO;
import com.viesonet.dao.LoaiViPhamDAO;
import com.viesonet.entity.BaiViet;
import com.viesonet.entity.BaiVietViPham;
import com.viesonet.entity.BanBe;
import com.viesonet.entity.BinhLuanResponse;
import com.viesonet.entity.DanhSachBinhLuan;
import com.viesonet.entity.DanhSachKetBan;
import com.viesonet.entity.DanhSachYeuThich;
import com.viesonet.entity.LoaiViPham;
import com.viesonet.entity.NguoiDung;
import com.viesonet.entity.ThongBao;
import com.viesonet.service.ImageService;
import com.viesonet.service.ParamService;
import com.viesonet.service.SessionService;

import jakarta.servlet.ServletContext;
import net.coobird.thumbnailator.Thumbnails;

@Controller
public class IndexController {
	@Autowired
	BaiVietDAO baiVietDao;

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

	@Autowired
	BaiVietViPhamDAO bvvpDao;

	@Autowired
	LoaiViPhamDAO loaiViPhamDao;

	@Autowired
	ThongBaoDAO thongBaoDao;
	
	@Autowired 
	ServletContext context;

	// lấy thông tin người dùng

	@RequestMapping("/")
	public String getBaiVietCuaBanBe(Model m) {
		String sdt = session.get("sdt");
		NguoiDung taiKhoan = nguoiDungDAO.getById(sdt);
		m.addAttribute("taiKhoan", taiKhoan);
		// lấy danh sách bài viết từ danh sách bạn bè
		// lấy danh sách bạn bè
		List<BanBe> listBb = banBeDao.findFriends(sdt);
		List<String> sdtBanBeList = listBb.stream().map(banBe -> {
			if (banBe.getBanBe().getSdt().equals(sdt)) {
				return banBe.getNguoiDung().getSdt();
			} else {
				return banBe.getBanBe().getSdt();
			}
		}).collect(Collectors.toList());

		List<BaiViet> dsBaiViet = baiVietDao.findByNguoiDungSdtInAndCheDoMaCheDoNotIn(sdtBanBeList, 3, true,
				Sort.by(Sort.Direction.DESC, "ngayDang"));
		dsBaiViet.removeIf(baiViet -> baiViet.getCheDo().getMaCheDo() == 3);
		for (BaiViet baiViet : dsBaiViet) {
		    System.out.println(baiViet.getCheDo().getMaCheDo());
		}

		m.addAttribute("DanhSachBv", dsBaiViet);
		// Lấy danh sách bài viết đã thích
		Set<Integer> maBaiVietDaThich = new HashSet<>();
		List<DanhSachYeuThich> dsyt = dsytDao.findBySdt(sdt);
		for (DanhSachYeuThich ds : dsyt) {
			int maBaiViet = ds.getBaiViet().getMaBaiViet();
			maBaiVietDaThich.add(maBaiViet);
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
		// danh sách lời mời kết bạn
		List<DanhSachKetBan> danhSachKetBan = dskbDao.findDsBySdt(sdt);
		m.addAttribute("SlKb", danhSachKetBan.size());
		List<DanhSachKetBan> topKetBan = new ArrayList<>();
		for (int i = 0; i < Math.min(3, danhSachKetBan.size()); i++) {
			topKetBan.add(danhSachKetBan.get(i));
		}
		m.addAttribute("topKetBan", topKetBan);
		System.out.println(topKetBan.size());

		// danh sách điều khoản vi phạm
		List<LoaiViPham> danhSachViPham = loaiViPhamDao.findAll();
		m.addAttribute("danhSachViPham", danhSachViPham);

		// lấy danh sách thông báo
		List<ThongBao> thongBao = thongBaoDao.findByUser(sdt, Sort.by(Direction.DESC, "ngayThongBao"));
		m.addAttribute("thongBao", thongBao);
		m.addAttribute("thongBaoChuaXem","("+ thongBaoDao.demThongBaoChuaXem(sdt)+")");

		return "index";
	}

	@ResponseBody
	@GetMapping("/binhluan/{maBaiViet}")
	public BinhLuanResponse xemBinhLuan(@PathVariable int maBaiViet) {
		Object baiViet = baiVietDao.findBaiVietByMaBaiViet(maBaiViet);
		BaiViet obj = baiVietDao.getById(maBaiViet);
		baiVietDao.saveAndFlush(obj);
		List<Object> danhSachBinhLuan = dsblDao.findBinhLuanByMaBaiViet(maBaiViet,
				Sort.by(Direction.DESC, "ngayBinhLuan"));
		return new BinhLuanResponse(baiViet, danhSachBinhLuan);
	}

	@PostMapping("index/dangbai")
	@ResponseBody
	public String dangBai(@RequestParam("photo_file") MultipartFile photofile) {
		BaiViet baiDang = new BaiViet();
		if (photofile.isEmpty()) {
		    baiDang.setHinhAnh("");
		} else {
			
			String originalFileName = photofile.getOriginalFilename();
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
			String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
			String newFileName = originalFileName + "-" + timestamp + extension;
			String pathUpload = context.getRealPath("/images/" + newFileName);

		    try {
		        photofile.transferTo(new File(pathUpload));

		        long fileSize = photofile.getSize();
		        if (fileSize > 1 * 1024 * 1024) { // Kiểm tra nếu kích thước vượt quá 1MB
		            double quality = 0.6; // Chất lượng ảnh sau khi giảm dung lượng (0-1)
		            String outputPath = pathUpload; // Đường dẫn đầu ra cho ảnh sau khi giảm dung lượng
		            Thumbnails.of(pathUpload)
		                .scale(1.0)
		                .outputQuality(quality)
		                .toFile(outputPath);
		        }

		        baiDang.setHinhAnh(newFileName);

		        // Xử lý và lưu thông tin bài viết kèm ảnh vào cơ sở dữ liệu

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
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
			return "";
		} else {
			baiVietDao.saveAndFlush(baiDang);
		}
		// gửi thông báo đến người dùng
		List<BanBe> listBb = banBeDao.findFriends(sdt);

		for (int i = 0; i < listBb.size(); i++) {
			ThongBao thongBao = new ThongBao();
			thongBao.setBaiViet(baiDang);
			thongBao.setNgayThongBao(timestamp);
			if (listBb.get(i).getBanBe().getSdt().equals(sdt)) {
				System.out.println(listBb.get(i).getBanBe().getSdt());
				System.out.println(sdt);
				thongBao.setNguoiDung(nguoiDungDAO.getById(listBb.get(i).getNguoiDung().getSdt()));
			} else {
				thongBao.setNguoiDung(nguoiDungDAO.getById(listBb.get(i).getBanBe().getSdt()));
			}

			thongBao.setNoiDung(nguoiDungDAO.getById(sdt).getHoTen() + " đã đăng bài viết mới.");
			thongBao.setTrangThai(false);
			thongBaoDao.saveAndFlush(thongBao);
		}
		return "Bài viết đã được đăng thành công!";
	}

	@GetMapping("index/dongy/{maLoiMoi}")
	public String dongYKetBan(@PathVariable int maLoiMoi) {
		// thêm người ta vào danh sách bạn bè
		String sdt = session.get("sdt");
		NguoiDung nguoiDung = nguoiDungDAO.getById(sdt); // 0939790299
		DanhSachKetBan ds = dskbDao.getById(maLoiMoi);
		NguoiDung nguoiLa = ds.getNguoiDung();
		BanBe banBe = new BanBe();
		banBe.setNguoiDung(nguoiDung);
		banBe.setBanBe(nguoiLa);
		banBe.setNgayKb(new Date());
		banBeDao.saveAndFlush(banBe);
		dskbDao.deleteById(maLoiMoi);
		return "redirect:/";
	}

	@GetMapping("index/tuchoi/{maLoiMoi}")
	public String tuChoiKetBan(@PathVariable int maLoiMoi) {
		dskbDao.deleteById(maLoiMoi);
		return "redirect:/";
	}

	@GetMapping("index/thich/{maBaiViet}")
	public void thichBaiViet(@PathVariable int maBaiViet) {
		String sdt = session.get("sdt");
		DanhSachYeuThich baiVietYeuThich = dsytDao.findByKey(sdt, maBaiViet);
		if (baiVietYeuThich == null) {
			baiVietYeuThich = new DanhSachYeuThich();
			baiVietYeuThich.setNgayYeuThich(new Date());
			baiVietYeuThich.setBaiViet(baiVietDao.getById(maBaiViet));
			baiVietYeuThich.setNguoiDung(nguoiDungDAO.getById(sdt));
			
			BaiViet obj = baiVietDao.getById(maBaiViet);
			obj.setLuotThich(obj.getLuotThich()+1);
			baiVietDao.saveAndFlush(obj);
			
			dsytDao.saveAndFlush(baiVietYeuThich);
		} else {
			baiVietYeuThich.setNgayYeuThich(new Date());
			baiVietYeuThich.setBaiViet(baiVietDao.getById(maBaiViet));
			baiVietYeuThich.setNguoiDung(nguoiDungDAO.getById(sdt));
			
			BaiViet obj = baiVietDao.getById(maBaiViet);
			obj.setLuotThich(obj.getLuotThich()-1);
			baiVietDao.saveAndFlush(obj);
			
			dsytDao.delete(baiVietYeuThich);
		}
	}

	@PostMapping("/index/thembinhluan/{maBaiViet}")
	@ResponseBody
	public String themBinhLuan(@PathVariable int maBaiViet, @RequestParam("binhLuanCuaToi") String binhLuan) {
		
		if (binhLuan.equals("")) {
			return "";
		}
		// Xử lý logic thêm bình luận
		String sdt = session.get("sdt");
		DanhSachBinhLuan entity = new DanhSachBinhLuan();
		entity.setBaiViet(baiVietDao.getById(maBaiViet));
		entity.setChiTiet(binhLuan);
		entity.setNgayBinhLuan(new Date());
		entity.setNguoiDung(nguoiDungDAO.getById(sdt));

		BaiViet obj = baiVietDao.getById(maBaiViet);
		obj.setLuotBinhLuan(obj.getLuotBinhLuan()+1);
		baiVietDao.saveAndFlush(obj);
		
		dsblDao.saveAndFlush(entity);
		return "ok";
	}

	@ResponseBody
	@PostMapping("/index/baocaovipham/{maBaiViet}")
	public String baoCaoBaiViet(@PathVariable int maBaiViet, @RequestParam("loaiViPham") int loaiViPham) {
		String sdt = session.get("sdt");
		BaiVietViPham baiViet = new BaiVietViPham();
		baiViet.setBaiViet(baiVietDao.getById(maBaiViet));
		baiViet.setNgayToCao(new Date());
		baiViet.setLoaiViPham(loaiViPhamDao.getById(loaiViPham));
		baiViet.setNguoiDung(nguoiDungDAO.getById(sdt));
		baiViet.setTrangThai(true);
		bvvpDao.saveAndFlush(baiViet);
		return "success";
	}

	@GetMapping("/dangxuat")
	public String dangXuat() {
		session.remove("sdt");
		session.remove("vt");
		return "redirect:/dangnhap";
	}

	@ResponseBody
	@GetMapping("/xoathongbao/{maThongBao}")
	public List<Object> xoaThongBao(@PathVariable int maThongBao, Model m) {

		thongBaoDao.deleteById(maThongBao);
		String sdt = session.get("sdt");
		// lấy danh sách thông báo
		List<Object> thongBao = thongBaoDao.timDanhSachThongBao(sdt, Sort.by(Direction.DESC, "ngayThongBao"));
		return thongBao;
	}
	
	@ResponseBody
	@PostMapping("danhDauDaDoc")
	public void danhDauDaDoc(Model m) {
		String sdt = session.get("sdt");
		List<ThongBao> thongBao = thongBaoDao.timThongBaoChuaDoc(sdt, false);
		
		for(ThongBao tb : thongBao) {
			tb.setTrangThai(true);
			thongBaoDao.saveAndFlush(tb);
		}
	}
	

}
