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
public class DanhSachViPham {
	private int maBaiViet;
	 private Date ngayDang;
	 private String hoTen;
}
