USE [master]
GO
/****** Object:  Database [Viesonet]    Script Date: 6/3/2023 10:55:43 PM ******/
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
/****** Object:  Table [dbo].[BaiViet]    Script Date: 6/3/2023 10:55:43 PM ******/
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
/****** Object:  Table [dbo].[BaiVietViPham]    Script Date: 6/3/2023 10:55:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiVietViPham](
	[maToCao] [int] IDENTITY(1,1) NOT NULL,
	[sdt] [nvarchar](12) NULL,
	[maBaiViet] [int] NULL,
	[ngayToCao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[maToCao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[banBe]    Script Date: 6/3/2023 10:55:43 PM ******/
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
/****** Object:  Table [dbo].[CheDo]    Script Date: 6/3/2023 10:55:43 PM ******/
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
/****** Object:  Table [dbo].[DanhSachBinhLuan]    Script Date: 6/3/2023 10:55:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachBinhLuan](
	[maBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[sdt] [nvarchar](12) NULL,
	[maBaiViet] [int] NULL,
	[ngayBinhLuan] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[maBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhSachKetBan]    Script Date: 6/3/2023 10:55:43 PM ******/
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
/****** Object:  Table [dbo].[DanhSachYeuThich]    Script Date: 6/3/2023 10:55:43 PM ******/
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
/****** Object:  Table [dbo].[nguoiDung]    Script Date: 6/3/2023 10:55:43 PM ******/
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
/****** Object:  Table [dbo].[VaiTro]    Script Date: 6/3/2023 10:55:43 PM ******/
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

INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (1, N'0939790001', CAST(N'2023-01-22T00:00:00.000' AS DateTime), N'Lần đầu ăn buffet nè!', N'picture.png', 0, 1233, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (2, N'0939790002', CAST(N'2023-02-11T00:00:00.000' AS DateTime), N'Chúc mừng năm mới!', N'picture.png', 0, 234, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (3, N'0939790002', CAST(N'2023-02-11T00:00:00.000' AS DateTime), N'Nam moi da den', N'racist.png', 123, 5, 2, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (4, N'0939790003', CAST(N'2023-05-25T00:00:00.000' AS DateTime), N'GAM TIME!!!! BRING THE HEAT!', N'picture.png', 0, 7, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (5, N'0939790004', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Đi chơi với ck iu', N'picture.png', 0, 345, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (6, N'0939790005', CAST(N'2023-02-15T00:00:00.000' AS DateTime), N'Cùng ae công trường quẩy nào', N'picture.png', 0, 654, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (7, N'0939790006', CAST(N'2023-02-11T00:00:00.000' AS DateTime), N'Năm mới đã đến', N'picture.png', 0, 6345, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (8, N'0939790012', CAST(N'2022-03-11T00:00:00.000' AS DateTime), N'Tất cả chỉ là quá khứ', N'picture.png', 0, 36, 3, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (9, N'0939790021', CAST(N'2023-05-21T00:00:00.000' AS DateTime), N'Anh chạ iu em ', N'picture.png', 0, 5, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (10, N'0939790008', CAST(N'2023-05-24T00:00:00.000' AS DateTime), N'nsfw', N'nsfw.png', 0, 33446, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (11, N'0939790011', CAST(N'2023-03-10T00:00:00.000' AS DateTime), N'Hít*le muôn lăm', N'duck.png', 0, 654, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (12, N'0939790003', CAST(N'2023-01-11T00:00:00.000' AS DateTime), N'Cường 7 núi GAM cần anh', N'picture.png', 0, 34565, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (13, N'0939790017', CAST(N'2022-12-06T00:00:00.000' AS DateTime), N'Ngọa Long tiên sinh đây gòiiii', N'picture.png', 0, 754, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (14, N'0939790019', CAST(N'2023-01-12T00:00:00.000' AS DateTime), N'Thanh long đao mới mua', N'picture.png', 0, 64532, 2, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (15, N'0939790008', CAST(N'2023-02-02T00:00:00.000' AS DateTime), N'Phật pháp vô lượng', N'picture.png', 0, 443, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (16, N'0939790001', CAST(N'2023-04-01T00:00:00.000' AS DateTime), N'Tuyên bố tụi bây !@#@$^!#', N'swearing.png', 0, 45443, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (17, N'0939790006', CAST(N'2023-03-11T00:00:00.000' AS DateTime), N'Nay xin phép bóc phốt !@#!#!@#', N'drama.png', 0, 246, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (18, N'0939790014', CAST(N'2023-03-11T00:00:00.000' AS DateTime), N'Ai không like ba mẹ !#!#!@@', N'dog.png', 0, 5, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (19, N'0939790013', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Chúc mừng sinh nhật em trai tôi', N'picture.png', 0, 34, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (20, N'0939790012', CAST(N'2023-05-25T00:00:00.000' AS DateTime), N'VCB 1203919287', N'trash.png', 0, 56, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (21, N'0939790011', CAST(N'2023-05-18T00:00:00.000' AS DateTime), N'Nettruyen rác !@#(!#*', N'swearing.png', 0, 54, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (22, N'0939790018', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhậu đê ae', N'picture.png', 0, 456, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (23, N'0939790011', CAST(N'2023-05-26T00:00:00.000' AS DateTime), N'Tao không biết m là nhưng *!#!&#', N'drama.png', 0, 332, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BaiViet] OFF
GO
SET IDENTITY_INSERT [dbo].[BaiVietViPham] ON 

INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [ngayToCao]) VALUES (1, N'0939790002', 3, CAST(N'2023-02-13T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [ngayToCao]) VALUES (2, N'0939790008', 10, CAST(N'2023-05-27T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [ngayToCao]) VALUES (3, N'0939790011', 11, CAST(N'2023-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [ngayToCao]) VALUES (4, N'0939790019', 14, CAST(N'2023-01-15T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [ngayToCao]) VALUES (5, N'0939790001', 16, CAST(N'2023-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [ngayToCao]) VALUES (6, N'0939790006', 17, CAST(N'2023-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [ngayToCao]) VALUES (7, N'0939790014', 18, CAST(N'2023-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [ngayToCao]) VALUES (8, N'0939790012', 20, CAST(N'2023-05-25T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [ngayToCao]) VALUES (9, N'0939790011', 21, CAST(N'2023-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[BaiVietViPham] ([maToCao], [sdt], [maBaiViet], [ngayToCao]) VALUES (10, N'0939790011', 23, CAST(N'2023-05-26T00:00:00.000' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[banBe] OFF
GO
SET IDENTITY_INSERT [dbo].[CheDo] ON 

INSERT [dbo].[CheDo] ([maCheDo], [tenCheDo]) VALUES (1, N'Công khai')
INSERT [dbo].[CheDo] ([maCheDo], [tenCheDo]) VALUES (2, N'Bạn bè')
INSERT [dbo].[CheDo] ([maCheDo], [tenCheDo]) VALUES (3, N'Chỉ mình tôi')
SET IDENTITY_INSERT [dbo].[CheDo] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhSachBinhLuan] ON 

INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [maBaiViet], [ngayBinhLuan]) VALUES (1, N'0939790001', 1, CAST(N'2023-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [maBaiViet], [ngayBinhLuan]) VALUES (2, N'0939790002', 1, CAST(N'2023-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [maBaiViet], [ngayBinhLuan]) VALUES (3, N'0939790003', 1, CAST(N'2023-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [maBaiViet], [ngayBinhLuan]) VALUES (4, N'0939790004', 1, CAST(N'2023-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [maBaiViet], [ngayBinhLuan]) VALUES (5, N'0939790005', 1, CAST(N'2023-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [maBaiViet], [ngayBinhLuan]) VALUES (6, N'0939790006', 1, CAST(N'2023-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [maBaiViet], [ngayBinhLuan]) VALUES (7, N'0939790002', 2, CAST(N'2023-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [maBaiViet], [ngayBinhLuan]) VALUES (8, N'0939790003', 2, CAST(N'2023-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [maBaiViet], [ngayBinhLuan]) VALUES (9, N'0939790004', 2, CAST(N'2023-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [maBaiViet], [ngayBinhLuan]) VALUES (10, N'0939790005', 2, CAST(N'2023-05-24T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [maBaiViet], [ngayBinhLuan]) VALUES (11, N'0939790006', 2, CAST(N'2023-05-24T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhSachBinhLuan] ([maBinhLuan], [sdt], [maBaiViet], [ngayBinhLuan]) VALUES (12, N'0939790008', 2, CAST(N'2023-05-24T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[DanhSachBinhLuan] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhSachKetBan] ON 

INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (1, N'0939790001', N'0939790002', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (2, N'0939790001', N'0939790003', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (3, N'0939790001', N'0939790004', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (4, N'0939790001', N'0939790005', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (5, N'0939790002', N'0939790003', CAST(N'2023-05-22' AS Date))
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
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (8, N'0939790002', 2, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachYeuThich] ([maYeuThich], [sdt], [maBaiViet], [ngayYeuThich]) VALUES (9, N'0939790001', 2, CAST(N'2023-05-22' AS Date))
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
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] OFF
GO
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790001', N'Trần Văn Trung', N'trantrung@gmail.com', N'123456', N'16 Lấp Vò', N'Độc thân', N'Tôi là Trung', 1, N'avatar.png', N'background.png', CAST(N'2022-09-11' AS Date), 1, 0, NULL, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790002', N'Huỳnh Ngọc Quý', N'huynhquy@gmail.com', N'123456', N'39 Ninh Kiều', N'Độc thân', N'Tôi là Quý', 1, N'avatar.png', N'background.png', CAST(N'2021-05-01' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790003', N'Dương Văn Quá', N'duongqua@gmail.com', N'123456', N'69 Cái Răng', N'Đã kết hôn', N'Tôi là Quá', 1, N'avatar.png', N'background.png', CAST(N'2023-05-11' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790004', N'Nguyễn Thị Hồng Hạnh', N'nguyenhanh@gmail.com', N'123456', N'69 Cái Răng', N'Đã kết hôn', N'Tôi là Hạnh', 0, N'avatar.png', N'background.png', CAST(N'2022-11-21' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790005', N'Trần Ngọc Anh', N'trananh@gmail.com', N'123456', N'12 Bình Thủy', N'Đang hẹn hò', N'Tôi là Anh', 0, N'avatar.png', N'background.png', CAST(N'2023-08-01' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790006', N'Ngũ Duy Mạnh', N'ngumanh@gmail.com', N'123456', N'39 Sa Đéc', N'Độc thân', N'Tôi là Mạnh', 1, N'avatar.png', N'background.png', CAST(N'2021-01-01' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790007', N'Đoàn Thành Lập', N'doanlap@gmail.com', N'123456', N'12 Bình Thủy', N'Đang hẹn hò', N'Tôi là Lập', 1, N'avatar.png', N'background.png', CAST(N'2022-12-31' AS Date), 3, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790008', N'Đoàn Thành Công', N'doancong@gmail.com', N'123456', N'12 Bình Thủy', N'Độc thân', N'Tôi là Công', 1, N'avatar.png', N'background.png', CAST(N'2022-12-31' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790009', N'Bùi Minh Tường', N'buituong@gmail.com', N'123456', N'78 Cờ Đỏ', N'Độc thân', N'Tôi là Tường', 1, N'avatar.png', N'background.png', CAST(N'2023-01-18' AS Date), 2, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790010', N'Lý Duy Vỹ', N'lyvy@gmail.com', N'123456', N'69 Sa Đéc', N'Đang hẹn hò', N'Tôi là Vỹ', 0, N'avatar.png', N'background.png', CAST(N'2022-01-11' AS Date), 2, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790011', N'Trần Anh Tài', N'trantai@gmail.com', N'123456', N'72 Trung Kiên', N'Độc thân', N'Tôi là Tài', 1, N'avatar.png', N'background.png', CAST(N'2022-06-01' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790012', N'Dương Chí Bảo', N'duongbi@gmail.com', N'123456', N'91 Ô Môn', N'Đang hẹn hò', N'Tôi là Bỉ', 1, N'avatar.png', N'background.png', CAST(N'2023-01-01' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790013', N'Quan Anh Vũ', N'quanvu@gmail.com', N'123456', N'21 Lai Vung', N'Độc thân', N'Tôi là Trường', 1, N'avatar.png', N'background.png', CAST(N'2022-11-17' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790014', N'Trương Hoàng Phi', N'truongphi@gmail.com', N'123456', N'31 Cờ Đỏ', N'Độc thân', N'Tôi là Phi', 1, N'avatar.png', N'background.png', CAST(N'2022-12-18' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790015', N'Triệu Ngọc Vân', N'trieuvan@gmail.com', N'123456', N'21 Vàm Cống', N'Đang hẹn hò', N'Tôi là Vân', 0, N'avatar.png', N'background.png', CAST(N'2023-01-19' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790016', N'Lữ Linh Khởi', N'lukhoi@gmail.com', N'123456', N'81 Phong Điền', N'Đang hẹn hò', N'Tôi là Khởi', 0, N'avatar.png', N'background.png', CAST(N'2023-02-11' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790017', N'Tào Mạnh Đức', N'taoduc@gmail.com', N'123456', N'18 Trung An', N'Độc thân', N'Tôi là Đức', 1, N'avatar.png', N'background.png', CAST(N'2023-03-20' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790018', N'Lữ Bố', N'lubo@gmail.com', N'123456', N'10 Thốt Nốt', N'Đã kết hôn', N'Tôi là Bố', 1, N'avatar.png', N'background.png', CAST(N'2022-11-11' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790019', N'Điển Vi Vi', N'dienvi@gmail.com', N'123456', N'73 Thuận Hưng', N'Độc thân', N'Tôi là Vi', 0, N'avatar.png', N'background.png', CAST(N'2023-02-11' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790020', N'Trương Oanh Oanh', N'oanhoanh@gmail.com', N'123456', N'82 Vĩnh Thạnh', N'Độc thân', N'Tôi là Oanh', 0, N'avatar.png', N'background.png', CAST(N'2022-11-11' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790021', N'Quách Gia Huy', N'quachhuy@gmail.com', N'123456', N'28 Vĩnh Thạnh', N'Độc thân', N'Tôi là Huy', 1, N'avatar.png', N'background.png', CAST(N'2023-05-22' AS Date), 1, 0, 0, 1, NULL)
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790022', N'Gia Cát Lượng', N'gialuong@gmail.com', N'123456', N'98 Lũng Cú', N'Đang hẹn hò', N'Tôi là Lượng', 1, N'avatar.png', N'background.png', CAST(N'2022-06-06' AS Date), 1, 0, 0, 1, NULL)
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
