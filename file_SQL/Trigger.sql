

--Trigger để xét trạng thái người dùng nếu lượt vi phạm >= 5 thì false và lượt vi phạm < 5 thì true
CREATE TRIGGER tr_update_trangThai
ON nguoiDung
AFTER UPDATE
AS
BEGIN
    UPDATE nguoiDung
    SET trangThai = CASE
        WHEN luotViPham >= 5 THEN 'FALSE' 
        ELSE 'TRUE'
    END
    WHERE sdt IN (SELECT sdt FROM inserted);
END;

--Tăng lượt vi phạm nếu trạng thái bài viết vi phạm là false--
CREATE TRIGGER UpdateLuotViPham
ON BaiVietViPham
AFTER UPDATE
AS
BEGIN
    IF UPDATE(trangThai) AND EXISTS (SELECT * FROM BaiVietViPham WHERE trangThai = 'false')
    BEGIN
        UPDATE nguoiDung
        SET luotViPham = luotViPham + 1
        FROM nguoiDung
        INNER JOIN BaiViet ON nguoiDung.sdt = baiViet.sdt
        INNER JOIN BaiVietViPham ON baiViet.maBaiViet = BaiVietViPham.maBaiViet
        WHERE BaiVietViPham.trangThai = 'FALSE'
          AND nguoiDung.sdt IN (SELECT sdt FROM BaiViet WHERE maBaiViet IN (SELECT maBaiViet FROM inserted));
    END
END;




--Giảm lượt vi phạm nếu bỏ vi phạm bài viết--
CREATE TRIGGER tr_delete_BaiVietViPham
ON BaiVietViPham
AFTER DELETE
AS
BEGIN
    UPDATE nguoiDung
    SET luotViPham = luotViPham - 1
    FROM nguoiDung
    INNER JOIN BaiViet ON nguoiDung.sdt = BaiViet.sdt
    INNER JOIN deleted ON BaiViet.maBaiViet = deleted.maBaiViet
    WHERE deleted.trangThai = 'FALSE'
    AND nguoiDung.luotViPham > 0; -- Thêm điều kiện này để chỉ giảm khi luotViPham > 0
END;

--Cập nhật trạng thái của bài viết thành false nếu số lượt tố cáo >=5 --
CREATE TRIGGER tr_UpdateTrangThai2
ON BaiVietViPham
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
    DECLARE @maBaiViet INT;
    SET @maBaiViet = (SELECT maBaiViet FROM inserted);

    UPDATE BaiVietViPham
    SET trangThai = 'false'
    WHERE maBaiViet IN (
        SELECT maBaiViet
        FROM (
            SELECT maBaiViet, COUNT(*) AS soMaToCao
            FROM BaiVietViPham
            WHERE trangThai = 'true' AND maBaiViet = @maBaiViet
            GROUP BY maBaiViet
        ) AS temp
        WHERE soMaToCao >= 5
    );
END;

--Thêm vào Bảng thông báo nếu trạng thái bài viết vi phạm = false--
CREATE TRIGGER AutoTrigger 
    ON BaiVietViPham
    AFTER UPDATE
AS
BEGIN
    IF UPDATE(trangThai) AND EXISTS (SELECT * FROM BaiVietViPham WHERE trangThai = 'false')
    BEGIN
        INSERT INTO ThongBao (noiDung, ngayThongBao, sdt, maBaiViet, trangThai)
        SELECT DISTINCT N'Bài viết của bạn đã bị vi phạm', GETDATE(), sdt, maBaiViet, 'false'
        FROM BaiVietViPham
        WHERE trangThai = 'false'
            AND maBaiViet NOT IN (SELECT maBaiViet FROM ThongBao);
    END
END;

--Trạng thái của Bài Viết sẽ thành false nếu Bài Viết Vi Phạm có trạng thái là false
CREATE TRIGGER bai_viet_vi_pham_trg ON BaiVietViPham AFTER UPDATE
AS
BEGIN
  IF UPDATE(trangThai) AND EXISTS (SELECT * FROM BaiVietViPham WHERE trangThai = 0)
  BEGIN
    UPDATE BaiViet
    SET trangThai = 0
    FROM BaiViet
    INNER JOIN BaiVietViPham ON BaiViet.maBaiViet = BaiVietViPham.maBaiViet;
  END
END