package com.viesonet.entity;

import java.util.List;

public class BinhLuanResponse {
    private Object baiViet;
    private List<Object> danhSachBinhLuan;

    public BinhLuanResponse(Object baiViet, List<Object> danhSachBinhLuan) {
        this.baiViet = baiViet;
        this.danhSachBinhLuan = danhSachBinhLuan;
    }

    public Object getBaiViet() {
        return baiViet;
    }

    public void setBaiViet(Object baiViet) {
        this.baiViet = baiViet;
    }

    public List<Object> getDanhSachBinhLuan() {
        return danhSachBinhLuan;
    }

    public void setDanhSachBinhLuan(List<Object> danhSachBinhLuan) {
        this.danhSachBinhLuan = danhSachBinhLuan;
    }
}

