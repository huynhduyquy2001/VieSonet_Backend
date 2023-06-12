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
@Table(name = "BanBe", uniqueConstraints = { @UniqueConstraint(columnNames = { "sdt", "sdtBb" }) })
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class BanBe {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maBanBe;
	@ManyToOne
	@JoinColumn(name = "sdt")
	NguoiDung nguoiDung;
	
	@ManyToOne
	@JoinColumn(name = "sdtBb")
	NguoiDung banBe;
	
	@Column(name = "sdtBb", insertable=false, updatable=false) 
	private String sdtBb;
	
	@Column(name = "sdt", insertable=false, updatable=false) 
	private String sdt;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "ngayKb")
	Date ngayKb = new Date();
}
