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
public class BaiViet {
	private int maBaiViet;
	private String sdt;
	private Date ngayDang;
	private String moTa;
	private String hinhAnh;
	private int maCheDo;
	private Boolean trangThai;
}
