package com.viesonet.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "ThongBao")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ThongBao {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private int maThongBao;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ngayThongBao")
	Date ngayThongBao = new Date();
	
	private String noiDung;
	boolean trangThai;
	
	@ManyToOne
	@JoinColumn(name = "sdt")
	NguoiDung nguoiDung;
	
	@ManyToOne
	@JoinColumn(name = "maBaiViet")
	BaiViet baiViet;
	
}
