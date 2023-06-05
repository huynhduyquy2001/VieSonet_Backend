package com.viesonet.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.entity.Category;
import com.viesonet.dao.BaiVietDAO;
import com.viesonet.dao.BanBeDAO;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.BaiViet;
import com.viesonet.entity.BanBe;
import com.viesonet.entity.NguoiDung;

@Controller
public class ProfileController {
	@Autowired
	NguoiDungDAO nguoiDungDao;
	
	@Autowired
	BaiVietDAO baiVietDao;
	
	@Autowired
	BanBeDAO banBeDao;
	
	@RequestMapping("/profile")
	public String index(Model m, @ModelAttribute("profile") NguoiDung entity, @PathVariable("sdt") String sdt) {
		List<Order> orders = new ArrayList<Order>();
		
//		List<BanBe> listBb = banBeDao.findFriendByUserphone("0939790002");
		orders.add(new Order(Direction.DESC, "ngayDang"));
		Sort sort = Sort.by(orders);
		
		m.addAttribute("BaiVietCaNhan", baiVietDao.findById("0939790001"));
		m.addAttribute("BaiVietCaNhan", baiVietDao.findAll(sort));
		return "trangCaNhan";
	}
//	@GetMapping("/profile/edit/{id}")
//	public String edit(Model m, @ModelAttribute("category") Category entity, @PathVariable("id") String id) {
//		entity = dao.getOne(id);
//		m.addAttribute("category", entity);
//		List<Category> list = dao.findAll();
//		m.addAttribute("list", list);
//		return "index";
//	}
	@RequestMapping("/profile/{nguoiDung}")
    public List<BaiViet> getBaiViet(@PathVariable int nguoiDang) {
        return baiVietRepo.findByNguoiDang(nguoiDang); // Trả về danh sách bài viết của người dùng tương ứng hoặc danh sách rỗng nếu không tìm thấy
    }
}
