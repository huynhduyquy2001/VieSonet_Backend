package com.viesonet.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.viesonet.dao.BaiVietDao;
import com.viesonet.dao.BaiVietViPhamDAO;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.BaiViet;
import com.viesonet.entity.DSToCaoVaViPham;
import com.viesonet.entity.DanhSachBaiVietBiToCao;
import com.viesonet.entity.DanhSachViPham;
import com.viesonet.entity.NguoiDung;
import com.viesonet.entity.PostWithComment;
import com.viesonet.report.ListYear;
import com.viesonet.service.SessionService;

import jakarta.transaction.Transactional;

@Controller
public class QuanLyBaiVietController {

	@Autowired
	BaiVietViPhamDAO daoBVVP;

	@Autowired
	BaiVietDao daoBV;

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	SessionService session;
	
	@Autowired
	NguoiDungDAO nguoiDungDAO;
	
	@RequestMapping("/quanly/quanLyBaiViet")
	public String quanLyBaiViet(Model m) {
		String sdt = session.get("sdt");
		NguoiDung taiKhoan = nguoiDungDAO.getById(sdt);
		m.addAttribute("taiKhoan", taiKhoan);
		String sql = "select maBaiViet, COUNT(maToCao) AS 'SoLuong' from BaiVietViPham where trangThai = 1 group by maBaiViet order by SoLuong DESC";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql, new Object[] {});
		List<DanhSachBaiVietBiToCao> dsToCao = new ArrayList<>();
		for (Map<String, Object> row : rows) {
			DanhSachBaiVietBiToCao ls = new DanhSachBaiVietBiToCao();
			ls.setMaBaiViet(Integer.parseInt(String.valueOf(row.get("maBaiViet"))));
			ls.setSoLuong(Integer.parseInt(String.valueOf(row.get("SoLuong"))));
			dsToCao.add(ls);
		}

		String sql2 = "select DISTINCT  bv.maBaiViet, bv.ngayDang, nd.hoTen from BaiVietViPham bvvp, nguoiDung nd, BaiViet bv where bvvp.maBaiViet = bv.maBaiViet and bv.sdt = nd.sdt and bvvp.trangThai = 0";
		List<Map<String, Object>> rows2 = jdbcTemplate.queryForList(sql2, new Object[] {});
		List<DanhSachViPham> dsViPham = new ArrayList<>();
		for (Map<String, Object> row : rows2) {
			DanhSachViPham ls = new DanhSachViPham();
			ls.setMaBaiViet(Integer.parseInt(String.valueOf(row.get("maBaiViet"))));
			ls.setNgayDang(String.valueOf(row.get("ngayDang")));
			ls.setHoTen(String.valueOf(row.get("hoTen")));
			dsViPham.add(ls);
		}
		m.addAttribute("dsToCao", dsToCao);
		m.addAttribute("dsViPham", dsViPham);
		return "quanLyBaiViet";
	}

	@ResponseBody
	@RequestMapping("/quanly/chiTietBaiViet/{maBaiViet}")
	public Object chiTietBaiViet(@PathVariable String maBaiViet) {
		Object bv = daoBV.findBaiVietByMaBaiViet(Integer.parseInt(maBaiViet));
		return bv;
	}

	@Transactional
	@ResponseBody
	@RequestMapping("/quanly/danhDauBaiViet/{maBaiViet}")
	public DSToCaoVaViPham danhDauBaiViet(@PathVariable String maBaiViet) {
		daoBVVP.danhDauViPham(Integer.parseInt(maBaiViet));
		String sql = "select maBaiViet, COUNT(maToCao) AS 'SoLuong' from BaiVietViPham where trangThai = 1 group by maBaiViet order by SoLuong DESC";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql, new Object[] {});
		List<DanhSachBaiVietBiToCao> dsToCao = new ArrayList<>();
		for (Map<String, Object> row : rows) {
			DanhSachBaiVietBiToCao ls = new DanhSachBaiVietBiToCao();
			ls.setMaBaiViet(Integer.parseInt(String.valueOf(row.get("maBaiViet"))));
			ls.setSoLuong(Integer.parseInt(String.valueOf(row.get("SoLuong"))));
			dsToCao.add(ls);
		}
		String sql2 = "select DISTINCT  bv.maBaiViet, bv.ngayDang, nd.hoTen from BaiVietViPham bvvp, nguoiDung nd, BaiViet bv where bvvp.maBaiViet = bv.maBaiViet and bv.sdt = nd.sdt and bvvp.trangThai = 0";
		List<Map<String, Object>> rows2 = jdbcTemplate.queryForList(sql2, new Object[] {});
		List<DanhSachViPham> dsViPham = new ArrayList<>();
		for (Map<String, Object> row : rows2) {
			DanhSachViPham ls = new DanhSachViPham();
			ls.setMaBaiViet(Integer.parseInt(String.valueOf(row.get("maBaiViet"))));
			ls.setNgayDang(String.valueOf(row.get("ngayDang")));
			ls.setHoTen(String.valueOf(row.get("hoTen")));
			dsViPham.add(ls);
		}
		return new DSToCaoVaViPham(dsToCao, dsViPham);
	}

	@ResponseBody
	@RequestMapping("/quanly/xemBaiViet/{maBaiViet}")
	public Object xem(@PathVariable String maBaiViet) {
		Object bv = daoBV.findBaiVietByMaBaiViet(Integer.parseInt(maBaiViet));
		return bv;
	}

	@Transactional
	@ResponseBody
	@RequestMapping("/quanly/xoaBaiVietViPham/{maBaiViet}")
	public List<DanhSachViPham> goViPham(@PathVariable String maBaiViet) {
		String sql3 = "DELETE FROM BaiVietViPham WHERE maBaiViet = ?";
		jdbcTemplate.update(sql3, new Object[] { Integer.parseInt(maBaiViet) });

		String sql2 = "select DISTINCT  bv.maBaiViet, bv.ngayDang, nd.hoTen from BaiVietViPham bvvp, nguoiDung nd, BaiViet bv where bvvp.maBaiViet = bv.maBaiViet and bv.sdt = nd.sdt and bvvp.trangThai = 0";
		List<Map<String, Object>> rows2 = jdbcTemplate.queryForList(sql2, new Object[] {});
		List<DanhSachViPham> dsViPham = new ArrayList<>();
		for (Map<String, Object> row : rows2) {
			DanhSachViPham ls = new DanhSachViPham();
			ls.setMaBaiViet(Integer.parseInt(String.valueOf(row.get("maBaiViet"))));
			ls.setNgayDang(String.valueOf(row.get("ngayDang")));
			ls.setHoTen(String.valueOf(row.get("hoTen")));
			dsViPham.add(ls);
		}
		return dsViPham;
	}
}
