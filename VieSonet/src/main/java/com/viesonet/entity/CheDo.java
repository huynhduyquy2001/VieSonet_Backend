package com.viesonet.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
@Table(name = "CheDo")

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class CheDo {
	@Id
	private int maCheDo;
	private String tenCheDo;
	
	@JsonIgnore
	@OneToMany(mappedBy = "cheDo")
	List<BaiViet> baiViet;
	
}
