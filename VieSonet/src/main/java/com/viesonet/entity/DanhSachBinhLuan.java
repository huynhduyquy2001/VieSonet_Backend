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
import jakarta.persistence.UniqueConstraint;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "DanhSachBinhLuan")

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class DanhSachBinhLuan {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maBinhLuan;
	private String chiTiet;

	@ManyToOne
	@JoinColumn(name = "sdt")
	NguoiDung nguoiDung;

	@ManyToOne
	@JoinColumn(name = "maBaiViet")
	BaiViet baiViet;
	
	

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ngayBinhLuan")
	Date ngayBinhLuan = new Date();
}
