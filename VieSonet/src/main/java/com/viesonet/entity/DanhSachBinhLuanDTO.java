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
public class DanhSachBinhLuanDTO {
    private String chiTiet;
    private Date ngayBinhLuan;
    private String hoTen;
    private String anhDaiDien;
    // getters, setters
}

