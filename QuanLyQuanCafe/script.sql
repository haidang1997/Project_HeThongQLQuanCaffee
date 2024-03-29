USE [master]
GO
/****** Object:  Database [QLQuanCafe]    Script Date: 11/23/2017 8:55:57 AM ******/
CREATE DATABASE [QLQuanCafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLQuanCafe', FILENAME = N'E:\dacn\DoanQLCF\DoanQLCF\QuanLyQuanCafe.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLQuanCafe_log', FILENAME = N'E:\dacn\DoanQLCF\DoanQLCF\QuanLyQuanCafe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLQuanCafe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLQuanCafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLQuanCafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLQuanCafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLQuanCafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLQuanCafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLQuanCafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLQuanCafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLQuanCafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLQuanCafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLQuanCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLQuanCafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLQuanCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLQuanCafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLQuanCafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLQuanCafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLQuanCafe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLQuanCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLQuanCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLQuanCafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLQuanCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLQuanCafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLQuanCafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLQuanCafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLQuanCafe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLQuanCafe] SET  MULTI_USER 
GO
ALTER DATABASE [QLQuanCafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLQuanCafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLQuanCafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLQuanCafe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLQuanCafe] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLQuanCafe]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 11/23/2017 8:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [int] IDENTITY(1,1) NOT NULL,
	[TenBan] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[MaLoaiBan] [int] NULL,
 CONSTRAINT [PK_Ban] PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill]    Script Date: 11/23/2017 8:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[MaBill] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [datetime] NULL CONSTRAINT [DF_Bill_ThoiGian]  DEFAULT (sysdatetime()),
	[MaBan] [int] NULL,
	[TrangThai] [bit] NULL,
	[TongTien] [float] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[MaBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTBill]    Script Date: 11/23/2017 8:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTBill](
	[MaCTBill] [int] IDENTITY(1,1) NOT NULL,
	[MaBill] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[MaTV] [int] NULL,
 CONSTRAINT [PK_CTBill] PRIMARY KEY CLUSTERED 
(
	[MaCTBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTDonDatHang]    Script Date: 11/23/2017 8:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDonDatHang](
	[MaCTDDH] [int] IDENTITY(1,1) NOT NULL,
	[MaDDH] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[MaTV] [int] NULL,
 CONSTRAINT [PK_CTDonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaCTDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTNhapHang]    Script Date: 11/23/2017 8:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTNhapHang](
	[MaCTNhapHang] [int] IDENTITY(1,1) NOT NULL,
	[MaNhapHang] [int] NULL,
	[MaSPNhap] [int] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_CTNhapHang] PRIMARY KEY CLUSTERED 
(
	[MaCTNhapHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DatBan]    Script Date: 11/23/2017 8:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatBan](
	[MaBan] [int] IDENTITY(1,1) NOT NULL,
	[TenBan] [nvarchar](50) NULL,
	[MaLoaiBan] [int] NULL,
	[TongTien] [float] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_DatBan] PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 11/23/2017 8:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [date] NULL,
	[NgayGiao] [date] NULL,
	[TinhTrangDDH] [bit] NULL,
	[TongTienHD] [float] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangNhap]    Script Date: 11/23/2017 8:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangNhap](
	[MaSPNhap] [int] IDENTITY(1,1) NOT NULL,
	[TenSPNhap] [nvarchar](50) NULL,
	[GiaSPNhap] [float] NULL,
	[MaNhaCungCap] [int] NULL,
 CONSTRAINT [PK_HangNhap] PRIMARY KEY CLUSTERED 
(
	[MaSPNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiBan]    Script Date: 11/23/2017 8:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiBan](
	[MaLoaiBan] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiBan] [nvarchar](50) NULL,
	[TangGia] [float] NULL,
 CONSTRAINT [PK_LoaiBan] PRIMARY KEY CLUSTERED 
(
	[MaLoaiBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiNV]    Script Date: 11/23/2017 8:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNV](
	[MaLoaiNV] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiNV] [nvarchar](50) NULL,
	[UuDaiNV] [float] NULL,
 CONSTRAINT [PK_LoaiNV] PRIMARY KEY CLUSTERED 
(
	[MaLoaiNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 11/23/2017 8:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSP] [nvarchar](50) NULL,
	[MaPhanLoai] [int] NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiTV]    Script Date: 11/23/2017 8:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTV](
	[MaLoaiTV] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiTV] [nvarchar](50) NULL,
	[UuDai] [float] NULL,
 CONSTRAINT [PK_LoaiTV] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNhaCungCap] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaCungCap] [nvarchar](max) NULL,
	[DiaChiNCC] [nvarchar](max) NULL,
	[SdtNCC] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[DiaChiNV] [nvarchar](max) NULL,
	[SdtNV] [nvarchar](50) NULL,
	[NgayVaoLam] [date] NULL,
	[TaiKhoan] [nvarchar](max) NULL,
	[MatKhau] [nvarchar](max) NULL,
	[MaLoaiNV] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhapHang]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhapHang](
	[MaNhapHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [date] NULL,
	[TongTienNhap] [float] NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK_NhapHang] PRIMARY KEY CLUSTERED 
(
	[MaNhapHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanLoaiSP]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoaiSP](
	[MaPhanLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenPhanLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhanLoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaPhanLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[Gia] [int] NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaLoaiSP] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[MaTV] [int] IDENTITY(1,1) NOT NULL,
	[TenTV] [nvarchar](max) NULL,
	[GioiTinh] [nchar](10) NULL,
	[DiaChiTV] [nvarchar](max) NULL,
	[EmailTV] [nvarchar](max) NULL,
	[SdtTV] [nvarchar](50) NULL,
	[MaLoaiTV] [int] NULL,
 CONSTRAINT [PK_ThanhVien] PRIMARY KEY CLUSTERED 
(
	[MaTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[v_ThongKe]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ThongKe]
AS
SELECT        dbo.Ban.TenBan, dbo.Bill.ThoiGian, dbo.CTBill.SoLuong, dbo.SanPham.Gia, dbo.Bill.TrangThai, dbo.Bill.MaBill
FROM            dbo.Ban INNER JOIN
                         dbo.Bill ON dbo.Ban.MaBan = dbo.Bill.MaBan INNER JOIN
                         dbo.CTBill ON dbo.Bill.MaBill = dbo.CTBill.MaBill INNER JOIN
                         dbo.SanPham ON dbo.CTBill.MaSP = dbo.SanPham.MaSP


GO
SET IDENTITY_INSERT [dbo].[Ban] ON 

INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (1, N'Bàn 1', 1, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (2, N'Bàn 2', 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (3, N'Bàn 3', 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (4, N'Bàn 4', 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (5, N'Bàn 5', 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (6, N'Bàn 6', 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (7, N'Bàn 7', 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (8, N'Bàn 8', 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (9, N'Bàn 9', 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (10, N'Bàn 10', 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (11, N'Bàn 11', 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (12, N'Bàn 12', 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (13, N'Bàn 13', 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (14, N'Bàn 14', 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai], [MaLoaiBan]) VALUES (15, N'Bàn 15', 0, 2)
SET IDENTITY_INSERT [dbo].[Ban] OFF
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([MaBill], [ThoiGian], [MaBan], [TrangThai], [TongTien]) VALUES (23, CAST(N'2017-11-23 07:07:24.697' AS DateTime), 6, 1, 75000)
INSERT [dbo].[Bill] ([MaBill], [ThoiGian], [MaBan], [TrangThai], [TongTien]) VALUES (24, CAST(N'2017-11-23 07:33:09.430' AS DateTime), 5, 1, 45000)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[CTBill] ON 

INSERT [dbo].[CTBill] ([MaCTBill], [MaBill], [MaSP], [SoLuong], [MaTV]) VALUES (26, 23, 1, 1, NULL)
INSERT [dbo].[CTBill] ([MaCTBill], [MaBill], [MaSP], [SoLuong], [MaTV]) VALUES (27, 23, 2, 1, NULL)
INSERT [dbo].[CTBill] ([MaCTBill], [MaBill], [MaSP], [SoLuong], [MaTV]) VALUES (28, 23, 5, 1, NULL)
INSERT [dbo].[CTBill] ([MaCTBill], [MaBill], [MaSP], [SoLuong], [MaTV]) VALUES (29, 24, 1, 1, 1)
INSERT [dbo].[CTBill] ([MaCTBill], [MaBill], [MaSP], [SoLuong], [MaTV]) VALUES (30, 24, 3, 1, 1)
SET IDENTITY_INSERT [dbo].[CTBill] OFF
SET IDENTITY_INSERT [dbo].[LoaiBan] ON 

INSERT [dbo].[LoaiBan] ([MaLoaiBan], [TenLoaiBan], [TangGia]) VALUES (1, N'Bàn Thường', 0)
INSERT [dbo].[LoaiBan] ([MaLoaiBan], [TenLoaiBan], [TangGia]) VALUES (2, N'Bàn Vip', 5)
INSERT [dbo].[LoaiBan] ([MaLoaiBan], [TenLoaiBan], [TangGia]) VALUES (3, N'Take Away', 0)
SET IDENTITY_INSERT [dbo].[LoaiBan] OFF
SET IDENTITY_INSERT [dbo].[LoaiNV] ON 

INSERT [dbo].[LoaiNV] ([MaLoaiNV], [TenLoaiNV], [UuDaiNV]) VALUES (1, N'Admin', 100)
SET IDENTITY_INSERT [dbo].[LoaiNV] OFF
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP], [MaPhanLoai]) VALUES (1, N'Sinh Tố', 2)
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP], [MaPhanLoai]) VALUES (2, N'Soda', 2)
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP], [MaPhanLoai]) VALUES (3, N'Bánh Ngọt', 1)
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
SET IDENTITY_INSERT [dbo].[LoaiTV] ON 

INSERT [dbo].[LoaiTV] ([MaLoaiTV], [TenLoaiTV], [UuDai]) VALUES (1, N'Silver', 5)
INSERT [dbo].[LoaiTV] ([MaLoaiTV], [TenLoaiTV], [UuDai]) VALUES (2, N'Gold', 10)
INSERT [dbo].[LoaiTV] ([MaLoaiTV], [TenLoaiTV], [UuDai]) VALUES (3, N'Diamond', 15)
SET IDENTITY_INSERT [dbo].[LoaiTV] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChiNV], [SdtNV], [NgayVaoLam], [TaiKhoan], [MatKhau], [MaLoaiNV]) VALUES (2, N'Nguyễn Xuân Việt Anh', N'419/7/3 Phạm Ngũ Lão, phường Hiệp Thành', N'01644671469', CAST(N'2017-09-20' AS Date), N'vietanhdh', N'01644671469', 1)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[PhanLoaiSP] ON 

INSERT [dbo].[PhanLoaiSP] ([MaPhanLoai], [TenPhanLoai]) VALUES (1, N'Foods')
INSERT [dbo].[PhanLoaiSP] ([MaPhanLoai], [TenPhanLoai]) VALUES (2, N'Drinks')
SET IDENTITY_INSERT [dbo].[PhanLoaiSP] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoaiSP]) VALUES (1, N'Sinh tố Bơ', 20000, N'stbo.png', N'Ngon', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoaiSP]) VALUES (2, N'Sinh tố Xoài', 25000, N'stxoai.png', N'Hơi Ngon', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoaiSP]) VALUES (3, N'Sinh tố Việt Quất', 30000, N'stvietquat.png', N'Ngon vật vã', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoaiSP]) VALUES (4, N'Soda Bạc hà', 25000, N'sdbacha.png', N'Tởm', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoaiSP]) VALUES (5, N'Bánh Ngọt 1', 30000, N'banh1.png', N'Ngon', 3)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[ThanhVien] ON 

INSERT [dbo].[ThanhVien] ([MaTV], [TenTV], [GioiTinh], [DiaChiTV], [EmailTV], [SdtTV], [MaLoaiTV]) VALUES (1, N'Nguyễn Xuân Việt Anh', N'Nam       ', N'419/7/3 Phạm Ngũ Lão', N'nguyenxuanvietanhdh@gmail.com', N'01644671469', 2)
SET IDENTITY_INSERT [dbo].[ThanhVien] OFF
ALTER TABLE [dbo].[Ban]  WITH CHECK ADD  CONSTRAINT [FK_Ban_LoaiBan] FOREIGN KEY([MaLoaiBan])
REFERENCES [dbo].[LoaiBan] ([MaLoaiBan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ban] CHECK CONSTRAINT [FK_Ban_LoaiBan]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Ban] FOREIGN KEY([MaBan])
REFERENCES [dbo].[Ban] ([MaBan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Ban]
GO
ALTER TABLE [dbo].[CTBill]  WITH CHECK ADD  CONSTRAINT [FK_CTBill_Bill] FOREIGN KEY([MaBill])
REFERENCES [dbo].[Bill] ([MaBill])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTBill] CHECK CONSTRAINT [FK_CTBill_Bill]
GO
ALTER TABLE [dbo].[CTBill]  WITH CHECK ADD  CONSTRAINT [FK_CTBill_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTBill] CHECK CONSTRAINT [FK_CTBill_SanPham]
GO
ALTER TABLE [dbo].[CTBill]  WITH CHECK ADD  CONSTRAINT [FK_CTBill_ThanhVien] FOREIGN KEY([MaTV])
REFERENCES [dbo].[ThanhVien] ([MaTV])
GO
ALTER TABLE [dbo].[CTBill] CHECK CONSTRAINT [FK_CTBill_ThanhVien]
GO
ALTER TABLE [dbo].[CTDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonDatHang_DonDatHang] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTDonDatHang] CHECK CONSTRAINT [FK_CTDonDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[CTDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonDatHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTDonDatHang] CHECK CONSTRAINT [FK_CTDonDatHang_SanPham]
GO
ALTER TABLE [dbo].[CTDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonDatHang_ThanhVien] FOREIGN KEY([MaTV])
REFERENCES [dbo].[ThanhVien] ([MaTV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTDonDatHang] CHECK CONSTRAINT [FK_CTDonDatHang_ThanhVien]
GO
ALTER TABLE [dbo].[CTNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_CTNhapHang_HangNhap] FOREIGN KEY([MaSPNhap])
REFERENCES [dbo].[HangNhap] ([MaSPNhap])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTNhapHang] CHECK CONSTRAINT [FK_CTNhapHang_HangNhap]
GO
ALTER TABLE [dbo].[CTNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_CTNhapHang_NhapHang] FOREIGN KEY([MaNhapHang])
REFERENCES [dbo].[NhapHang] ([MaNhapHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTNhapHang] CHECK CONSTRAINT [FK_CTNhapHang_NhapHang]
GO
ALTER TABLE [dbo].[HangNhap]  WITH CHECK ADD  CONSTRAINT [FK_HangNhap_NhaCungCap] FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCungCap])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangNhap] CHECK CONSTRAINT [FK_HangNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[LoaiSP]  WITH CHECK ADD  CONSTRAINT [FK_LoaiSP_PhanLoaiSP] FOREIGN KEY([MaPhanLoai])
REFERENCES [dbo].[PhanLoaiSP] ([MaPhanLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LoaiSP] CHECK CONSTRAINT [FK_LoaiSP_PhanLoaiSP]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_LoaiNV] FOREIGN KEY([MaLoaiNV])
REFERENCES [dbo].[LoaiNV] ([MaLoaiNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_LoaiNV]
GO
ALTER TABLE [dbo].[NhapHang]  WITH CHECK ADD  CONSTRAINT [FK_NhapHang_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhapHang] CHECK CONSTRAINT [FK_NhapHang_NhanVien]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSP] ([MaLoaiSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD  CONSTRAINT [FK_ThanhVien_LoaiTV] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiTV] ([MaLoaiTV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThanhVien] CHECK CONSTRAINT [FK_ThanhVien_LoaiTV]
GO
/****** Object:  StoredProcedure [dbo].[ban_maloai]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ban_maloai]
@MaLoaiBan int
as
begin
	select * from Ban where MaLoaiBan = @MaLoaiBan
end


GO
/****** Object:  StoredProcedure [dbo].[ctbill_idBill]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ctbill_idBill]
@idBill int
as
begin
	select * from CTBill where MaBill = @idBill
end


GO
/****** Object:  StoredProcedure [dbo].[ctdondathang_id]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ctdondathang_id]
(
@MaCTDDH int
)
as
if(@MaCTDDH is not Null)
begin
	select * from CTDonDatHang where MaCTDDH = @MaCTDDH
end
else
begin
	select * from CTDonDatHang 
end


GO
/****** Object:  StoredProcedure [dbo].[dondathang_id]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[dondathang_id]
(
@MaDDH int
)
as
if(@MaDDH is not Null)
begin
	select * from DonDatHang where MaDDH = @MaDDH
end
else
begin
	select * from DonDatHang 
end


GO
/****** Object:  StoredProcedure [dbo].[getUncheckedID]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getUncheckedID]
@MaBan int
as
begin
	Select * from Bill where MaBan = @MaBan
	and TrangThai = 0
end
GO
/****** Object:  StoredProcedure [dbo].[insertBill]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertBill]
@MaBan int
as
begin
	insert into Bill(ThoiGian, MaBan, TrangThai)
	values ((sysdatetime()), @MaBan, 0)
end


GO
/****** Object:  StoredProcedure [dbo].[insertBillinfo]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertBillinfo]
@MaBill int,
@MaSP int,
@SoLuong int
as
begin
	Declare @isexistBillinfo int
	Declare @productCount int = 1

	Select @isexistBillinfo = MaCTBill, @productCount = SoLuong from CTBill 
	where MaBill = @MaBill and MaSP = @MaSP


	if(@isexistBillinfo > 0)
		begin
			Declare @newCount int = @productCount + @SoLuong
			if(@newCount > 0)
				update CTBill set SoLuong = @productCount + @SoLuong where MaBill = @MaBill and MaSP = @MaSP
			else
				delete CTBill where MaBill = @MaBill and MaSP = @MaSP
		end
	else
		insert into CTBill(MaBill, MaSP, SoLuong)
		values (@MaBill, @MaSP, @SoLuong)
end


GO
/****** Object:  StoredProcedure [dbo].[loaisanpham]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[loaisanpham]
as
begin
	Select * from LoaiSP
end
GO
/****** Object:  StoredProcedure [dbo].[loaisanpham_phanloai]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[loaisanpham_phanloai]
(
@MaPhanLoai int
)
as
begin
	Select * from LoaiSP where MaPhanLoai = @MaPhanLoai
end



GO
/****** Object:  StoredProcedure [dbo].[loaithanhvien_id]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[loaithanhvien_id]
(
@MaLoaiTV int
)
as
if(@MaLoaiTV is not Null)
begin
	select * from LoaiTV where MaLoaiTV = @MaLoaiTV
end
else
begin
	select * from LoaiTV 
end


GO
/****** Object:  StoredProcedure [dbo].[Login_NV]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Login_NV]
@userName nvarchar(50),
@passWord nvarchar(50)
as
begin
	Select * from NhanVien where TaiKhoan = @userName and MatKhau = @passWord
end


GO
/****** Object:  StoredProcedure [dbo].[maloaisp_ten]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[maloaisp_ten]
(
@TenLoaiSP nvarchar(50)
)
as
if(@TenLoaiSP is not Null)
begin
	select * from LoaiSP where TenLoaiSP = @TenLoaiSP
end
else
begin
	select * from LoaiSP 
end


GO
/****** Object:  StoredProcedure [dbo].[MenuShowBill]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MenuShowBill]
@Maban int
as 
begin
	Select SanPham.TenSP, CTBill.SoLuong, SanPham.Gia, CTBill.SoLuong * SanPham.Gia as N'ThanhTien' 
	from Bill, CTBill, SanPham 
	where CTBill.MaBill = Bill.MaBill 
	and CTBill.MaSP = SanPham.MaSP 
	and Bill.TrangThai = 0 
	and Bill.MaBan = @Maban
end
GO
/****** Object:  StoredProcedure [dbo].[sanpham_id]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sanpham_id]
(
@MaSP int
)
as
if(@MaSP is not Null)
begin
	select * from SanPham where MaSP = @MaSP
end
else
begin
	select * from SanPham 
end


GO
/****** Object:  StoredProcedure [dbo].[sanpham_maloaisp]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sanpham_maloaisp]
(
@MaLoaiSP int
)
as
if(@MaLoaiSP is not Null)
begin
	select * from SanPham where MaLoaiSP = @MaLoaiSP
end
else
begin
	select * from SanPham 
end


GO
/****** Object:  StoredProcedure [dbo].[SanPham_PhanLoai]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SanPham_PhanLoai]
@MaPhanLoai int
as
begin
	Select MaSP as N'Mã SP', TenSP as N'Tên SP', Gia as N'Giá', TenLoaiSP as N'Loại SP'
	from SanPham,LoaiSP,PhanLoaiSP
	where SanPham.MaLoaiSP = LoaiSP.MaLoaiSP
	and LoaiSP.MaPhanLoai = PhanLoaiSP.MaPhanLoai
	and PhanLoaiSP.MaPhanLoai = @MaPhanLoai
end
GO
/****** Object:  StoredProcedure [dbo].[sanpham_ten]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sanpham_ten]
(
@TenSP nvarchar(50)
)
as
if(@TenSP is not Null)
begin
	select * from SanPham where TenSP = @TenSP
end
else
begin
	select * from SanPham 
end


GO
/****** Object:  StoredProcedure [dbo].[search_drinks]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[search_drinks]
@TenSP nvarchar(50)
as
begin
	Select MaSP as N'Mã SP', TenSP as N'Tên SP', Gia as N'Giá', TenLoaiSP as N'Loại SP', TenPhanLoai as N'Phân Loại' 
	from SanPham,LoaiSP,PhanLoaiSP
	where SanPham.MaLoaiSP = LoaiSP.MaLoaiSP
	and LoaiSP.MaPhanLoai = PhanLoaiSP.MaPhanLoai
	and PhanLoaiSP.MaPhanLoai = 2
	and SanPham.TenSP like N'%' + @TenSP + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[search_foods]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[search_foods]
@TenSP nvarchar(50)
as
begin
	Select MaSP as N'Mã SP', TenSP as N'Tên SP', Gia as N'Giá', TenLoaiSP as N'Loại SP', TenPhanLoai as N'Phân Loại' 
	from SanPham,LoaiSP,PhanLoaiSP
	where SanPham.MaLoaiSP = LoaiSP.MaLoaiSP
	and LoaiSP.MaPhanLoai = PhanLoaiSP.MaPhanLoai
	and PhanLoaiSP.MaPhanLoai = 1
	and SanPham.TenSP like N'%' + @TenSP + '%'
end

GO
/****** Object:  StoredProcedure [dbo].[showBillInfo_IdTable]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[showBillInfo_IdTable]
@Maban int
as
begin
	Select SanPham.TenSP, CTBill.SoLuong, SanPham.Gia, CTBill.SoLuong * SanPham.Gia as N'Thanh Tien'
	from Bill, CTBill, SanPham 
	where CTBill.MaBill = Bill.MaBill and CTBill.MaSP = SanPham.MaSP and Bill.TrangThai = 0 and Bill.MaBan = @Maban
end


GO
/****** Object:  StoredProcedure [dbo].[tatcasanpham]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[tatcasanpham]
as
begin
	select * from SanPham
end


GO
/****** Object:  StoredProcedure [dbo].[thanhtoan]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[thanhtoan]
@MaBill int
as 
begin
	update Bill set TrangThai = 1 where MaBill = @MaBill
end
GO
/****** Object:  StoredProcedure [dbo].[thanhvien_id]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[thanhvien_id]
(
@MaTV int
)
as
if(@MaTV is not Null)
begin
	select * from ThanhVien where MaTV = @MaTV
end
else
begin
	select * from ThanhVien 
end


GO
/****** Object:  StoredProcedure [dbo].[thongke_id]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[thongke_id]
@MaBill int
as
begin
	SELECT DISTINCT  Bill.MaBill as N'Mã Bill' ,Bill.ThoiGian as N'Thời gian',
	Bill.MaBan as N'Mã Bàn',
	CTBill.MaSP as N'Mã SP', SanPham.TenSP as N'Tên SP', CTBill.SoLuong as N'Số Lượng', 
	SanPham.Gia as N'Giá', CTBill.SoLuong * SanPham.Gia as N'Thành Tiền'
	FROM Bill, CTBill, SanPham
	WHERE CTBill.MaBill = Bill.MaBill and CTBill.MaSP = SanPham.MaSP and
	Bill.MaBill = 23
end
GO
/****** Object:  StoredProcedure [dbo].[thongke_nam]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[thongke_nam]
@Nam int
as
begin
	SELECT Bill.MaBill as N'Mã Bill' ,Bill.ThoiGian as N'Thời gian',
	Bill.MaBan as N'Mã Bàn',
	CTBill.MaSP as N'Mã SP', SanPham.TenSP as N'Tên SP', CTBill.SoLuong as N'Số Lượng', 
	SanPham.Gia as N'Giá', CTBill.SoLuong * SanPham.Gia as N'Thành Tiền'
	FROM Bill, CTBill, SanPham
	WHERE CTBill.MaSP = SanPham.MaSP 
	and CTBill.MaBill = Bill.MaBill 
	and YEAR(ThoiGian)= @Nam 
end
GO
/****** Object:  StoredProcedure [dbo].[thongke_ngay]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[thongke_ngay]
@Thoigian datetime
as
begin
	SELECT Bill.MaBill as N'Mã Bill' , Bill.ThoiGian as N'Thời gian',
	Bill.MaBan as N'Mã Bàn',
	CTBill.MaSP as N'Mã SP', SanPham.TenSP as N'Tên SP', CTBill.SoLuong as N'Số Lượng', 
	SanPham.Gia as N'Giá', CTBill.SoLuong * SanPham.Gia as N'Thành Tiền'
	FROM Bill, CTBill, SanPham
	WHERE CTBill.MaSP = SanPham.MaSP 
	and CTBill.MaBill = Bill.MaBill 
	and Bill.ThoiGian
	BETWEEN @Thoigian + ' 00:00:00.000' AND @Thoigian + ' 23:59:00.000'
end
GO
/****** Object:  StoredProcedure [dbo].[thongke_thang]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[thongke_thang] 
@Thang int, @Nam int
as
begin
	SELECT Bill.MaBill as N'Mã Bill' ,Bill.ThoiGian as N'Thời gian',
	Bill.MaBan as N'Mã Bàn',
	CTBill.MaSP as N'Mã SP', SanPham.TenSP as N'Tên SP', CTBill.SoLuong as N'Số Lượng', 
	SanPham.Gia as N'Giá', CTBill.SoLuong * SanPham.Gia as N'Thành Tiền'
	FROM Bill, CTBill, SanPham
	WHERE CTBill.MaSP = SanPham.MaSP 
	and CTBill.MaBill = Bill.MaBill 
	and YEAR(ThoiGian)= @Nam AND MONTH(ThoiGian)=@Thang
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 11/23/2017 8:55:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[USP_InsertBillInfo]
@MaBill int, @MaSP int, @SoLuong int
AS
BEGIN
 DECLARE @isExitBillInfo int
 DECLARE @foodCount int = 1
 SELECT @isExitBillInfo = MaCTBIll, @foodCount = SoLuong FROM CTBill 
 WHERE MaBill = @MaBill AND MaSP = @MaSP
 if(@isExitBillInfo > 0)
 BEGIN
  DECLARE @newCount int = @foodcount + @SoLuong
  if(@newCount > 0)
  BEGIN
   UPDATE CTBill SET SoLuong = @newCount Where MaCTBill = @isExitBillInfo

  END
  else
  BEGIN
   DELETE CTBill Where MaCTBill = @isExitBillInfo
  END
 END
 else
 BEGIN
  if(@SoLuong <= 0)
   BEGIN
   return 1;
   END
  else
   BEGIN
		insert into CTBill(MaBill, MaSP, SoLuong)
		values (@MaBill, @MaSP, @SoLuong)
   END
 END
END


GO
USE [master]
GO
ALTER DATABASE [QLQuanCafe] SET  READ_WRITE 
GO
