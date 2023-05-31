--1.Thống kê số bài viết vi phạm theo tháng--
--Lệnh tạo
CREATE PROC sp_ThongKeBaiVietViPham(@month int)
as begin
select 
       COUNT(DISTINCT maBaiViet) SoBaiVietViPham
from BaiVietViPham
where MONTH(ngayToCao) = @month --> Điều kiện
end
--Lệnh chạy chương trình xem kết quả
EXEC sp_ThongKeBaiVietViPham 05 -->Truyền tham số để xét điều kiện
--Lệnh xóa proc
DROP PROC sp_ThongKeBaiVietViPham

--1.Thống kê số lượt báo cáo theo tháng--
--Lệnh tạo
CREATE PROC sp_ThongKeSoLuotBaoCao(@month int)
as begin
select 
       COUNT(DISTINCT maToCao) SoLuotBaoCao
from BaiVietViPham
where MONTH(ngayToCao) = @month --> Điều kiện
end
--Lệnh chạy chương trình xem kết quả
EXEC sp_ThongKeSoLuotBaoCao 05 -->Truyền tham số để xét điều kiện
--Lệnh xóa proc
DROP PROC sp_ThongKeSoLuotBaoCao

--2.Thống kê số lượng người đăng ký theo tháng--
--Lệnh tạo
CREATE PROC sp_ThongKeSoLuongNguoiDangKy(@month int)
as begin
select 
       COUNT(DISTINCT sdt) SoLuongDangKy
from nguoiDung
where MONTH(ngayTao) = @month --> Điều kiện
end
--Lệnh chạy chương trình xem kết quả
EXEC sp_ThongKeSoLuongNguoiDangKy 01 -->Truyền tham số để xét điều kiện
--Lệnh xóa proc
DROP PROC sp_ThongKeSoLuongNguoiDangKy



--3.Thống kê bài viết có số lượt thích cao nhất theo ngày tháng năm-- 
--Lệnh tạo
CREATE PROC sp_ThongKeSoLuotThichCaoNhat(@month date)
as begin
select top 10 BaiViet.hinhAnh HinhAnh,
       BaiViet.maBaiViet MaBaiViet,
	   nguoiDung.hoTen NguoiDang,
	   BaiViet.moTa MoTa,
	   COUNT(DanhSachYeuThich.maBaiViet) LuotThich
from DanhSachYeuThich, BaiViet, nguoiDung
where DanhSachYeuThich.maBaiViet=BaiViet.maBaiViet and BaiViet.sdt = nguoiDung.sdt
and DanhSachYeuThich.ngayYeuThich = @month --> Điều kiện
group by BaiViet.hinhAnh, BaiViet.maBaiViet, nguoiDung.hoTen, BaiViet.moTa
order by LuotThich DESC
end
--Lệnh chạy chương trình xem kết quả
EXEC sp_ThongKeSoLuotThichCaoNhat '2023-05-22' -->Truyền tham số để xét điều kiện
--Lệnh xóa proc
DROP PROC sp_ThongKeSoLuotThichCaoNhat 