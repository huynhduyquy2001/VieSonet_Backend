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
public class PostWithComment {
	int MaBaiViet;
	String tenNguoiDung;
	String anhDaiDien;
	Date ngayDang;
	String moTa;
	String hinhAnh;
	int luotLike;
	int luotBinhLuan;
}
