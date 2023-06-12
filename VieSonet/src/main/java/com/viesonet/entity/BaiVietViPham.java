package com.viesonet.entity;

import java.util.Date;
import java.util.Optional;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
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
@Table(name = "BaiVietViPham", uniqueConstraints = { @UniqueConstraint(columnNames = { "sdt", "maBaiViet" }) })

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class BaiVietViPham {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maToCao;
	@Column(name = "trangThai")
	private Boolean trangThai;
	
	@ManyToOne
	@JoinColumn(name = "sdt")
	NguoiDung nguoiDung;
	
	@ManyToOne
	@JoinColumn(name = "maBaiViet")
	BaiViet baiViet;
	
	@ManyToOne
	@JoinColumn(name = "maLoai")
	LoaiViPham loaiViPham;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "ngayToCao")
	Date ngayToCao = new Date();

}
