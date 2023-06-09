USE [master]
GO
/****** Object:  Database [Viesonet]    Script Date: 13/06/2023 5:15:13 CH ******/
CREATE DATABASE [Viesonet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Viesonet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Viesonet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Viesonet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Viesonet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
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
EXEC sys.sp_db_vardecimal_storage_format N'Viesonet', N'ON'
GO
ALTER DATABASE [Viesonet] SET QUERY_STORE = ON
GO
ALTER DATABASE [Viesonet] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Viesonet]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 13/06/2023 5:15:13 CH ******/
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
/****** Object:  Table [dbo].[BaiVietViPham]    Script Date: 13/06/2023 5:15:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiVietViPham](
	[maToCao] [int] IDENTITY(1,1) NOT NULL,
	[sdt] [nvarchar](12) NULL,
	[maBaiViet] [int] NULL,
	[maLoai] [int] NULL,
	[trangThai] [bit] NULL,
	[ngayToCao] [datetime] NULL,
 CONSTRAINT [PK__BaiVietV__72218031F10FAC84] PRIMARY KEY CLUSTERED 
(
	[maToCao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[banBe]    Script Date: 13/06/2023 5:15:13 CH ******/
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
/****** Object:  Table [dbo].[CheDo]    Script Date: 13/06/2023 5:15:13 CH ******/
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
/****** Object:  Table [dbo].[DanhSachBinhLuan]    Script Date: 13/06/2023 5:15:13 CH ******/
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
/****** Object:  Table [dbo].[DanhSachKetBan]    Script Date: 13/06/2023 5:15:13 CH ******/
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
/****** Object:  Table [dbo].[DanhSachYeuThich]    Script Date: 13/06/2023 5:15:13 CH ******/
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
/****** Object:  Table [dbo].[LoaiViPham]    Script Date: 13/06/2023 5:15:13 CH ******/
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
/****** Object:  Table [dbo].[nguoiDung]    Script Date: 13/06/2023 5:15:13 CH ******/
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
/****** Object:  Table [dbo].[ThongBao]    Script Date: 13/06/2023 5:15:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBao](
	[maThongBao] [int] IDENTITY(1,1) NOT NULL,
	[noiDung] [nvarchar](max) NULL,
	[ngayThongBao] [datetime] NULL,
	[sdt] [nvarchar](12) NULL,
	[trangThai] [bit] NULL,
	[maBaiViet] [int] NULL,
 CONSTRAINT [PK__ThongBao__657CA5397E379822] PRIMARY KEY CLUSTERED 
(
	[maThongBao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 13/06/2023 5:15:13 CH ******/
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

INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (60, N'0939790299', CAST(N'2023-06-13T15:50:04.927' AS DateTime), N'cong khai', N'', 0, 0, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (61, N'0939790299', CAST(N'2023-06-13T15:50:11.257' AS DateTime), N'ban be', N'', 0, 0, 2, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (62, N'0939790299', CAST(N'2023-06-13T15:50:23.227' AS DateTime), N'chi minh toi', N'', 0, 0, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (63, N'0939790299', CAST(N'2023-06-13T15:50:55.400' AS DateTime), N'cong khai', N'leVy.jpg', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (64, N'0939790299', CAST(N'2023-06-13T15:51:02.923' AS DateTime), N'', N'avt.jpg', 0, 0, 1, 0)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (65, N'0939790299', CAST(N'2023-06-13T15:51:19.120' AS DateTime), N'chi minh toi', N'tranTrung.jpg', 0, 0, 3, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (66, N'0939790299', CAST(N'2023-06-13T15:51:36.403' AS DateTime), N'ban be', N'avt.jpg', 0, 0, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (67, N'0939790299', CAST(N'2023-06-13T15:51:49.033' AS DateTime), N'Đổi ảnh đại diện nào!!', N'avt.jpg', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (68, N'0793960634', CAST(N'2023-06-13T17:03:16.540' AS DateTime), N'123123123', N'', 0, 0, 1, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (69, N'0793960634', CAST(N'2023-06-13T17:03:50.197' AS DateTime), N'bb', N'', 0, 0, 2, 1)
INSERT [dbo].[BaiViet] ([maBaiViet], [sdt], [ngayDang], [moTa], [hinhAnh], [luotBinhLuan], [luotThich], [maCheDo], [trangThai]) VALUES (70, N'0793960634', CAST(N'2023-06-13T17:03:58.003' AS DateTime), N'cmt', N'', 0, 0, 3, 1)
SET IDENTITY_INSERT [dbo].[BaiViet] OFF
GO
SET IDENTITY_INSERT [dbo].[banBe] ON 

INSERT [dbo].[banBe] ([maBanBe], [sdt], [sdtBb], [ngayKb]) VALUES (27, N'0767161102', N'0939790299', CAST(N'2023-06-13' AS Date))
SET IDENTITY_INSERT [dbo].[banBe] OFF
GO
SET IDENTITY_INSERT [dbo].[CheDo] ON 

INSERT [dbo].[CheDo] ([maCheDo], [tenCheDo]) VALUES (1, N'Công khai')
INSERT [dbo].[CheDo] ([maCheDo], [tenCheDo]) VALUES (2, N'Bạn bè')
INSERT [dbo].[CheDo] ([maCheDo], [tenCheDo]) VALUES (3, N'Chỉ mình tôi')
SET IDENTITY_INSERT [dbo].[CheDo] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhSachKetBan] ON 

INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (3, N'0939790001', N'0939790004', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (4, N'0939790001', N'0939790005', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (9, N'0939790004', N'0939790006', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (10, N'0939790004', N'0939790008', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (11, N'0939790001', N'0939790008', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (12, N'0939790003', N'0939790001', CAST(N'2023-06-12' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (13, N'0939790012', N'0939790013', CAST(N'2023-06-12' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (15, N'0939790020', N'0939790012', CAST(N'2023-06-13' AS Date))
INSERT [dbo].[DanhSachKetBan] ([maLoiMoi], [sdt], [sdtNguoiLa], [ngayGui]) VALUES (21, N'0767161102', N'0793960634', CAST(N'2023-06-13' AS Date))
SET IDENTITY_INSERT [dbo].[DanhSachKetBan] OFF
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
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0767161102', N'Huỳnh Duy Quý', N'duyquy@gmail.com', N'123456', NULL, NULL, NULL, 0, N'avatar2.jpg', N'anhBia.jpg', CAST(N'2023-06-13' AS Date), CAST(N'2023-06-13' AS Date), 1, 0, 0, 1, CAST(N'2023-06-13T17:05:23.810' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0793960634', N'Lê Tuấn Vỹ', N'letuanvy123@gmail.com', N'123456', NULL, NULL, NULL, 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'2023-06-13' AS Date), CAST(N'2023-06-13' AS Date), 1, 0, 0, 1, CAST(N'2023-06-13T17:04:11.577' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790001', N'Trần Văn Trung', N'trantrung@gmail.com', N'123456', N'16 Lấp Vò', N'Độc thân', N'Tôi là Trung', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'2003-01-18' AS Date), CAST(N'2022-09-11' AS Date), 1, 0, 0, 1, CAST(N'2023-06-13T15:33:22.177' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790002', N'Duy Quý', N'huynhquy2001@gmail.com', N'123456', N'39 Ninh Kiềuu', N'Độc thân', N'Tôi là Quýy', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'2009-01-20' AS Date), CAST(N'2021-05-01' AS Date), 1, 0, 0, 1, CAST(N'2023-06-13T15:01:00.213' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790003', N'Dương Văn Quá', N'duongqua@gmail.com', N'123456', N'69 Cái Răng', N'Đã kết hôn', N'Tôi là Quá', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'2004-11-22' AS Date), CAST(N'2023-05-11' AS Date), 1, 0, 0, 1, CAST(N'2023-06-13T14:15:22.857' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790004', N'Nguyễn Thị Hồng Hạnh', N'nguyenhanh@gmail.com', N'123456', N'69 Cái Răng', N'Đã kết hôn', N'Tôi là Hạnh', 0, N'avatar2.jpg', N'anhBia.jpg', CAST(N'2001-10-12' AS Date), CAST(N'2022-11-21' AS Date), 1, 0, 0, 1, CAST(N'2023-06-13T14:06:19.867' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790005', N'Trần Ngọc Anh', N'trananh@gmail.com', N'123456', N'12 Bình Thủy', N'Đang hẹn hò', N'Tôi là Anh', 0, N'avatar2.jpg', N'anhBia.jpg', CAST(N'2003-05-13' AS Date), CAST(N'2023-08-01' AS Date), 1, 0, 0, 1, CAST(N'1975-04-30T09:45:00.000' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790006', N'Ngũ Duy Mạnh', N'ngumanh@gmail.com', N'123456', N'39 Sa Đéc', N'Độc thân', N'Tôi là Mạnh', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'1997-01-12' AS Date), CAST(N'2021-01-01' AS Date), 1, 0, 0, 1, CAST(N'1975-04-30T09:45:00.000' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790007', N'Đoàn Thành Lập', N'doanlap@gmail.com', N'123456', N'12 Bình Thủy', N'Đang hẹn hò', N'Tôi là Lập', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'1992-08-01' AS Date), CAST(N'2022-12-31' AS Date), 3, 0, 0, 1, CAST(N'2023-06-13T15:19:09.273' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790008', N'Bùi Minh Hiếu', N'doancong@gmail.com', N'123456', N'12 Bình Thủy', N'Độc thân', N'Tôi là Công', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'1994-01-04' AS Date), CAST(N'2022-12-31' AS Date), 1, 0, 0, 1, CAST(N'1975-04-30T09:45:00.000' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790009', N'Bùi Minh Tường', N'buituong@gmail.com', N'123456', N'78 Cờ Đỏ', N'Độc thân', N'Tôi là Tường', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'1999-01-01' AS Date), CAST(N'2023-01-18' AS Date), 2, 0, 0, 1, CAST(N'2023-06-13T15:09:48.963' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790010', N'Lý Duy Vỹ', N'lyvy@gmail.com', N'123456', N'69 Sa Đéc', N'Đang hẹn hò', N'Tôi là Vỹ', 0, N'avatar2.jpg', N'anhBia.jpg', CAST(N'2010-12-09' AS Date), CAST(N'2022-01-11' AS Date), 2, 0, 0, 1, CAST(N'1975-04-30T09:45:00.000' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790011', N'Lê Tuấn Vỹ', N'trantai@gmail.com', N'123456', N'72 Trung Kiên', N'Độc thân', N'Tôi là Vỹ Sa Đéc', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'2002-09-11' AS Date), CAST(N'2022-06-01' AS Date), 1, 0, 0, 1, CAST(N'2023-06-12T22:55:06.927' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790012', N'Trần Văn Minh Trung', N'duongbi@gmail.com', N'123456', N'91 Ô Môn', N'Đang hẹn hò', N'Tôi là Bỉ', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'2000-12-12' AS Date), CAST(N'2023-01-01' AS Date), 1, 0, 0, 1, CAST(N'2023-06-12T22:37:54.963' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790013', N'Quan Anh Vũ', N'quanvu@gmail.com', N'123456', N'21 Lai Vung', N'Độc thân', N'Tôi là Trường', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'2003-12-23' AS Date), CAST(N'2022-11-17' AS Date), 1, 0, 0, 1, CAST(N'2023-06-12T22:08:11.540' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790014', N'Trương Hoàng Phi', N'truongphi@gmail.com', N'123456', N'31 Cờ Đỏ', N'Độc thân', N'Tôi là Phi', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'2002-12-18' AS Date), CAST(N'2022-12-18' AS Date), 1, 0, 0, 1, CAST(N'1975-04-30T09:45:00.000' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790015', N'Triệu Ngọc Vân', N'trieuvan@gmail.com', N'123456', N'21 Vàm Cống', N'Đang hẹn hò', N'Tôi là Vân', 0, N'avatar2.jpg', N'anhBia.jpg', CAST(N'2003-03-20' AS Date), CAST(N'2023-01-19' AS Date), 1, 0, 0, 1, CAST(N'1975-04-30T09:45:00.000' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790016', N'Lữ Linh Khởi', N'lukhoi@gmail.com', N'123456', N'81 Phong Điền', N'Đang hẹn hò', N'Tôi là Khởi', 0, N'avatar2.jpg', N'anhBia.jpg', CAST(N'2001-05-22' AS Date), CAST(N'2023-02-11' AS Date), 1, 0, 0, 1, CAST(N'1975-04-30T09:45:00.000' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790017', N'Tào Mạnh Đức', N'taoduc@gmail.com', N'123456', N'18 Trung An', N'Độc thân', N'Tôi là Đức', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'2000-06-06' AS Date), CAST(N'2023-03-20' AS Date), 1, 0, 0, 1, CAST(N'1975-04-30T09:45:00.000' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790018', N'Võ Chí Thiện', N'lubo@gmail.com', N'123456', N'10 Thốt Nốt', N'Đã kết hôn', N'Tôi là Bố', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'2007-01-11' AS Date), CAST(N'2022-11-11' AS Date), 1, 0, 0, 1, CAST(N'1975-04-30T09:45:00.000' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790019', N'Điển Vi Vi', N'dienvi@gmail.com', N'123456', N'73 Thuận Hưng', N'Độc thân', N'Tôi là Vi', 0, N'avatar2.jpg', N'anhBia.jpg', CAST(N'2001-08-01' AS Date), CAST(N'2023-02-11' AS Date), 1, 0, 0, 1, CAST(N'1975-04-30T09:45:00.000' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790020', N'Trương Oanh Oanh', N'oanhoanh@gmail.com', N'123456', N'82 Vĩnh Thạnh', N'Độc thân', N'Tôi là Oanh', 0, N'avatar2.jpg', N'anhBia.jpg', CAST(N'2000-05-22' AS Date), CAST(N'2022-11-11' AS Date), 1, 0, 0, 1, CAST(N'2023-06-13T14:51:57.073' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790021', N'Nguyễn Chí Cường', N'quachhuy@gmail.com', N'123456', N'28 Vĩnh Thạnh', N'Độc thân', N'Tôi là Huy', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'2012-06-06' AS Date), CAST(N'2023-05-22' AS Date), 1, 0, 0, 1, CAST(N'1975-04-30T09:45:00.000' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790022', N'Gia Cát Lượng', N'gialuong@gmail.com', N'123456', N'98 Lũng Cú', N'Đang hẹn hò', N'Tôi là Lượng', 1, N'avatar1.jpg', N'anhBia.jpg', CAST(N'2002-06-16' AS Date), CAST(N'2022-06-06' AS Date), 1, 0, 0, 1, CAST(N'1975-04-30T09:45:00.000' AS DateTime))
INSERT [dbo].[nguoiDung] ([sdt], [hoTen], [email], [matKhau], [diaChi], [moiQuanHe], [gioiThieu], [gioiTinh], [anhDaiDien], [anhBia], [ngaySinh], [ngayTao], [maVaiTro], [soLuongBanBe], [luotViPham], [trangThai], [thoiGianTruyCap]) VALUES (N'0939790299', N'Trần Trung', N'ttmt1801@gmail.com', N'123456', N'69 LV', N'Độc thân', N'Tôi là Trung', 1, N'avt.jpg', N'nenDangNhap2.jpeg', CAST(N'2023-06-13' AS Date), CAST(N'2023-06-13' AS Date), 1, 0, 0, 1, CAST(N'2023-06-13T16:40:47.060' AS DateTime))
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
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD  CONSTRAINT [fk_thongBao_baiViet] FOREIGN KEY([maBaiViet])
REFERENCES [dbo].[BaiViet] ([maBaiViet])
GO
ALTER TABLE [dbo].[ThongBao] CHECK CONSTRAINT [fk_thongBao_baiViet]
GO
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD  CONSTRAINT [fk_thongBao_nguoiDung] FOREIGN KEY([sdt])
REFERENCES [dbo].[nguoiDung] ([sdt])
GO
ALTER TABLE [dbo].[ThongBao] CHECK CONSTRAINT [fk_thongBao_nguoiDung]
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeBaiVietViPhamTheoThang]    Script Date: 13/06/2023 5:15:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThongKeBaiVietViPhamTheoThang] (
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeSoLuongDangKyTheoThang]    Script Date: 13/06/2023 5:15:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThongKeSoLuongDangKyTheoThang] (
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeSoLuotBaoCaoTheoThang]    Script Date: 13/06/2023 5:15:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThongKeSoLuotBaoCaoTheoThang] (
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeSoLuotThichCaoNhat]    Script Date: 13/06/2023 5:15:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ThongKeSoLuotThichCaoNhat](@month date)
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
GO
USE [master]
GO
ALTER DATABASE [Viesonet] SET  READ_WRITE 
GO
