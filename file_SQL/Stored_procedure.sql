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
        WHERE YEAR(ngayToCao) = @Nam
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
        WHERE YEAR(ngayToCao) = @Nam
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
CREATE PROCEDURE sp_ThongKeSoLuotThichCaoNhat
    @month DATE
AS
BEGIN
    SELECT TOP 10 
        BaiViet.hinhAnh AS HinhAnh,
        BaiViet.maBaiViet AS MaBaiViet,
        nguoiDung.hoTen AS NguoiDang,
        BaiViet.moTa AS MoTa,
        COUNT(DanhSachYeuThich.maBaiViet) AS LuotThich
    FROM 
        DanhSachYeuThich
        JOIN BaiViet ON DanhSachYeuThich.maBaiViet = BaiViet.maBaiViet
        JOIN nguoiDung ON BaiViet.sdt = nguoiDung.sdt
    WHERE 
        DanhSachYeuThich.ngayYeuThich BETWEEN DATEFROMPARTS(YEAR(@month), MONTH(@month), 1) AND EOMONTH(@month)
    GROUP BY 
        BaiViet.hinhAnh,
        BaiViet.maBaiViet,
        nguoiDung.hoTen,
        BaiViet.moTa
    ORDER BY 
        LuotThich DESC;
END
EXEC sp_ThongKeSoLuotThichCaoNhat '2023-05-22'
