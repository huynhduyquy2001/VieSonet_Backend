package com.viesonet.report;

import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Data
@Getter
@Setter
public class ThongKeResponse {
	
	private List<Object> dsBaiVietViPham;
	private List<Object> dsSoLuotBaoCao;
	
	public ThongKeResponse(String thongKeJson, String thongKeJson1) {
		
	}

	public ThongKeResponse(List<Object> dsBaiVietViPham, List<Object> dsSoLuotBaoCao) {
		super();
		this.dsBaiVietViPham = dsBaiVietViPham;
		this.dsSoLuotBaoCao = dsSoLuotBaoCao;
	}
	
	
}
