package com.viesonet.beans;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("deprecation")
@Data
@NoArgsConstructor
@AllArgsConstructor

public class BaiVietModel {

    @NotBlank(message = "Không được để trống moTa")
    private String moTa;

    @NotNull(message = "Không được để trống trạng thái")
    private Boolean trangThai;
}
