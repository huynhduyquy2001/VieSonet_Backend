CREATE PROCEDURE sp_ThongKeBaiVietViPhamTheoThang (
    @Nam INT
)
AS
BEGIN
    -- Tạo bảng tạm chứa 12 tháng
    WITH Thang(Thang) AS (
        SELECT 1
        UNION ALL
        SELECT Thang + 1 FROM Thang WHERE Thang < 12
    ), 
    -- Lấy thông tin số lượng bài viết vi phạm theo từng tháng trong năm
    ThongKe(Thang, SoBaiVietViPham) AS (
        SELECT MONTH(ngayToCao), COUNT(DISTINCT maBaiViet)
        FROM BaiVietViPham
        WHERE YEAR(ngayToCao) = @Nam  and trangThai = 0
        GROUP BY MONTH(ngayToCao)
    )
    -- Kết hợp thông tin với bảng tạm chứa 12 tháng
    SELECT Thang.Thang, ISNULL(SoBaiVietViPham, 0) AS SoBaiVietViPham
    FROM Thang
    LEFT JOIN ThongKe ON Thang.Thang = ThongKe.Thang

END
EXEC sp_ThongKeBaiVietViPhamTheoThang 2023


CREATE PROCEDURE sp_ThongKeSoLuotBaoCaoTheoThang (
    @Nam INT
)
AS
BEGIN

    -- Tạo bảng tạm chứa 12 tháng
    WITH Thang(Thang) AS (
        SELECT 1
        UNION ALL
        SELECT Thang + 1 FROM Thang WHERE Thang < 12
    ), 
    -- Lấy thông tin số lượng bài viết vi phạm theo từng tháng trong năm
    ThongKe(Thang, SoLuotBaoCao) AS (
        SELECT MONTH(ngayToCao), COUNT(DISTINCT maToCao)
        FROM BaiVietViPham
        WHERE YEAR(ngayToCao) = @Nam and trangThai = 1
        GROUP BY MONTH(ngayToCao)
    )
    -- Kết hợp thông tin với bảng tạm chứa 12 tháng
    SELECT Thang.Thang, ISNULL(SoLuotBaoCao, 0) AS SoLuotBaoCao
    FROM Thang
    LEFT JOIN ThongKe ON Thang.Thang = ThongKe.Thang

END
EXEC sp_ThongKeSoLuotBaoCaoTheoThang 2023

--2.Thống kê số lượng người đăng ký theo tháng--
CREATE PROCEDURE sp_ThongKeSoLuongDangKyTheoThang (
    @Nam INT
)
AS
BEGIN

    -- Tạo bảng tạm chứa 12 tháng
    WITH Thang(Thang) AS (
        SELECT 1
        UNION ALL
        SELECT Thang + 1 FROM Thang WHERE Thang < 12
    ), 
    -- Lấy thông tin số lượng bài viết vi phạm theo từng tháng trong năm
    ThongKe(Thang, SoLuongDangKy) AS (
        SELECT MONTH(ngayTao), COUNT(DISTINCT sdt)
        FROM nguoiDung
        WHERE YEAR(ngayTao) = @Nam
        GROUP BY MONTH(ngayTao)
    )
    -- Kết hợp thông tin với bảng tạm chứa 12 tháng
    SELECT Thang.Thang, ISNULL(SoLuongDangKy, 0) AS SoLuongDangKy
    FROM Thang
    LEFT JOIN ThongKe ON Thang.Thang = ThongKe.Thang

END
--Lệnh chạy chương trình xem kết quả
EXEC sp_ThongKeSoLuongDangKyTheoThang  @nam = 2023 -->Truyền tham số để xét điều kiện

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
EXEC sp_ThongKeSoLuotThichCaoNhat '2023-05-25' -->Truyền tham số để xét điều kiện
--Lệnh xóa proc
DROP PROC sp_ThongKeSoLuotThichCaoNhat 
