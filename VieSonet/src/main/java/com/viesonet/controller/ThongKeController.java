package com.viesonet.controller;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Map;
import com.viesonet.report.*;
import org.hibernate.annotations.Comment;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	@RequestMapping("/thongKe")
	public String thongKe(Model m) {
		String layNam = "EXEC sp_CacNamHienCo";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(layNam, new Object[]{});
		List<ListYear> NamHienCo = new ArrayList<>();
	      for (Map<String, Object> row : rows) {
	          ListYear ls = new ListYear();
	          ls.setNam(String.valueOf(row.get("Nam")));
	          NamHienCo.add(ls);
	      }
	    m.addAttribute("NamHienCo", NamHienCo);
		return "thongKe";
	}
	
	@RequestMapping("/getThongKe")
	public String getThongKe(@RequestParam String Nam, Model m) {
		int nam1;
		if(Nam.equals("0")) {
			nam1 = LocalDate.now().getYear();
		}else {
			nam1 = Integer.parseInt(Nam);
		}
		
		String thongKe1 = "EXEC sp_ThongKeBaiVietViPhamTheoThang @Nam=?";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(thongKe1, new Object[]{nam1});
		List<ThongKeViPham> list = new ArrayList<>();
	      for (Map<String, Object> row : rows) {
	          ThongKeViPham tk = new ThongKeViPham();
	          tk.setThang(Integer.parseInt(String.valueOf(row.get("Thang"))));
	          tk.setSoBaiVietViPham(Integer.parseInt(String.valueOf(row.get("SoBaiVietViPham"))));
	          list.add(tk);
	      }
	      m.addAttribute("tk", list);
//	   // Chuyển đổi danh sách thành chuỗi JSON và gửi nó đến JSP
//	        ObjectMapper objectMapper = new ObjectMapper();
//	        String thongKeJson = objectMapper.writeValueAsString(list);
//	        
		    return "thongKe";
	}
}
