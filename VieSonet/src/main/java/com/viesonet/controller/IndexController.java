package com.viesonet.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.viesonet.dao.BaiVietDAO;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.dao.BanBeDAO;
import com.viesonet.dao.DanhSachBinhLuanDAO;
import com.viesonet.entity.BaiViet;
import com.viesonet.entity.BanBe;
import com.viesonet.entity.BinhLuanResponse;
import com.viesonet.entity.DanhSachBinhLuan;
import com.viesonet.entity.DanhSachBinhLuanDTO;
import com.viesonet.entity.NguoiDung;

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

	@RequestMapping("/")
	public String getBaiVietCuaBanBe(Model m) {
		
		List<BanBe> listBb = banBeDao.findFriendByUserphone("0939790002");
		
		List<String> sdtBanBeList = listBb.stream()
                .map(banBe -> banBe.getBanBe().getSdt())
                .collect(Collectors.toList());
		
		List<Order> orders = new ArrayList<Order>();
		orders.add(new Order(Direction.DESC, "ngayDang"));
		Sort sort = Sort.by(orders);
		m.addAttribute("DanhSachBv", baiVietDao.findAll(sort));
		m.addAttribute("DanhSachBv", baiVietDao.findByNguoiDungSdtIn(sdtBanBeList,Sort.by(Direction.DESC, "ngayDang")));
		return "index";
    }
	
	@ResponseBody
	@GetMapping("/binhluan/{maBaiViet}")
	public BinhLuanResponse xemBinhLuan(@PathVariable int maBaiViet) {
		
	    Object baiViet = baiVietDao.findBaiVietByMaBaiViet(maBaiViet);
	    List<Object> danhSachBinhLuan = dsblDao.findBinhLuanByMaBaiViet(maBaiViet);
	    
	    return new BinhLuanResponse(baiViet, danhSachBinhLuan);
	}


	
//	@ResponseBody
//	@GetMapping("/binhluan/{maBaiViet}")
//    public List<DanhSachBinhLuanDTO> xemBinhLuan(@PathVariable int maBaiViet) {
//		List<DanhSachBinhLuanDTO> danhSachBinhLuan = dsblDao.findByBaiVietMaBaiViet(maBaiViet);
//		return danhSachBinhLuan;
//    }

}
