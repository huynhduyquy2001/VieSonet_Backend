package com.viesonet.entity;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "VaiTro")
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
