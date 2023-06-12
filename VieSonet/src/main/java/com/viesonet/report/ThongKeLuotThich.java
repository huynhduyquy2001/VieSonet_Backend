package com.viesonet.report;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ThongKeLuotThich {
	private String hinhAnh;
	private int maBaiViet;
	private String nguoiDang;
	private String moTa;
	private int luotThich;
}
