package com.viesonet.entity;

import java.util.List;


import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class VaiTro {
	@Id
	private int maVaiTro;
	private String tenVaiTro;
	
	@OneToMany(mappedBy = "vaiTro")
	List<NguoiDung> nguoiDung;
}
