package com.viesonet.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.viesonet.dao.NDDAOJson;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.NguoiDungJson;
import com.viesonet.service.ParamService;
import com.viesonet.service.SessionService;

import jakarta.transaction.Transactional;

@Controller
public class QuanLyNguoiDungController {
	@Autowired
	NDDAOJson daoND;
	
	@Autowired
	NguoiDungDAO ndDAO;
	
	@Autowired
	SessionService sessionService;
	
	@Autowired
	ParamService paramService;
	
	@RequestMapping("/quanLyNguoiDung")
	public String quanLyNguoiDung (Model m) {
		String userHienTai = sessionService.get("sdt");
		m.addAttribute("dsNguoiDung", daoND.findDSNguoiDungKhacNguoiDungHienTai(userHienTai));
		return "quanLyNguoiDung";
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/goViPham/{sdt}")
	public String goViPham(@PathVariable String sdt, Model m) throws JsonProcessingException {
		String userHienTai = sessionService.get("sdt");
		daoND.resetLuotViPham("0"+sdt);
		List<NguoiDungJson> nd = daoND.findDSNguoiDungKhacNguoiDungHienTai(userHienTai);
		NguoiDungJson[] arrayNd = nd.toArray(new NguoiDungJson[nd.size()]);
		ObjectMapper objectMapper = new ObjectMapper();
	    // Chuyển đổi danh sách thành chuỗi JSON và gửi nó đến JSP
	    String ds = objectMapper.writeValueAsString(arrayNd);
		return ds;
	}
	
	@GetMapping("/chinhSua/{sdt}")
	public String chinhSua(@PathVariable String sdt, Model m) {
		String userHienTai = sessionService.get("sdt");
		m.addAttribute("thongTin", ndDAO.findBySdt(sdt));
		m.addAttribute("dsNguoiDung", daoND.findDSNguoiDungKhacNguoiDungHienTai(userHienTai));
		return "quanLyNguoiDung";
	}
}
