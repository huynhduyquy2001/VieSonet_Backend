package com.viesonet.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.viesonet.dao.NguoiDungDAO;

@Controller
public class ProfileController {
	@Autowired
	NguoiDungDAO dao;
	
	@RequestMapping("/profile")
	public String index(Model m) {

//		List<Order> orders = new ArrayList<Order>();
//		orders.add(new Order(Direction.DESC, "ngayDang"));
//		Sort sort = Sort.by(orders);
	
		return "trangCaNhan";
	}
}
