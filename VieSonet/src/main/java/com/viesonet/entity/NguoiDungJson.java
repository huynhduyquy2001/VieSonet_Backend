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
@Table(name = "nguoiDung")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class NguoiDungJson {
	
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
	private Integer soLuongBanBe;
	@Temporal(TemporalType.DATE)
	@Column(name = "ngaySinh")
	Date ngaySinh = new Date();
	
	@Temporal(TemporalType.DATE)
	@Column(name = "thoiGianTruyCap")
	Date thoiGianTruyCap = new Date();
	
	@Temporal(TemporalType.DATE)
	@Column(name = "ngayTao")
	Date ngayTao = new Date();
	
	/*N-1*/
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "maVaiTro")
	VaiTro vaiTro;
	
}
