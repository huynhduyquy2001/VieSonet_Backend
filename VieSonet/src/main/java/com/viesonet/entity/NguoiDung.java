package com.viesonet.entity;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
@Table(name = "NguoiDung")
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
	private String tinhYeu;
	private String gioiThieu;
	private String anhDaiDien;
	private Boolean gioiTinh;
	private String anhBia;
	private Boolean trangThai;

	@Temporal(TemporalType.DATE)
	@Column(name = "thoiGianTruyCap")
	Date thoiGianTruyCap = new Date();
	
	@Temporal(TemporalType.DATE)
	@Column(name = "ngayTao")
	Date ngayGui = new Date();
	/*N-1*/
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name ="maVaiTro")
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
	
	@OneToMany(mappedBy = "baiVietViPham")
	List<BaiVietViPham> baiVietViPham;
	
	@OneToMany(mappedBy = "baiViet")
	List<BaiViet> baiViet;
	
	@OneToMany(mappedBy = "baiViet")
	List<DanhSachBinhLuan> danhSachBinhLuan;
	
	
	
}
