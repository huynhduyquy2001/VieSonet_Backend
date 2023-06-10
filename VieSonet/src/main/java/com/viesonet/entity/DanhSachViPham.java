package com.viesonet.entity;


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
	 private String ngayDang;
	 private String hoTen;
}
