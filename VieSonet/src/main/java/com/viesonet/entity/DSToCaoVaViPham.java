package com.viesonet.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Data
@Getter @Setter
public class DSToCaoVaViPham {
	List<DanhSachBaiVietBiToCao> dsBiToCao;
	List<DanhSachViPham> dsViPham;
	
	
	
	public DSToCaoVaViPham(List<DanhSachBaiVietBiToCao> dsBiToCao, List<DanhSachViPham> dsViPham) {
		this.dsBiToCao = dsBiToCao;
		this.dsViPham = dsViPham;
	}



	public DSToCaoVaViPham() {
	
	}


}
