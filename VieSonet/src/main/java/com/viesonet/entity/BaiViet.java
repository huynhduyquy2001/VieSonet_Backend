package com.viesonet.entity;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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
@Table(name = "BaiViet")

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class BaiViet {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maBaiViet;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ngayDang")
	Date ngayDang = new Date();
	
	private String moTa;
	private String hinhAnh;
	private Boolean trangThai;
	private Integer luotThich;
	private Integer luotBinhLuan;
	@Column(name = "sdt", insertable=false, updatable=false) 
	private String sdt;
	/*N-1*/
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "maCheDo")
	CheDo cheDo;
	
	@ManyToOne
	@JoinColumn(name = "sdt")
	NguoiDung nguoiDung;
	
	/*1-N*/
	@OneToMany(mappedBy = "baiViet")
	List<BaiVietViPham> baiVietViPham;
	
	@OneToMany(mappedBy = "baiViet")
	List<DanhSachBinhLuan> danhSachBinhLuan;
	
	@OneToMany(mappedBy = "baiViet")
	List<DanhSachYeuThich> danhSachYeuThich;
	
	@OneToMany(mappedBy = "baiViet")
	List<ThongBao> thongBao;
	
	
}
