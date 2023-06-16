package com.viesonet.entity;

import java.util.Date;
import java.util.List;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "nguoiDung")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class NguoiDung {
	
	@Id
	private String sdt;
	private String hoTen;
	private String email;
	private String matKhau;
	private String diaChi;
	private String moiQuanHe;
	private String gioiThieu;
	private String anhDaiDien;
	private Boolean gioiTinh;
	private String anhBia;
	private Boolean trangThai;
	private Integer luotViPham;

	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "thoiGianTruyCap")
	Date thoiGianTruyCap = new Date();
	
	@Temporal(TemporalType.DATE)
	@Column(name = "ngaySinh")
	Date ngaySinh = new Date();
	
	@Temporal(TemporalType.DATE)
	@Column(name = "ngayTao")
	Date ngayTao = new Date();
	
	
	/*N-1*/
	@ManyToOne
	@JoinColumn(name = "maVaiTro")
	VaiTro vaiTro;
	
	
	/*1-N*/
	@OneToMany(mappedBy = "nguoiDung")
	List<DanhSachYeuThich> danhSachYeuThich;
	
	@OneToMany(mappedBy = "nguoiDung")
	List<DanhSachKetBan> danhSachKetBan1;
	
	@OneToMany(mappedBy = "nguoiLa")
	List<DanhSachKetBan> danhSachKetBan2;
	
	@OneToMany(mappedBy = "nguoiDung")
	List<BanBe> banBe1;
	
	@OneToMany(mappedBy = "banBe")
	List<BanBe> banBe2;
	
	@OneToMany(mappedBy = "nguoiDung")
	List<BaiVietViPham> baiVietViPham;
	
	@OneToMany(mappedBy = "nguoiDung")
	List<BaiViet> baiViet;
	
	@OneToMany(mappedBy = "nguoiDung")
	List<DanhSachBinhLuan> danhSachBinhLuan;
	@OneToMany(mappedBy = "nguoiDung")
	List<ThongBao> thongBao;

	
	
	
}
