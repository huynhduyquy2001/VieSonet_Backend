package com.viesonet.controller;

import java.util.ArrayList;
import java.util.List;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.viesonet.dao.NDDAOJson;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.dao.ThongBaoDAO;
import com.viesonet.entity.NguoiDung;
import com.viesonet.entity.NguoiDungJson;
import com.viesonet.entity.ThongBao;
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
	
	@Autowired
	ThongBaoDAO thongBaoDao;
	
	@RequestMapping("/quanly/quanLyNguoiDung")
	public String quanLyNguoiDung (Model m) {
		
		String sdt = sessionService.get("sdt");
		NguoiDung taiKhoan = ndDAO.getById(sdt);
		m.addAttribute("taiKhoan", taiKhoan);
		// lấy danh sách thông báo
		List<ThongBao> thongBao = thongBaoDao.findByUser(sdt, Sort.by(Direction.DESC, "ngayThongBao"));
		m.addAttribute("thongBao", thongBao);
		m.addAttribute("thongBaoChuaXem", thongBaoDao.demThongBaoChuaXem(sdt));
		String userHienTai = sessionService.get("sdt");
		m.addAttribute("dsNguoiDung", daoND.findDSNguoiDungKhacNguoiDungHienTai(userHienTai));
		return "quanLyNguoiDung";
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/quanly/goViPham/{sdt}")
	public String goViPham(@PathVariable String sdt, Model m) throws JsonProcessingException {
	    String userHienTai = sessionService.get("sdt");
	    daoND.resetLuotViPham(sdt);
	    List<NguoiDungJson> nd = daoND.findDSNguoiDungKhacNguoiDungHienTai(userHienTai);
	    NguoiDungJson[] arrayNd = nd.toArray(new NguoiDungJson[nd.size()]);
	    ObjectMapper objectMapper = new ObjectMapper();
	    // Chuyển đổi danh sách thành chuỗi JSON và gửi nó về phía client
	    String ds = objectMapper.writeValueAsString(arrayNd);
	    return ds;
	}

	
	@GetMapping("/quanly/chinhSua/{sdt}")
	public String chinhSua(@PathVariable String sdt, Model m) {
		String userHienTai = sessionService.get("sdt");
		m.addAttribute("thongTin", ndDAO.findBySdt(sdt));
		m.addAttribute("dsNguoiDung", daoND.findDSNguoiDungKhacNguoiDungHienTai(userHienTai));
		return "quanLyNguoiDung";
	}
	
	@Transactional
	@RequestMapping("/quanly/khoaTaiKhoan/{sdt}")
	public String khoaTaiKhoan(@PathVariable String sdt, Model m){
		String userHienTai = sessionService.get("sdt");
		daoND.khoaTaiKhoan(sdt);
		m.addAttribute("thongTin", ndDAO.findBySdt(sdt));
		m.addAttribute("dsNguoiDung", daoND.findDSNguoiDungKhacNguoiDungHienTai(userHienTai));
		return "quanLyNguoiDung";
	}
	
	@Transactional
	@RequestMapping("/quanly/moKhoaTaiKhoan/{sdt}")
	public String moTaiKhoan(@PathVariable String sdt, Model m){
		String userHienTai = sessionService.get("sdt");
		daoND.moTaiKhoan(sdt);
		m.addAttribute("thongTin", ndDAO.findBySdt(sdt));
		m.addAttribute("dsNguoiDung", daoND.findDSNguoiDungKhacNguoiDungHienTai(userHienTai));
		return "quanLyNguoiDung";
	}
	
	@Transactional
	@RequestMapping("/quanly/doiVaiTro/{vaiTro}/{sdt}")
	public String moTaiKhoan(@PathVariable String vaiTro, @PathVariable String sdt, Model m) {
		String userHienTai = sessionService.get("sdt");
		daoND.doiVaitro(vaiTro, sdt);
		m.addAttribute("thongTin", ndDAO.findBySdt(sdt));
		m.addAttribute("dsNguoiDung", daoND.findDSNguoiDungKhacNguoiDungHienTai(userHienTai));
		return "quanLyNguoiDung";
	}
	
	@ResponseBody
	@RequestMapping("/quanly/timKiemDanhSachSDT/{sdt}")
	public NguoiDungJson timKiemSdt(@PathVariable String sdt, Model m) throws JsonProcessingException {
		NguoiDungJson nd = daoND.findBySdt(sdt);
		return nd;
	}
	
	@ResponseBody
	@RequestMapping("/quanly/timKiemDanhSachTen/{tuKhoa}")
	public List<NguoiDungJson> timKiemTen(@PathVariable String tuKhoa, Model m){
		List<NguoiDungJson> nd1 = daoND.findByHoTen(tuKhoa);
		return nd1;
	}
	
	@ResponseBody
	@RequestMapping("/quanly/timKiemAll")
	public List<NguoiDungJson> timKiemAll(){
		String userHienTai = sessionService.get("sdt");
		List<NguoiDungJson> nd1 = daoND.findDSNguoiDungKhacNguoiDungHienTai(userHienTai);
		return nd1;
	}
}
