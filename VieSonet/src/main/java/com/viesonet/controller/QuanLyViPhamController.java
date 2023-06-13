package com.viesonet.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.viesonet.dao.LoaiViPhamDAO;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.dao.ThongBaoDAO;
import com.viesonet.entity.LoaiViPham;
import com.viesonet.entity.NguoiDung;
import com.viesonet.entity.ThongBao;
import com.viesonet.service.ParamService;
import com.viesonet.service.SessionService;

@Controller
public class QuanLyViPhamController {
	@Autowired
	ParamService param;
	@Autowired
	LoaiViPhamDAO dao;
	@Autowired
	SessionService session;
	@Autowired
	NguoiDungDAO nguoiDungDAO;
	
	@Autowired
	ThongBaoDAO thongBaoDao;
	
	@GetMapping("/quanly/quanlyvipham")
	public String list(Model m) {
		
		String sdt = session.get("sdt");
		NguoiDung taiKhoan = nguoiDungDAO.getById(sdt);
		m.addAttribute("taiKhoan", taiKhoan);
		// lấy danh sách thông báo
		List<ThongBao> thongBao = thongBaoDao.findByUser(sdt, Sort.by(Direction.DESC, "ngayThongBao"));
		m.addAttribute("thongBao", thongBao);
		m.addAttribute("thongBaoChuaXem", thongBaoDao.demThongBaoChuaXem(sdt));
		
		
		m.addAttribute("ds", dao.findAll());
		return "quanLyViPham";
	}

	@ResponseBody
	@RequestMapping("/quanly/quanlyvipham/them/{maLoai}")
	public String them(@RequestParam("maViPham") String maViPhamStr, @RequestParam("chiTiet") String chiTiet) {
	   
	    int maViPham;
	    try {
	        maViPham = Integer.parseInt(maViPhamStr);
	    } catch (NumberFormatException e) {
	        return "Mã vi phạm phải là một số nguyên";
	    }
	    
	    LoaiViPham lViPham = new LoaiViPham();
	    if (maViPham <= 0) {
	        return "Mã vi phạm không được bé hơn bằng 0";
	    } else if (chiTiet == null || chiTiet.trim().isEmpty()) {
	        return "Không được bỏ trống loại vi phạm";
	    } else {
	        if (!dao.existsByMaLoai(maViPham)) {
	            lViPham.setMaLoai(maViPham);
	            lViPham.setChiTiet(chiTiet);
	            dao.save(lViPham);
	            return "Thêm thành công";
	        } else {
	            return "Mã vi phạm đã tồn tại";
	        }
	    }
	}

	
	@ResponseBody
	@RequestMapping("/quanly/quanlyvipham/sua/{maLoai}")
	public String update(Model m, @PathVariable("maLoai") Integer maLoai, @RequestParam("chiTiet") String chiTiet) {
	    Optional<LoaiViPham> opt = dao.findById(maLoai);
	    if(opt.isPresent()) {
	        LoaiViPham lViPham = opt.get();
	        lViPham.setChiTiet(chiTiet);
	        dao.save(lViPham);
	        return "Sửa thành công";
	    }else {
	       return "Mã vi phạm không tồn tại";
	    }
	}
}
