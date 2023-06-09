USE [master]
GO
/****** Object:  Database [Viesonet]    Script Date: 6/8/2023 4:30:20 PM ******/
CREATE DATABASE [Viesonet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Viesonet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Viesonet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Viesonet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Viesonet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Viesonet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Viesonet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Viesonet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Viesonet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Viesonet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Viesonet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Viesonet] SET ARITHABORT OFF 
GO
ALTER DATABASE [Viesonet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Viesonet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Viesonet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Viesonet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Viesonet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Viesonet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Viesonet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Viesonet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Viesonet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Viesonet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Viesonet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Viesonet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Viesonet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Viesonet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Viesonet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Viesonet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Viesonet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Viesonet] SET RECOVERY FULL 
GO
ALTER DATABASE [Viesonet] SET  MULTI_USER 
GO
ALTER DATABASE [Viesonet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Viesonet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Viesonet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Viesonet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Viesonet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Viesonet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Viesonet] SET QUERY_STORE = ON
GO
ALTER DATABASE [Viesonet] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Viesonet]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 6/8/2023 4:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[maBaiViet] [int] IDENTITY(1,1) NOT NULL,
	[sdt] [nvarchar](12) NULL,
	[ngayDang] [datetime] NULL,
	[moTa] [nvarchar](max) NULL,
	[hinhAnh] [nvarchar](100) NULL,
	[luotBinhLuan] [int] NULL,
	[luotThich] [int] NULL,
	[maCheDo] [int] NULL,
	[trangThai] [bit] NULL,
 CONSTRAINT [PK__BaiViet__51CC343A5EAE8013] PRIMARY KEY CLUSTERED 
(
	[maBaiViet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaiVietViPham]    Script Date: 6/8/2023 4:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiVietViPham](
	[maToCao] [int] IDENTITY(1,1) NOT NULL,
	[sdt] [nvarchar](12) NULL,
	[maBaiViet] [int] NULL,
	[maLoai] [int] NULL,
	[ngayToCao] [datetime] NULL,
 CONSTRAINT [PK__BaiVietV__72218031F10FAC84] PRIMARY KEY CLUSTERED 
(
	[maToCao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[banBe]    Script Date: 6/8/2023 4:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banBe](
	[maBanBe] [int] IDENTITY(1,1) NOT NULL,
	[sdt] [nvarchar](12) NULL,
	[sdtBb] [nvarchar](12) NULL,
	[ngayKb] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[maBanBe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheDo]    Script Date: 6/8/2023 4:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheDo](
	[maCheDo] [int] IDENTITY(1,1) NOT NULL,
	[tenCheDo] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[maCheDo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhSachBinhLuan]    Script Date: 6/8/2023 4:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachBinhLuan](
	[maBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[sdt] [nvarchar](12) NULL,
	[chiTiet] [nvarchar](max) NULL,
	[maBaiViet] [int] NULL,
	[ngayBinhLuan] [datetime] NULL,
 CONSTRAINT [PK__DanhSach__CF056B66F1DCFF02] PRIMARY KEY CLUSTERED 
(
	[maBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhSachKetBan]    Script Date: 6/8/2023 4:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachKetBan](
	[maLoiMoi] [int] IDENTITY(1,1) NOT NULL,
	[sdt] [nvarchar](12) NULL,
	[sdtNguoiLa] [nvarchar](12) NULL,
	[ngayGui] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoiMoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhSachYeuThich]    Script Date: 6/8/2023 4:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachYeuThich](
	[maYeuThich] [int] IDENTITY(1,1) NOT NULL,
	[sdt] [nvarchar](12) NULL,
	[maBaiViet] [int] NULL,
	[ngayYeuThich] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[maYeuThich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiViPham]    Script Date: 6/8/2023 4:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiViPham](
	[maLoai] [int] IDENTITY(1,1) NOT NULL,
	[chiTiet] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoiDung]    Script Date: 6/8/2023 4:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoiDung](
	[sdt] [nvarchar](12) NOT NULL,
	[hoTen] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[matKhau] [nvarchar](16) NULL,
	[diaChi] [nvarchar](100) NULL,
	[moiQuanHe] [nvarchar](40) NULL,
	[gioiThieu] [nvarchar](100) NULL,
	[gioiTinh] [bit] NULL,
	[anhDaiDien] [nvarchar](100) NULL,
	[anhBia] [nvarchar](100) NULL,
	[ngaySinh] [date] NULL,
	[ngayTao] [date] NULL,
	[maVaiTro] [int] NULL,
	[soLuongBanBe] [int] NULL,
	[luotViPham] [int] NULL,
	[trangThai] [bit] NULL,
	[thoiGianTruyCap] [datetime] NULL,
 CONSTRAINT [PK__nguoiDun__DDDFB482E07062F2] PRIMARY KEY CLUSTERED 
(
	[sdt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 6/8/2023 4:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTro](
	[maVaiTro] [int] IDENTITY(1,1) NOT NULL,
	[tenVaiTro] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[maVaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BaiViet] ON 

INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (1, N'0939790008', CAST(N'1900-01-01T00:00:06.963' AS DateTime), N'Lần đầu ăn buffet nè!', N'picture.png', 0, 1233, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (2, N'0939790002', CAST(N'1900-01-01T00:00:06.967' AS DateTime), N'Chúc mừng năm mới!', N'picture.png', 0, 234, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (3, N'0939790002', CAST(N'1900-01-01T00:00:06.970' AS DateTime), N'Nam moi da den', N'racist.png', 123, 5, 2, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (4, N'0939790003', CAST(N'1900-01-01T00:00:06.973' AS DateTime), N'GAM TIME!!!! BRING THE HEAT!', N'caMap.jpg', 0, 7, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (5, N'0939790008', CAST(N'1900-01-01T00:00:06.977' AS DateTime), N'Đi chơi với ck iu', N'caMap.jpg', 0, 345, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (6, N'0939790006', CAST(N'1900-01-01T00:00:06.980' AS DateTime), N'Cùng ae công trường quẩy nào', N'caMap.jpg', 0, 654, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (7, N'0939790006', CAST(N'1900-01-01T00:00:06.983' AS DateTime), N'Năm mới đã đến', N'caMap.jpg', 0, 6345, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (8, N'0939790006', CAST(N'1900-01-01T00:00:06.987' AS DateTime), N'Tất cả chỉ là quá khứ', N'caMap.jpg', 0, 36, 3, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (9, N'0939790021', CAST(N'1900-01-01T00:00:06.990' AS DateTime), N'tui có ny r nè mọi người ui', N'mess.jpg', 0, 5, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (10, N'0939790008', CAST(N'1900-01-01T00:00:06.993' AS DateTime), N'Nhìn tụi anh thật cool lạnh như băng mà không cần cố', N'rapViet.jpg', 0, 33446, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (11, N'0939790005', CAST(N'1900-01-01T00:00:06.997' AS DateTime), N'Hít*le muôn lăm', N'rapViet.jpg', 0, 654, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (12, N'0939790003', CAST(N'1900-01-01T00:00:07.000' AS DateTime), N'Cường 7 núi GAM cần anh', N'caMap.jpg', 0, 34565, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (13, N'0939790017', CAST(N'1900-01-01T00:00:07.003' AS DateTime), N'Ngọa Long tiên sinh đây gòiiii', N'caMap.jpg', 0, 754, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (14, N'0939790005', CAST(N'1900-01-01T00:00:07.007' AS DateTime), N'Thanh long đao mới mua', N'caMap.jpg', 0, 64532, 2, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (15, N'0939790008', CAST(N'1900-01-01T00:00:07.010' AS DateTime), N'Phật pháp vô lượng', N'caMap.jpg', 0, 443, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (16, N'0939790001', CAST(N'1900-01-01T00:00:07.013' AS DateTime), N'Tuyên bố tụi bây !@#@$^!#', N'caMap.jpg', 0, 45443, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (17, N'0939790006', CAST(N'1900-01-01T00:00:07.017' AS DateTime), N'Nay xin phép bóc phốt !@#!#!@#', N'caMap.jpg', 0, 246, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (18, N'0939790014', CAST(N'1900-01-01T00:00:07.020' AS DateTime), N'Ai không like ba mẹ !#!#!@@', N'caMap.jpg', 0, 5, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (19, N'0939790013', CAST(N'1900-01-01T00:00:07.023' AS DateTime), N'Chúc mừng sinh nhật em trai tôi', N'caMap.jpg', 0, 34, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (20, N'0939790012', CAST(N'1900-01-01T00:00:07.027' AS DateTime), N'Đi bưng tráp đồ 🐧', N'tranTrung.jpg', 0, 56, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (21, N'0939790011', CAST(N'1900-01-01T00:00:07.030' AS DateTime), N'Red for new year ❤️', N'leVy3.jpg', 0, 54, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (22, N'0939790018', CAST(N'1900-01-01T00:00:07.033' AS DateTime), N'Đẹp trai xứng đáng ở tù 10 năm', N'chiThien.jpg', 0, 456, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (23, N'0939790011', CAST(N'1900-01-01T10:29:07.037' AS DateTime), N'Lâu lắm mới có tấm chụp chung à 🙄', N'laVy2.jpg', 0, 332, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (27, N'0939790002', CAST(N'1900-01-01T00:00:07.040' AS DateTime), N'alo



', N'hlh.jpg', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (28, N'0939790002', CAST(N'1900-01-01T00:00:07.043' AS DateTime), N'new', N'arvssy.png', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (29, N'0939790002', CAST(N'1900-01-01T00:00:07.047' AS DateTime), N'new', N'hlh.jpg', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (30, N'0939790002', CAST(N'1900-01-01T00:00:07.050' AS DateTime), N'new', N'hlh.jpg', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (31, N'0939790002', CAST(N'1900-01-01T00:00:07.053' AS DateTime), N'niu ', N'cayTre2.png', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (32, N'0939790002', CAST(N'1900-01-01T00:00:07.057' AS DateTime), N'old', N'kisspng-ballpoint-pen-quill-clip-art-crisp-vector-5add507b855400.3244341015244534995461.png', 0, 0, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (33, N'0939790002', CAST(N'1900-01-01T00:00:07.060' AS DateTime), N'hbgvfcds', N'caMap.jpg', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (34, N'0939790002', CAST(N'1900-01-01T00:00:07.063' AS DateTime), N'olikujyhbtg', N'cayTre2.png', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (35, N'0939790002', CAST(N'1900-01-01T00:00:07.067' AS DateTime), N'ketthuc', N'caMap.jpg', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (36, N'0939790002', CAST(N'1900-01-01T00:00:07.070' AS DateTime), N'fgvhb', N'cayTre2.png', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (37, N'0939790002', CAST(N'1900-01-01T00:00:07.073' AS DateTime), N'iuyds', N'avt.jpg', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (38, N'0939790002', CAST(N'1900-01-01T00:00:07.077' AS DateTime), N'iuygfz', N'cayTre2.png', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (39, N'0939790002', CAST(N'1900-01-01T00:00:07.080' AS DateTime), N'alo', N'cayTre2.png', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (40, N'0939790002', CAST(N'1900-01-01T00:00:07.083' AS DateTime), N'ádfghm', N'arvssy.png', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (41, N'0939790002', CAST(N'1900-01-01T00:00:07.087' AS DateTime), N'lkjnhbgvfd', N'cayTre2.png', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (42, N'0939790002', CAST(N'1900-01-01T00:00:07.090' AS DateTime), N'sdds', N'cayTre2.png', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (43, N'0939790002', CAST(N'1900-01-01T00:00:07.093' AS DateTime), N'ètyhujiko', N'cayTre2.png', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (44, N'0939790002', CAST(N'1900-01-01T00:00:07.097' AS DateTime), N'last', N'cayTre2.png', 0, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[BaiViet] OFF
GO
SET IDENTITY_INSERT [dbo].[BaiVietViPham] ON 

INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [maLoai], [ngayToCao]) VALUES (1, N'0939790002', 3, 1, CAST(N'2023-02-13T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [maLoai], [ngayToCao]) VALUES (2, N'0939790008', 10, 2, CAST(N'2023-05-27T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [maLoai], [ngayToCao]) VALUES (3, N'0939790011', 11, 3, CAST(N'2023-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [maLoai], [ngayToCao]) VALUES (4, N'0939790019', 14, 4, CAST(N'2023-01-15T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [maLoai], [ngayToCao]) VALUES (5, N'0939790001', 16, 5, CAST(N'2023-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [maLoai], [ngayToCao]) VALUES (6, N'0939790006', 17, 6, CAST(N'2023-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [maLoai], [ngayToCao]) VALUES (7, N'0939790014', 18, 7, CAST(N'2023-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [maLoai], [ngayToCao]) VALUES (8, N'0939790012', 20, 3, CAST(N'2023-05-25T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [maLoai], [ngayToCao]) VALUES (9, N'0939790011', 21, 2, CAST(N'2023-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [maLoai], [ngayToCao]) VALUES (10, N'0939790011', 23, 5, CAST(N'2023-05-26T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[BaiVietViPham] OFF
GO
SET IDENTITY_INSERT [dbo].[banBe] ON 

INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (1, N'0939790002', N'0939790005', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (2, N'0939790002', N'0939790006', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (3, N'0939790002', N'0939790008', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (4, N'0939790002', N'0939790011', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (5, N'0939790002', N'0939790012', CAST(N'2023-05-23' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (6, N'0939790003', N'0939790004', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (7, N'0939790005', N'0939790008', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (8, N'0939790002', N'0939790016', CAST(N'2023-05-20' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (9, N'0939790002', N'0939790018', CAST(N'2023-05-21' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (10, N'0939790018', N'0939790002', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (11, N'0939790002', N'0939790020', CAST(N'2023-05-20' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (12, N'0939790002', N'0939790021', CAST(N'2023-05-19' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (13, N'0939790002', N'0939790003', CAST(N'2023-06-06' AS Date))
INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (14, N'0939790002', N'0939790003', CAST(N'2023-06-06' AS Date))
SET IDENTITY_INSERT [dbo].[banBe] OFF
GO
SET IDENTITY_INSERT [dbo].[CheDo] ON 

INSERT [dbo].[CheDo] ([maCheDo], [tenCheDo]) VALUES (1, N'Công khai')
INSERT [dbo].[CheDo] ([maCheDo], [tenCheDo]) VALUES (2, N'Bạn bè')
INSERT [dbo].[CheDo] ([maCheDo], [tenCheDo]) VALUES (3, N'Chỉ mình tôi')
SET IDENTITY_INSERT [dbo].[CheDo] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhSachBinhLuan] ON 

INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (1, N'0939790001', N'hay ', 23, CAST(N'2023-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (3, N'0939790003', N'quá hay ', 23, CAST(N'2023-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (4, N'0939790004', N'cũng dc', 23, CAST(N'2023-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (150, N'0939790002', N'tôi không bình thường', 23, CAST(N'2023-06-08T01:46:39.167' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (151, N'0939790002', N'qưertyuiop', 23, CAST(N'2023-06-08T01:48:57.047' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (152, N'0939790002', N'alo', 23, CAST(N'2023-06-08T01:50:49.927' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (153, N'0939790002', N'dfg', 23, CAST(N'2023-06-08T01:52:29.827' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (154, N'0939790002', N'tôi không bình thường', 23, CAST(N'2023-06-08T01:53:43.910' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (155, N'0939790002', N'tôi không bình thường', 23, CAST(N'2023-06-08T07:49:46.140' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (156, N'0939790002', N'qưertyuiop', 23, CAST(N'2023-06-08T07:49:49.127' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (157, N'0939790002', N'tôi không bình thường', 23, CAST(N'2023-06-08T07:49:51.743' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (158, N'0939790002', N'qưertyuiopoiugfdszdfghjkl;', 23, CAST(N'2023-06-08T07:49:55.433' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (159, N'0939790002', N'tôi không bình thường', 22, CAST(N'2023-06-08T07:50:02.740' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [chiTiet], [maBaiViet], [ngayBinhLuan]) VALUES (160, N'0939790002', N'ếdxfrtfcvgv bhjjm ,.', 20, CAST(N'2023-06-08T07:50:20.507' AS DateTime))
SET IDENTITY_INSERT [dbo].[DanhSachBinhLuan] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhSachKetBan] ON 

INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (1, N'0939790001', N'0939790002', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (2, N'0939790001', N'0939790003', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (3, N'0939790001', N'0939790004', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (4, N'0939790001', N'0939790005', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (6, N'0939790002', N'0939790004', CAST(N'2023-05-21' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (7, N'0939790002', N'0939790005', CAST(N'2023-05-21' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (8, N'0939790002', N'0939790006', CAST(N'2023-05-21' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (9, N'0939790004', N'0939790006', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (10, N'0939790004', N'0939790008', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (11, N'0939790001', N'0939790008', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (12, N'0939790002', N'0939790004', CAST(N'2023-05-22' AS Date))
SET IDENTITY_INSERT [dbo].[DanhSachKetBan] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] ON 

INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (1, N'0939790001', 1, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (2, N'0939790002', 1, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (3, N'0939790003', 1, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (4, N'0939790004', 1, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (5, N'0939790005', 1, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (6, N'0939790006', 1, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (7, N'0939790008', 1, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (10, N'0939790003', 2, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (11, N'0939790004', 2, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (12, N'0939790005', 2, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (13, N'0939790006', 2, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (14, N'0939790008', 2, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (15, N'0939790011', 3, CAST(N'2023-05-25' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (16, N'0939790012', 3, CAST(N'2023-05-25' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (17, N'0939790013', 3, CAST(N'2023-05-25' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (18, N'0939790014', 3, CAST(N'2023-05-25' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (19, N'0939790015', 3, CAST(N'2023-05-25' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (20, N'0939790019', 3, CAST(N'2023-05-25' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (34, N'0939790002', 9, CAST(N'2023-06-07' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (38, N'0939790002', 12, CAST(N'2023-06-07' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (45, N'0939790002', 23, CAST(N'2023-06-07' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (46, N'0939790002', 22, CAST(N'2023-06-08' AS Date))
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiViPham] ON 

INSERT [dbo].[LoaiViPham] ([maLoai], [chiTiet]) VALUES (1, N'Ngôn từ gây thù ghét')
INSERT [dbo].[LoaiViPham] ([maLoai], [chiTiet]) VALUES (2, N'Nội dung bạo lực và phản cảm')
INSERT [dbo].[LoaiViPham] ([maLoai], [chiTiet]) VALUES (3, N'Ảnh khỏa thân người lớn và hoạt động tình dục')
INSERT [dbo].[LoaiViPham] ([maLoai], [chiTiet]) VALUES (4, N'Gạ gẫm tình dục')
INSERT [dbo].[LoaiViPham] ([maLoai], [chiTiet]) VALUES (5, N'Bạo lực và khích nộ')
INSERT [dbo].[LoaiViPham] ([maLoai], [chiTiet]) VALUES (6, N'Cá nhân và tổ chức nguy hiểm')
INSERT [dbo].[LoaiViPham] ([maLoai], [chiTiet]) VALUES (7, N'Cấu kết gây hại và cổ xúy tội ác')
INSERT [dbo].[LoaiViPham] ([maLoai], [chiTiet]) VALUES (8, N'Hàng hóa và dịch vụ bị hạn chế')
INSERT [dbo].[LoaiViPham] ([maLoai], [chiTiet]) VALUES (9, N'Gian lận và lừa đảo')
SET IDENTITY_INSERT [dbo].[LoaiViPham] OFF
GO
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790001', N'Trần Văn Trung', N'trantrung@gmail.com', N'123456', N'16 Lấp Vò', N'Độc thân', N'Tôi là Trung', 1, N'avatar.png', N'background.png', CAST(N'2003-01-18' AS Date), CAST(N'2022-09-11' AS Date), 1, 0, NULL, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790002', N'Huỳnh Duy Quý', N'huynhquy@gmail.com', N'123456', N'39 Ninh Kiều', N'Độc thân', N'Tôi là Quý', 1, N'avatar.png', N'background.png', CAST(N'2009-01-20' AS Date), CAST(N'2021-05-01' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790003', N'Dương Văn Quá', N'duongqua@gmail.com', N'123456', N'69 Cái Răng', N'Đã kết hôn', N'Tôi là Quá', 1, N'avatar.png', N'background.png', CAST(N'2004-11-22' AS Date), CAST(N'2023-05-11' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790004', N'Nguyễn Thị Hồng Hạnh', N'nguyenhanh@gmail.com', N'123456', N'69 Cái Răng', N'Đã kết hôn', N'Tôi là Hạnh', 0, N'avatar.png', N'background.png', CAST(N'2001-10-12' AS Date), CAST(N'2022-11-21' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790005', N'Trần Ngọc Anh', N'trananh@gmail.com', N'123456', N'12 Bình Thủy', N'Đang hẹn hò', N'Tôi là Anh', 0, N'avatar.png', N'background.png', CAST(N'2003-05-13' AS Date), CAST(N'2023-08-01' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790006', N'Ngũ Duy Mạnh', N'ngumanh@gmail.com', N'123456', N'39 Sa Đéc', N'Độc thân', N'Tôi là Mạnh', 1, N'avatar.png', N'background.png', CAST(N'1997-01-12' AS Date), CAST(N'2021-01-01' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790007', N'Đoàn Thành Lập', N'doanlap@gmail.com', N'123456', N'12 Bình Thủy', N'Đang hẹn hò', N'Tôi là Lập', 1, N'avatar.png', N'background.png', CAST(N'1992-08-01' AS Date), CAST(N'2022-12-31' AS Date), 3, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790008', N'Bùi Minh Hiếu', N'doancong@gmail.com', N'123456', N'12 Bình Thủy', N'Độc thân', N'Tôi là Công', 1, N'minhHieu.jpg', N'background.png', CAST(N'1994-01-04' AS Date), CAST(N'2022-12-31' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790009', N'Bùi Minh Tường', N'buituong@gmail.com', N'123456', N'78 Cờ Đỏ', N'Độc thân', N'Tôi là Tường', 1, N'avatar.png', N'background.png', CAST(N'1999-01-01' AS Date), CAST(N'2023-01-18' AS Date), 2, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790010', N'Lý Duy Vỹ', N'lyvy@gmail.com', N'123456', N'69 Sa Đéc', N'Đang hẹn hò', N'Tôi là Vỹ', 0, N'avatar.png', N'background.png', CAST(N'2010-12-09' AS Date), CAST(N'2022-01-11' AS Date), 2, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790011', N'Lê Tuấn Vỹ', N'trantai@gmail.com', N'123456', N'72 Trung Kiên', N'Độc thân', N'Tôi là Vỹ Sa Đéc', 1, N'leVy.jpg', N'background.png', CAST(N'2002-09-11' AS Date), CAST(N'2022-06-01' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790012', N'Trần Văn Minh Trung', N'duongbi@gmail.com', N'123456', N'91 Ô Môn', N'Đang hẹn hò', N'Tôi là Bỉ', 1, N'avatar.png', N'background.png', CAST(N'2000-12-12' AS Date), CAST(N'2023-01-01' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790013', N'Quan Anh Vũ', N'quanvu@gmail.com', N'123456', N'21 Lai Vung', N'Độc thân', N'Tôi là Trường', 1, N'avatar.png', N'background.png', CAST(N'2003-12-23' AS Date), CAST(N'2022-11-17' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790014', N'Trương Hoàng Phi', N'truongphi@gmail.com', N'123456', N'31 Cờ Đỏ', N'Độc thân', N'Tôi là Phi', 1, N'avatar.png', N'background.png', CAST(N'2002-12-18' AS Date), CAST(N'2022-12-18' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790015', N'Triệu Ngọc Vân', N'trieuvan@gmail.com', N'123456', N'21 Vàm Cống', N'Đang hẹn hò', N'Tôi là Vân', 0, N'avatar.png', N'background.png', CAST(N'2003-03-20' AS Date), CAST(N'2023-01-19' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790016', N'Lữ Linh Khởi', N'lukhoi@gmail.com', N'123456', N'81 Phong Điền', N'Đang hẹn hò', N'Tôi là Khởi', 0, N'avatar.png', N'background.png', CAST(N'2001-05-22' AS Date), CAST(N'2023-02-11' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790017', N'Tào Mạnh Đức', N'taoduc@gmail.com', N'123456', N'18 Trung An', N'Độc thân', N'Tôi là Đức', 1, N'avatar.png', N'background.png', CAST(N'2000-06-06' AS Date), CAST(N'2023-03-20' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790018', N'Võ Chí Thiện', N'lubo@gmail.com', N'123456', N'10 Thốt Nốt', N'Đã kết hôn', N'Tôi là Bố', 1, N'chiThien.jpg', N'background.png', CAST(N'2007-01-11' AS Date), CAST(N'2022-11-11' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790019', N'Điển Vi Vi', N'dienvi@gmail.com', N'123456', N'73 Thuận Hưng', N'Độc thân', N'Tôi là Vi', 0, N'avatar.png', N'background.png', CAST(N'2001-08-01' AS Date), CAST(N'2023-02-11' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790020', N'Trương Oanh Oanh', N'oanhoanh@gmail.com', N'123456', N'82 Vĩnh Thạnh', N'Độc thân', N'Tôi là Oanh', 0, N'avatar.png', N'background.png', CAST(N'2000-05-22' AS Date), CAST(N'2022-11-11' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790021', N'Nguyễn Chí Cường', N'quachhuy@gmail.com', N'123456', N'28 Vĩnh Thạnh', N'Độc thân', N'Tôi là Huy', 1, N'chiCuong.jpg', N'background.png', CAST(N'2012-06-06' AS Date), CAST(N'2023-05-22' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790022', N'Gia Cát Lượng', N'gialuong@gmail.com', N'123456', N'98 Lũng Cú', N'Đang hẹn hò', N'Tôi là Lượng', 1, N'avatar.png', N'background.png', CAST(N'2002-06-16' AS Date), CAST(N'2022-06-06' AS Date), 1, 0, 0, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[VaiTro] ON 

INSERT [dbo].[VaiTro] ([maVaiTro], [tenVaiTro]) VALUES (1, N'Người dùng')
INSERT [dbo].[VaiTro] ([maVaiTro], [tenVaiTro]) VALUES (2, N'Nhân viên')
INSERT [dbo].[VaiTro] ([maVaiTro], [tenVaiTro]) VALUES (3, N'Quản lí')
SET IDENTITY_INSERT [dbo].[VaiTro] OFF
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [fk_cheDo_baiViet] FOREIGN KEY([maCheDo])
REFERENCES [dbo].[CheDo] ([maCheDo])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [fk_cheDo_baiViet]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [fk_nguoiDung_baiViet] FOREIGN KEY([sdt])
REFERENCES [dbo].[nguoiDung] ([sdt])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [fk_nguoiDung_baiViet]
GO
ALTER TABLE [dbo].[BaiVietViPham]  WITH CHECK ADD  CONSTRAINT [fk_baiViet_Bvvp] FOREIGN KEY([maBaiViet])
REFERENCES [dbo].[BaiViet] ([maBaiViet])
GO
ALTER TABLE [dbo].[BaiVietViPham] CHECK CONSTRAINT [fk_baiViet_Bvvp]
GO
ALTER TABLE [dbo].[BaiVietViPham]  WITH CHECK ADD  CONSTRAINT [fk_baiViet_loaiViPham] FOREIGN KEY([maLoai])
REFERENCES [dbo].[LoaiViPham] ([maLoai])
GO
ALTER TABLE [dbo].[BaiVietViPham] CHECK CONSTRAINT [fk_baiViet_loaiViPham]
GO
ALTER TABLE [dbo].[BaiVietViPham]  WITH CHECK ADD  CONSTRAINT [fk_nguoiDung_Bvvp] FOREIGN KEY([sdt])
REFERENCES [dbo].[nguoiDung] ([sdt])
GO
ALTER TABLE [dbo].[BaiVietViPham] CHECK CONSTRAINT [fk_nguoiDung_Bvvp]
GO
ALTER TABLE [dbo].[banBe]  WITH CHECK ADD  CONSTRAINT [fk_nguoiDung_banBe] FOREIGN KEY([sdt])
REFERENCES [dbo].[nguoiDung] ([sdt])
GO
ALTER TABLE [dbo].[banBe] CHECK CONSTRAINT [fk_nguoiDung_banBe]
GO
ALTER TABLE [dbo].[banBe]  WITH CHECK ADD  CONSTRAINT [fk_nguoiDung_banBe2] FOREIGN KEY([sdtBb])
REFERENCES [dbo].[nguoiDung] ([sdt])
GO
ALTER TABLE [dbo].[banBe] CHECK CONSTRAINT [fk_nguoiDung_banBe2]
GO
ALTER TABLE [dbo].[DanhSachBinhLuan]  WITH CHECK ADD  CONSTRAINT [fk_baiViet_Dsbl] FOREIGN KEY([maBaiViet])
REFERENCES [dbo].[BaiViet] ([maBaiViet])
GO
ALTER TABLE [dbo].[DanhSachBinhLuan] CHECK CONSTRAINT [fk_baiViet_Dsbl]
GO
ALTER TABLE [dbo].[DanhSachBinhLuan]  WITH CHECK ADD  CONSTRAINT [fk_nguoiDung_Dsbl] FOREIGN KEY([sdt])
REFERENCES [dbo].[nguoiDung] ([sdt])
GO
ALTER TABLE [dbo].[DanhSachBinhLuan] CHECK CONSTRAINT [fk_nguoiDung_Dsbl]
GO
ALTER TABLE [dbo].[DanhSachKetBan]  WITH CHECK ADD  CONSTRAINT [fk_nguoiDung_DsKb] FOREIGN KEY([sdt])
REFERENCES [dbo].[nguoiDung] ([sdt])
GO
ALTER TABLE [dbo].[DanhSachKetBan] CHECK CONSTRAINT [fk_nguoiDung_DsKb]
GO
ALTER TABLE [dbo].[DanhSachKetBan]  WITH CHECK ADD  CONSTRAINT [fk_nguoiDung_DsKb2] FOREIGN KEY([sdtNguoiLa])
REFERENCES [dbo].[nguoiDung] ([sdt])
GO
ALTER TABLE [dbo].[DanhSachKetBan] CHECK CONSTRAINT [fk_nguoiDung_DsKb2]
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD  CONSTRAINT [fk_danhSachYeuThich_baiViet] FOREIGN KEY([maBaiViet])
REFERENCES [dbo].[BaiViet] ([maBaiViet])
GO
ALTER TABLE [dbo].[DanhSachYeuThich] CHECK CONSTRAINT [fk_danhSachYeuThich_baiViet]
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD  CONSTRAINT [fk_nguoiDung_Dsyt] FOREIGN KEY([sdt])
REFERENCES [dbo].[nguoiDung] ([sdt])
GO
ALTER TABLE [dbo].[DanhSachYeuThich] CHECK CONSTRAINT [fk_nguoiDung_Dsyt]
GO
ALTER TABLE [dbo].[nguoiDung]  WITH CHECK ADD  CONSTRAINT [fk_vaiTronguoiDung_] FOREIGN KEY([maVaiTro])
REFERENCES [dbo].[VaiTro] ([maVaiTro])
GO
ALTER TABLE [dbo].[nguoiDung] CHECK CONSTRAINT [fk_vaiTronguoiDung_]
GO
USE [master]
GO
ALTER DATABASE [Viesonet] SET  READ_WRITE 
GO
