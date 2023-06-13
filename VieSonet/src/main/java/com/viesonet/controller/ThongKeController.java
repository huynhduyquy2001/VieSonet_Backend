package com.viesonet.controller;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Map;

import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.dao.ThongBaoDAO;
import com.viesonet.entity.NguoiDung;
import com.viesonet.entity.ThongBao;
import com.viesonet.report.*;
import com.viesonet.service.SessionService;

import org.hibernate.annotations.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ThongKeController {
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	@Autowired
	SessionService session;
	
	@Autowired
	NguoiDungDAO nguoiDungDAO;
	
	@Autowired
	ThongBaoDAO thongBaoDao;
	@RequestMapping("/quanly/thongKe")
	public String thongKe(Model m) throws JsonProcessingException {
		String sdt = session.get("sdt");
		NguoiDung taiKhoan = nguoiDungDAO.getById(sdt);
		m.addAttribute("taiKhoan", taiKhoan);
		
		// lấy danh sách thông báo
		List<ThongBao> thongBao = thongBaoDao.findByUser(sdt, Sort.by(Direction.DESC, "ngayThongBao"));
		m.addAttribute("thongBao", thongBao);
		m.addAttribute("thongBaoChuaXem", thongBaoDao.demThongBaoChuaXem(sdt));
		
		String layNam = "SELECT DISTINCT YEAR(ngayToCao) as 'Nam' FROM BaiVietViPham order by YEAR(ngayToCao) DESC";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(layNam, new Object[]{});
		List<Object> NamHienCo = new ArrayList<>();
	      for (Map<String, Object> row : rows) {
	          ListYear ls = new ListYear();
	          ls.setNam(String.valueOf(row.get("Nam")));
	          NamHienCo.add(ls);
	      }
	    m.addAttribute("NamHienCo", NamHienCo);
	    
	    String thongKe1 = "EXEC sp_ThongKeBaiVietViPhamTheoThang @Nam=?";
		List<Map<String, Object>> rows1 = jdbcTemplate.queryForList(thongKe1, new Object[]{LocalDate.now().getYear()});
		List<Object> dsBaiVietViPham = new ArrayList<>();
	      for (Map<String, Object> row : rows1) {
	          ThongKeViPham tk = new ThongKeViPham();
	          tk.setThang(Integer.parseInt(String.valueOf(row.get("Thang"))));
	          tk.setSoBaiVietViPham(Integer.parseInt(String.valueOf(row.get("SoBaiVietViPham"))));
	          dsBaiVietViPham.add(tk);
	      }
	      ObjectMapper objectMapper = new ObjectMapper();
	    // Chuyển đổi danh sách thành chuỗi JSON và gửi nó đến JSP
	    String thongKeJson = objectMapper.writeValueAsString(dsBaiVietViPham);
	    m.addAttribute("thongKeJson", thongKeJson);
	    
	    String thongKe2 = "EXEC sp_ThongKeSoLuotBaoCaoTheoThang @Nam=?";
		List<Map<String, Object>> rows2 = jdbcTemplate.queryForList(thongKe2, new Object[]{LocalDate.now().getYear()});
		List<Object> dsSoLuotBaoCao = new ArrayList<>();
	      for (Map<String, Object> row : rows2) {
	          ThongKeSoLuotBaoCao tk1 = new ThongKeSoLuotBaoCao();
	          tk1.setThang(Integer.parseInt(String.valueOf(row.get("Thang"))));
	          tk1.setSoLuotBaoCao(Integer.parseInt(String.valueOf(row.get("SoLuotBaoCao"))));
	          dsSoLuotBaoCao.add(tk1);
	      }
	   // Chuyển đổi danh sách thành chuỗi JSON và gửi nó đến JSP
		    String thongKeJson1 = objectMapper.writeValueAsString(dsSoLuotBaoCao);
		    m.addAttribute("thongKeJson1", thongKeJson1);
	      
		  
		    String layNam1 = "SELECT DISTINCT YEAR(ngayTao) as 'Nam' FROM nguoiDung order by YEAR(ngayTao) DESC";
			List<Map<String, Object>> row1 = jdbcTemplate.queryForList(layNam1, new Object[]{});
			List<Object> NamHienCo1 = new ArrayList<>();
		      for (Map<String, Object> row : row1) {
		          ListYear ls = new ListYear();
		          ls.setNam(String.valueOf(row.get("Nam")));
		          NamHienCo1.add(ls);
		      }
		    m.addAttribute("NamHienCo1", NamHienCo1);
		    
		    String thongKe3 = "EXEC sp_ThongKeSoLuongDangKyTheoThang @Nam=?";
			List<Map<String, Object>> rows3 = jdbcTemplate.queryForList(thongKe3, new Object[]{LocalDate.now().getYear()});
			List<Object> thongKeDangKy = new ArrayList<>();
		      for (Map<String, Object> row : rows3) {
		          ThongKeDangKy tk3 = new ThongKeDangKy();
		          tk3.setThang(Integer.parseInt(String.valueOf(row.get("Thang"))));
		          tk3.setSoLuotDangKy(Integer.parseInt(String.valueOf(row.get("SoLuongDangKy"))));
		          thongKeDangKy.add(tk3);
		      }
		   // Chuyển đổi danh sách thành chuỗi JSON và gửi nó đến JSP
			    String thongKeJson2 = objectMapper.writeValueAsString(thongKeDangKy);
			    m.addAttribute("thongKeJson2", thongKeJson2);
			    
			    String thongKe4 = "EXEC sp_ThongKeSoLuotThichCaoNhat @month=?";
				List<Map<String, Object>> rows4 = jdbcTemplate.queryForList(thongKe4, new Object[]{LocalDate.now()});
				List<ThongKeLuotThich> thongKeLuotThich = new ArrayList<>();
			      for (Map<String, Object> row : rows4) {
			          ThongKeLuotThich tk4 = new ThongKeLuotThich();
			          tk4.setHinhAnh(String.valueOf(row.get("HinhAnh")));
			          tk4.setMaBaiViet(Integer.parseInt(String.valueOf(row.get("MaBaiViet"))));
			          tk4.setNguoiDang(String.valueOf(row.get("NguoiDang")));
			          tk4.setMoTa(String.valueOf(row.get("MoTa")));
			          tk4.setLuotThich(Integer.parseInt(String.valueOf(row.get("LuotThich"))));
			          thongKeLuotThich.add(tk4);
			      }    
			     m.addAttribute("tkLuotThich", thongKeLuotThich);
		return "thongKe";
	}
	
	@ResponseBody
	@RequestMapping("/quanly/getThongKe")
	public ThongKeResponse ThongKe1(@RequestParam String Nam, Model m) throws JsonProcessingException {
		int nam1;
		if(Nam.equals("0")) {
			nam1 = LocalDate.now().getYear();
		}else {
			nam1 = Integer.parseInt(Nam);
		}
		
		String thongKe1 = "EXEC sp_ThongKeBaiVietViPhamTheoThang @Nam=?";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(thongKe1, new Object[]{nam1});
		List<Object> dsBaiVietViPham = new ArrayList<>();
	      for (Map<String, Object> row : rows) {
	          ThongKeViPham tk = new ThongKeViPham();
	          tk.setThang(Integer.parseInt(String.valueOf(row.get("Thang"))));
	          tk.setSoBaiVietViPham(Integer.parseInt(String.valueOf(row.get("SoBaiVietViPham"))));
	          dsBaiVietViPham.add(tk);
	      }
	        
	        String thongKe2 = "EXEC sp_ThongKeSoLuotBaoCaoTheoThang @Nam=?";
			List<Map<String, Object>> rows1 = jdbcTemplate.queryForList(thongKe2, new Object[]{nam1});
			List<Object> dsSoLuotBaoCao = new ArrayList<>();
		      for (Map<String, Object> row : rows1) {
		          ThongKeSoLuotBaoCao tk1 = new ThongKeSoLuotBaoCao();
		          tk1.setThang(Integer.parseInt(String.valueOf(row.get("Thang"))));
		          tk1.setSoLuotBaoCao(Integer.parseInt(String.valueOf(row.get("SoLuotBaoCao"))));
		          dsSoLuotBaoCao.add(tk1);
		      }
		   
		    return new ThongKeResponse(dsBaiVietViPham, dsSoLuotBaoCao);
	}
	
	@ResponseBody
	@RequestMapping("/quanly/getThongKe2")
	public String ThongKe2(@RequestParam String Nam, Model m) throws JsonProcessingException {
		int nam1;
		if(Nam.equals("0")) {
			nam1 = LocalDate.now().getYear();
		}else {
			nam1 = Integer.parseInt(Nam);
		}
		
		String thongKe3 = "EXEC sp_ThongKeSoLuongDangKyTheoThang @Nam=?";
		List<Map<String, Object>> rows3 = jdbcTemplate.queryForList(thongKe3, new Object[]{nam1});
		List<Object> thongKeDangKy = new ArrayList<>();
	      for (Map<String, Object> row : rows3) {
	          ThongKeDangKy tk3 = new ThongKeDangKy();
	          tk3.setThang(Integer.parseInt(String.valueOf(row.get("Thang"))));
	          tk3.setSoLuotDangKy(Integer.parseInt(String.valueOf(row.get("SoLuongDangKy"))));
	          thongKeDangKy.add(tk3);
	      }
	   // Chuyển đổi danh sách thành chuỗi JSON và gửi nó đến JSP
	      	ObjectMapper objectMapper = new ObjectMapper();
		    String thongKeJson2 = objectMapper.writeValueAsString(thongKeDangKy);
		    
		    return thongKeJson2;
	}
	
	@ResponseBody
	@RequestMapping("/quanly/getThongKe3")
	public String thongKe3(@RequestParam String Date) throws JsonProcessingException {
		    String date;
		    if(Date.equals("")) {
		    	date = String.valueOf(LocalDate.now());
		    }else {
		    	date = Date;
		    }
		 	String thongKe4 = "EXEC sp_ThongKeSoLuotThichCaoNhat @month=?";
			List<Map<String, Object>> rows4 = jdbcTemplate.queryForList(thongKe4, new Object[]{date});
			List<ThongKeLuotThich> thongKeLuotThich = new ArrayList<>();
		      for (Map<String, Object> row : rows4) {
		          ThongKeLuotThich tk4 = new ThongKeLuotThich();
		          tk4.setHinhAnh(String.valueOf(row.get("HinhAnh")));
		          tk4.setMaBaiViet(Integer.parseInt(String.valueOf(row.get("MaBaiViet"))));
		          tk4.setNguoiDang(String.valueOf(row.get("NguoiDang")));
		          tk4.setMoTa(String.valueOf(row.get("MoTa")));
		          tk4.setLuotThich(Integer.parseInt(String.valueOf(row.get("LuotThich"))));
		          thongKeLuotThich.add(tk4);
		      }    
		      ObjectMapper objectMapper = new ObjectMapper();
			  String thongKeJson3 = objectMapper.writeValueAsString(thongKeLuotThich);
		return thongKeJson3;
	}
}
