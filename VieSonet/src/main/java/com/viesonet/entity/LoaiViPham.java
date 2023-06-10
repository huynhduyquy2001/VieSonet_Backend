package com.viesonet.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.Date;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "LoaiViPham")
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LoaiViPham {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int maLoai;
private String chiTiet;

@OneToMany(mappedBy = "loaiViPham")
List<BaiVietViPham> baiVietViPham;
}
