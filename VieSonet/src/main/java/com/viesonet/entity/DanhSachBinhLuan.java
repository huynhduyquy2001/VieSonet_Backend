package com.viesonet.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class DanhSachBinhLuan {
	private int maBinhLuan;
	private String sdt;
	private int maBaiViet;
	private Date ngayBinhLuan;
}
