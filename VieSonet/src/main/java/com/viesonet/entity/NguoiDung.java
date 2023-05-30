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
public class NguoiDung {
	private String sdt;
	private String hoTen;
	private String email;
	private String matKhau;
	private String diaChi;
	private String tinhYeu;
	private String gioiThieu;
	private String anhDaiDien;
	private Boolean gioiTinh;
	private String anhBia;
	private Date ngayTao;
	private int maVaiTro;
	private Boolean trangThai;
	private Date thoiGianTruyCap;
}
