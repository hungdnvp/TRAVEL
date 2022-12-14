USE [master]
GO
/****** Object:  Database [TravelVietNam]    Script Date: 11/5/2022 4:10:42 PM ******/
CREATE DATABASE [TravelVietNam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TravelVietNam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TravelVietNam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TravelVietNam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TravelVietNam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TravelVietNam] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TravelVietNam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TravelVietNam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TravelVietNam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TravelVietNam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TravelVietNam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TravelVietNam] SET ARITHABORT OFF 
GO
ALTER DATABASE [TravelVietNam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TravelVietNam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TravelVietNam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TravelVietNam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TravelVietNam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TravelVietNam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TravelVietNam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TravelVietNam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TravelVietNam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TravelVietNam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TravelVietNam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TravelVietNam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TravelVietNam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TravelVietNam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TravelVietNam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TravelVietNam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TravelVietNam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TravelVietNam] SET RECOVERY FULL 
GO
ALTER DATABASE [TravelVietNam] SET  MULTI_USER 
GO
ALTER DATABASE [TravelVietNam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TravelVietNam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TravelVietNam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TravelVietNam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TravelVietNam] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TravelVietNam] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TravelVietNam] SET QUERY_STORE = OFF
GO
USE [TravelVietNam]
GO
/****** Object:  Table [dbo].[BangGia]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangGia](
	[MaBangGia] [int] IDENTITY(1,1) NOT NULL,
	[GiaVN_EmBe] [int] NULL,
	[GiaVN_TreEm] [int] NULL,
	[GiaVN_NguoiLon] [int] NULL,
	[GiaVK_EmBe] [int] NULL,
	[GiaVK_TreEm] [int] NULL,
	[GiaVK_NguoiLon] [int] NULL,
	[GiaNQ_EmBe] [int] NULL,
	[GiaNQ_TreEm] [int] NULL,
	[GiaNQ_NguoiLon] [int] NULL,
	[MaTour] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBangGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Blog_ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[NoiDung] [ntext] NULL,
	[Link_Img] [nvarchar](100) NULL,
	[MaTaiKhoan] [int] NULL,
	[TacGia] [nvarchar](50) NULL,
	[MoTa] [text] NULL,
	[NgayDang] [date] NULL,
	[Tag] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[Link_CoverImg] [nvarchar](50) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Blog_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietNgay]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietNgay](
	[MaNgay] [int] NOT NULL,
	[NoiDung] [nvarchar](2000) NULL,
	[MaChiTietTour] [int] NOT NULL,
	[GioHoatDong] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNgay] ASC,
	[GioHoatDong] ASC,
	[MaChiTietTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietTK]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietTK](
	[MaChiTietTK] [int] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [varchar](12) NULL,
	[MaTaiKhoan] [int] NULL,
	[LinkAvatar] [varchar](100) NULL,
 CONSTRAINT [PK__KhachHan__2725CF1EB732EBA4] PRIMARY KEY CLUSTERED 
(
	[MaChiTietTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietTour]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietTour](
	[MaChiTietTour] [int] IDENTITY(1,1) NOT NULL,
	[MoTaTour] [nvarchar](1000) NULL,
	[PlaceVisit] [nvarchar](500) NULL,
 CONSTRAINT [PK__ChiTietT__FDC1E624EBA2D74C] PRIMARY KEY CLUSTERED 
(
	[MaChiTietTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[MaChiTietTK] [int] NOT NULL,
	[MaTour] [int] NOT NULL,
	[NumStar] [int] NULL,
	[Review] [nvarchar](2000) NULL,
	[ThoiGian] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietTK] ASC,
	[MaTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaDanh]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaDanh](
	[MaDiaDanh] [int] IDENTITY(1,1) NOT NULL,
	[TenDiaDanh] [nvarchar](100) NULL,
	[Img] [varchar](100) NULL,
	[MoTa] [varchar](1000) NULL,
	[MaVung] [int] NULL,
	[DanToc] [nvarchar](50) NULL,
	[Dientich] [nvarchar](50) NULL,
	[Danso] [nchar](10) NULL,
	[DacSan] [nvarchar](100) NULL,
	[ThanhPho] [nvarchar](100) NULL,
 CONSTRAINT [PK__DiaDanh__F1C0788366640F2E] PRIMARY KEY CLUSTERED 
(
	[MaDiaDanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaDichVu] [int] IDENTITY(1,1) NOT NULL,
	[TenDichVu] [nvarchar](500) NULL,
	[MoTa] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVu_Tour]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu_Tour](
	[MaDichVu] [int] NOT NULL,
	[MaTour] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC,
	[MaTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LinkImg]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkImg](
	[MaLink] [varchar](10) NOT NULL,
	[LinkImg] [varchar](100) NULL,
	[MaChiTietTour] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLink] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ngay]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ngay](
	[MaNgay] [int] NOT NULL,
	[TieuDe] [nvarchar](1000) NULL,
	[MaChiTietTour] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNgay] ASC,
	[MaChiTietTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[MaPhanHoi] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](1000) NULL,
	[TraLoi] [nvarchar](1000) NULL,
	[MaChiTietTK] [int] NULL,
 CONSTRAINT [PK__PhanHoi__3458D20FAF4641E8] PRIMARY KEY CLUSTERED 
(
	[MaPhanHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDatTour]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDatTour](
	[MaPhieuDat] [int] IDENTITY(1,1) NOT NULL,
	[MaChiTietTK] [int] NULL,
	[MaTour] [int] NULL,
 CONSTRAINT [PK__PhieuDat__01EA0D2BA59411E0] PRIMARY KEY CLUSTERED 
(
	[MaPhieuDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](10) NULL,
	[pass] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[role] [nchar](10) NULL,
 CONSTRAINT [PK__ThanhVie__2BE0A0F0AC331AAE] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[MaTour] [int] IDENTITY(1,1) NOT NULL,
	[TenTour] [nvarchar](100) NULL,
	[Mota] [nvarchar](100) NULL,
	[Gia] [decimal](18, 0) NULL,
	[MaChiTietTour] [int] NULL,
	[NumView] [int] NULL,
	[LinkImage] [varchar](100) NULL,
	[DiaDiem] [nvarchar](100) NULL,
	[NumDay] [int] NULL,
	[LinkVideo] [varchar](200) NULL,
	[lat] [varchar](20) NULL,
	[lng] [varchar](20) NULL,
 CONSTRAINT [PK__Tour__4E5557DE73594F2C] PRIMARY KEY CLUSTERED 
(
	[MaTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour_DiaDanh]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour_DiaDanh](
	[MaTour] [int] NOT NULL,
	[MaDiaDanh] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTour] ASC,
	[MaDiaDanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour_TravelType]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour_TravelType](
	[MaTour] [int] NOT NULL,
	[MaTravelType] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTour] ASC,
	[MaTravelType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TravelType]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TravelType](
	[MaTravelType] [int] IDENTITY(1,1) NOT NULL,
	[TravelTypeName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTravelType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vung]    Script Date: 11/5/2022 4:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vung](
	[MaVung] [int] IDENTITY(1,1) NOT NULL,
	[TenVung] [nvarchar](100) NULL,
 CONSTRAINT [PK__Vung__BF118FFB2129711B] PRIMARY KEY CLUSTERED 
(
	[MaVung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BangGia] ON 

INSERT [dbo].[BangGia] ([MaBangGia], [GiaVN_EmBe], [GiaVN_TreEm], [GiaVN_NguoiLon], [GiaVK_EmBe], [GiaVK_TreEm], [GiaVK_NguoiLon], [GiaNQ_EmBe], [GiaNQ_TreEm], [GiaNQ_NguoiLon], [MaTour]) VALUES (1, 150000, 600000, 15000000, 15, 60, 150, 15, 60, 150, 1)
INSERT [dbo].[BangGia] ([MaBangGia], [GiaVN_EmBe], [GiaVN_TreEm], [GiaVN_NguoiLon], [GiaVK_EmBe], [GiaVK_TreEm], [GiaVK_NguoiLon], [GiaNQ_EmBe], [GiaNQ_TreEm], [GiaNQ_NguoiLon], [MaTour]) VALUES (2, 50, 500, 5000, 20, 38, 420, 100, 160, 270, 2)
SET IDENTITY_INSERT [dbo].[BangGia] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (1, N'Traffic and Roads in Vietnam', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', N'img-1.jpg', 1, N'NorManDic', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2019-07-28' AS Date), N'Theme;Events', N'News', N'img-1.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (2, N'How you can support Responsible Tourism in Vietnam ', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', N'img-1.jpg', 1, N'DaisyGreen', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2018-04-09' AS Date), N'News', N'Blog', N'img-2.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (3, N'Highlights of Vietnam', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', N'img-2.jpg', 2, N'KhongThao', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2021-08-28' AS Date), N'Tips', N'Travel & Tour', N'img-3.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (4, N'Destinations in Vietnam', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 2, N'LinhPhuong', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2021-07-09' AS Date), N'City Guide', N'Tips', N'img-3.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (5, N'Travel Experience in Hanoi', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 3, N'N33r9', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2022-03-09' AS Date), N'Countryside', N'News', N'img-2.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (6, N'5 Places you must visit in Da Nang city', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 2, N'N33r9', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2022-07-09' AS Date), N'Outdoor', N'Blog', N'img-3.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (7, N'Saigon  (Ho Chi Minh)', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 1, N'Adam', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2021-01-22' AS Date), N'Ideas', N'Tips', N'img-1.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (8, N'7 Places to visit this winter', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 3, N'Amdin', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2021-02-22' AS Date), N'Theme', N'Travel & Tours ', N'img-1.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (9, N'14 Best Tour Place in World', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 4, N'Thanh Phong', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2021-11-22' AS Date), N'Events', N'News', N'img-2.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (10, N'Budget trips for winter break', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 3, N'Hai Nam', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2021-02-22' AS Date), N'Theme', N'News', N'img-2.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (11, N'Budget trips for winter break', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 1, N'Thanh Tu ', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2019-08-05' AS Date), N'Events', N'Blog', N'img-2.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (12, N'14 Best Tour Place in World', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 2, N'Quang Hung', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2019-09-05' AS Date), N'Tips', N'Tips', N'img-2.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (13, N'5 Places you must visit in Da Nang city', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 3, N'Van Nam', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2020-09-10' AS Date), N'News', N'Travel & Tours', N'img-1.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (14, N'Travel Experience in Hanoi', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 4, N'Armoni', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2021-11-03' AS Date), N'Ha Noi', N'Tips ', N'img-3.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (15, N'How you can support Responsible Tourism in Vietnam ', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 4, N'Daisy', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2020-10-10' AS Date), N'Vietnam', N'News', N'img-1.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (16, N'How you can support Responsible Tourism in Vietnam ', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 3, N'John Smith', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2022-09-15' AS Date), N'Travel ', N'Blog ', N'img-3.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (17, N'Five ways you can support Responsible Tourism in Madhya Pradesh ', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 2, N'David', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2019-09-28' AS Date), N'Experience', N'News', N'img-2.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (18, N'14 Best Tour Place in World', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 1, N'Alena', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2019-08-01' AS Date), N'Experience', N'News', N'img-1.jpg')
INSERT [dbo].[Blog] ([Blog_ID], [Ten], [NoiDung], [Link_Img], [MaTaiKhoan], [TacGia], [MoTa], [NgayDang], [Tag], [Category], [Link_CoverImg]) VALUES (19, N'Five ways you can support Responsible Tourism in Ho Chi Minh City', N'<p>Vietnam is one of our favourite countries, packed with history, stunning landscapes, cultural highlights, and amazing food. It’s one of the most exciting destinations in South East Asia. We visited back in 1999 for the first time ever and we go back regularly to create this Vietnam Travel Blog section for you. We’ve had the luxury of time and long visas to really get to know Vietnam. Our aim is to help you plan your trip to Vietnam using this travel guide.</p>
<P>In this post we’ll look at places to go in Vietnam, itinerary ideas, where to stay and how to travel in Vietnam. Links here will take you to more detailed posts.

	We hope you find our Vietnam tips and guides useful in planning your travel, vacation, or holiday in Vietnam. This guide is suitable for first-timers in Vietnam or return visitors looking for different parts of the country to explore.</p>
<br>
<blockquote class="blockquote">
	<h2>Vietnam Travel Blog</h2> 
	<p>Let’s start with the one most important point I want to make about travel in Vietnam. The first point below. We’ve had nothing but wonderful experiences with the people of Vietnam and other travel bloggers saying nasty things about the Vietnamese upsets us.
		</p>
	<footer>
		Khong Phuong Thao
		<cite>
			Book: One day in the S-shaped country!
		</cite>
	</footer>
</blockquote>
<p></p>
<p>With emerald-green waters, limestone islands and mystical caves, all while touring on Junk Boats, Ha Long Bay draws travellers to her every day. It is certainly one of our favourites in South East Asia.</p>
<br>
', NULL, 3, N'Daisy', N'A lot of people think travel is just expensive, but in reality, there are incredible deals happening all the time. They usually don’t last too long, and you have to act quickly. ', CAST(N'2022-09-15' AS Date), N'Events', N'Tips ', N'img-1.jpg')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (1, N'nghỉ trưa ....va', 1, N'14:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (1, N'Qua qua qua qua', 5, N'15:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (1, N'Qua Sông Mê Công .........', 5, N'21:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (1, N'nghỉ trưa ....va', 2, N'5:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (1, N'chuẩn bị khởi hành tại địa điểm.........some des...@@', 1, N'6:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (1, N'đọc báo nghe tin xem thời sự', 4, N'8:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (1, N'Qua Sông Mê Công .........', 1, N'9:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (1, N'đi bộ đi chơi....', 3, N'9:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (2, N'sinh hoạt tài chính công khai', 3, N'10:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (2, N'ngủ ngủ ngủ và ngủ', 1, N'12:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (2, N'chơi thể thao ', 1, N'16:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (2, N'ngủ ngủ ngủ và ngủ', 5, N'17:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (2, N'đi bộ đi chơi....', 1, N'8:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (2, N'sinh hoạt tài chính công khai', 2, N'8:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (3, N'đọc báo nghe tin xem thời sự', 1, N'19:00')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (3, N'báo thức tập thể dục', 1, N'5:30')
INSERT [dbo].[ChiTietNgay] ([MaNgay], [NoiDung], [MaChiTietTour], [GioHoatDong]) VALUES (4, N'sinh hoạt tài chính công khai', 1, N'7:00')
GO
SET IDENTITY_INSERT [dbo].[ChiTietTK] ON 

INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (1, N'Khổng Phương Thảo', NULL, NULL, NULL, N'img/avatar/avatar-2.jpg')
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (2, N'Phạm Trọng Linh', NULL, NULL, NULL, N'img/avatar/avatar-5.jpg')
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (3, N'An Thanh Tú', NULL, NULL, NULL, N'img/avatar/Tu.jpg')
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (4, N'Hoàng Linh Phương', NULL, NULL, NULL, N'img/avatar/avatar-2.jpg')
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (5, N'Đỗ Quang Hùng', NULL, NULL, NULL, NULL)
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (6, N'Hoàng Thành Hùng', NULL, NULL, NULL, NULL)
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (7, N'Nguyễn Tùng Lâm', NULL, NULL, NULL, NULL)
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (8, N'Nguyễn KHánh Tùng', NULL, NULL, NULL, NULL)
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (9, N'Trần Văn Tùng', NULL, NULL, NULL, NULL)
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (10, N'Phạm Văn Trọng', NULL, NULL, NULL, NULL)
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (11, N'Phạm Trọng An', NULL, NULL, NULL, NULL)
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (12, N'Đinh Trọng Linh', NULL, NULL, NULL, NULL)
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (13, N'Nguyễn Văn Hà', NULL, NULL, NULL, NULL)
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (14, N'Phạm Thị Anh', NULL, NULL, NULL, NULL)
INSERT [dbo].[ChiTietTK] ([MaChiTietTK], [Hoten], [DiaChi], [SDT], [MaTaiKhoan], [LinkAvatar]) VALUES (15, N'Phạm Quốc Hoàng', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietTK] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietTour] ON 

INSERT [dbo].[ChiTietTour] ([MaChiTietTour], [MoTaTour], [PlaceVisit]) VALUES (1, N'Ha Giang is a large area, you need to spend a few days here to get the best out of it. If you are in for an adventure, we recommend a private motorbike tour or rent a motorbike with a driver. For those travellers who prefer more comfort but don’t want to miss the spectacular views, we arrange tours by private car and driver. We can also arrange treks for you if you decide to travel Ha Giang on your own. Of course, your private guide will accompany you along the way!', N'Some Place')
INSERT [dbo].[ChiTietTour] ([MaChiTietTour], [MoTaTour], [PlaceVisit]) VALUES (2, N'Book your personalized tour with us and get to know the beautiful scenery and culture of the Ha Giang Province. On this 2 day tour you will visit various small towns, along a breathtaking route through Ha Giang.You have the option to sleep in a homestay or in a hotel. We provide friendly English speaking guides, who will tell you more about the area along the way. There will be plenty of stops to take beautiful photos. It is possible to do the tour by motorbike or car, whichever you prefer.', N'Some Place')
INSERT [dbo].[ChiTietTour] ([MaChiTietTour], [MoTaTour], [PlaceVisit]) VALUES (3, N'The remote areas of Ha Giang offer travelling experiences like no other, the cultural diversity and uniquely beautiful landscapes remain pure and unspoilt by modern day trappings. This tour gives you the chance to take in the highlights of this remarkable region, making the most of your time by staying with local families to maximise your cultural discovery', N'Some Place')
INSERT [dbo].[ChiTietTour] ([MaChiTietTour], [MoTaTour], [PlaceVisit]) VALUES (4, N'If you are looking to visit the northeastern region of Vietnam, then consider a trip to Ha Giang, where the stunning terraced rice fields, the majestic mountains, and the local bustling fairs are plenty. You will be in awe of how breathtaking nature can be at Quan Ba Twin Mountain and Dong Van Karst Plateau Geopark.The adventure then will take you next to Ma Pi Leng Pass, one of the four greatest passes in northern Vietnam. Conquering this pass is a one-of-a-kind experience that you will not forget! If you wonder why Ha Giang is a must-visit in Vietnam, then join this tour and find out yourself!', N'Some Place')
INSERT [dbo].[ChiTietTour] ([MaChiTietTour], [MoTaTour], [PlaceVisit]) VALUES (5, N'The Ma Pi Leng Pass is Vietnam’s final frontier and is dubbed the Great Wall of Viet Nam, situated between Dong Van and Meo Vac. An area of outstanding nature beauty and geological significant. the 20km long wingding road of happiness has many sharp turn 2000m high mountain and incredible view. Standing on Ma Pi Leng’s top point and outstretch your arms, you will seem like you are flying into the skies. Indeed, the harmonious beauty of ground, sky, and mountainous scenes may steal the heart of any tourists', N'Some Place')
INSERT [dbo].[ChiTietTour] ([MaChiTietTour], [MoTaTour], [PlaceVisit]) VALUES (6, N'Unique 3 days 2 nights tours to Ha Long Bay with First travel is the best choice for you. Our classic itinerary with a perfect combination suite for all of traveler we will not only bring you the most top attraction in Bai Tu Long such as: Cap la. Tra San, Cong Dam, Thien Canh Son cave and Vung Vieng floating village but also take you deep into natural wonderful with various amazing activities. Let’s come to First Travel to make your trip more experience ', N'Some Place')
INSERT [dbo].[ChiTietTour] ([MaChiTietTour], [MoTaTour], [PlaceVisit]) VALUES (7, N'Halong Bay, the magnificent World Heritage listed destination, with its thousand islands rising from the emerald waters of the Gulf of Tonkin. Ha Long Bay is an excellent example of a Karst landscape created by a complex chain reaction over millions of years of geological movement. Let us take you back in time on a fascinating relaxing journey through the Red River Delta to the World Heritage Site of Halong Bay', N'Some Place')
INSERT [dbo].[ChiTietTour] ([MaChiTietTour], [MoTaTour], [PlaceVisit]) VALUES (8, N'Ha Long Bay 1 Day trip is best idea for your, if you have don’t’ much time to travel. This full day trip is a perfect way to spending as much time  to enjoy  this wondrous beauty. The First travel  will bring to you the best time and sure that this is one unforgettable day', N'Some Place')
INSERT [dbo].[ChiTietTour] ([MaChiTietTour], [MoTaTour], [PlaceVisit]) VALUES (9, N'3 days 2 nights Oasis Classic Cruise and Ninh Binh is the best idea for your traveling in Vietnam. The First travel but only give you have a chance to discover wonderful landscape Ha Long Bay – one of the Word Heritage and Ninh Binh – the old capital, but also know more about of cultural and history of Vietnam. Let’s coming with us to make your trip more best experience', N'Some Place')
INSERT [dbo].[ChiTietTour] ([MaChiTietTour], [MoTaTour], [PlaceVisit]) VALUES (10, N'On this trip you will trek through Muong Hoa valley surrounded by huge rice terraces. You will have chance to know about how the local grow and harvest rice in this kind of topographic. Moreover, Bac Ha fair still retains its pristine character and cultural identity of the Northwest highlanders as an interesting experience for visitors.', N'Some Place')
INSERT [dbo].[ChiTietTour] ([MaChiTietTour], [MoTaTour], [PlaceVisit]) VALUES (11, N'Fansipan is the highest mountain in Vietnam, also the highest among the three Indochina countries, so it was dubbed the " Roof of Indochina " in the Hoang Lien Son mountain range, about 9 km southwest of Sapa town. On this trip you will conquer this mount with the heigh of 3147m to experience the “above the cloud” feeling.', N'Some Place')
INSERT [dbo].[ChiTietTour] ([MaChiTietTour], [MoTaTour], [PlaceVisit]) VALUES (12, N'Rushed of time but desired for a unique feeling of the peaceful rumors of Mai Chau and Moc Chau Land but that could be packed in 03 Day Valley Retreat.', N'Some Place')
SET IDENTITY_INSERT [dbo].[ChiTietTour] OFF
GO
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (1, 1, 3, N'tour chất lượng vcl', N'8:42 PM 1/28/2022')
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (1, 3, 2, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (1, 4, 5, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (1, 5, 4, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (1, 6, 3, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (1, 7, 4, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (2, 1, 4, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (2, 2, 3, N'tour chất lượng vcl', N'8:42 PM 1/28/2022')
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (2, 4, 2, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (2, 5, 5, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (2, 7, 3, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (2, 8, 4, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (3, 1, 4, N'tour như cc', N'6:42 PM 9/21/2022')
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (3, 2, 4, N'tour như cc', N'8:42 PM 1/28/2022')
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (3, 3, 3, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (3, 5, 2, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (3, 6, 5, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (3, 7, 3, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (4, 1, 5, N'tour bình thường', N'8:42 PM 1/28/2022')
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (4, 2, 4, N'tour bình thường', N'8:42 PM 1/28/2022')
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (4, 3, 4, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (4, 4, 3, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (4, 6, 2, NULL, NULL)
INSERT [dbo].[DanhGia] ([MaChiTietTK], [MaTour], [NumStar], [Review], [ThoiGian]) VALUES (4, 8, 3, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[DiaDanh] ON 

INSERT [dbo].[DiaDanh] ([MaDiaDanh], [TenDiaDanh], [Img], [MoTa], [MaVung], [DanToc], [Dientich], [Danso], [DacSan], [ThanhPho]) VALUES (1, N'Phu Quoc', N'Des_Phuquoc.jpg', N'Phu Quoc is the largest island in Vietnam. Phu Quoc and nearby islands, along with the distant Tho Chu Islands, are part of Kien Giang Province as Phu Quoc District, the island has a total area of 574 square kilometres and a permanent population of approximately 103,000.Located in the Gulf of Thailand, the district of Phu Quoc includes the island proper and 21 smaller islets. Duong Dong town is located on the west coast, and is also the administrative and largest town on the island.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DiaDanh] ([MaDiaDanh], [TenDiaDanh], [Img], [MoTa], [MaVung], [DanToc], [Dientich], [Danso], [DacSan], [ThanhPho]) VALUES (2, N'Sa Pa', N'Des_Sapa.jpg', N'Sapa is a district-level town of Lao Cai Province in the Northwest region of Vietnam. As of 2018, the town had a population of 61,498.The town covers an area of 677 km². The town capital lies at Sa Pa.It is one of the main market towns in the area, where several ethnic minority groups such as Hmong, Dao (Yao), Xa Pho, and Tay live.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DiaDanh] ([MaDiaDanh], [TenDiaDanh], [Img], [MoTa], [MaVung], [DanToc], [Dientich], [Danso], [DacSan], [ThanhPho]) VALUES (3, N'Moc Chau', N'Des_Mocchau.jpg', N'Moc Chau is a rural district of Son La Province in the Northwest region of Vietnam.The district capital lies at Moc Chau.Moc Chau is popular with Vietnamese and international tourists for its hill tribes such as White & Black Thai People and Muong People, the green tea hills, Moc Chau milk, the natural landscape of Dai Yem waterfalls, Hill Pine and Orchid Garden flowers. It takes five hours driving, with a distance of 200 kilometres from Hanoi to Moc Chau.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DiaDanh] ([MaDiaDanh], [TenDiaDanh], [Img], [MoTa], [MaVung], [DanToc], [Dientich], [Danso], [DacSan], [ThanhPho]) VALUES (4, N'Ha Giang', N'Des_Hagiang.jpg', N'Ha Giang is a province in the Northeast region of Vietnam.It is located in the far north of the country, and contains Vietnam northernmost point. It shares a 270 km long border with Yunnan province of southern China, and thus is known as Vietnam final frontier. The province covers an area of 7,945.8 square kilometres and as of 2008 it had a population of 705,100 people.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DiaDanh] ([MaDiaDanh], [TenDiaDanh], [Img], [MoTa], [MaVung], [DanToc], [Dientich], [Danso], [DacSan], [ThanhPho]) VALUES (5, N'Ha Long', N'Des_Halong.jpg', N'Ha Long is the capital city and 1st-class provincial city of Quang Ninh Province, Vietnam. The name Ha Long means "descending dragon". The city was created in 1993, when the old capital, Hon Gai, was merged with Bai Chay – the main tourist area. The city mainly lies on Ha Long Bay. It is located at about 178 km (111 mi) east of Hanoi. The population in 2013 was 227,000', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DiaDanh] ([MaDiaDanh], [TenDiaDanh], [Img], [MoTa], [MaVung], [DanToc], [Dientich], [Danso], [DacSan], [ThanhPho]) VALUES (6, N'Cat Ba', N'Des_Catba.jpg', N'Cat Ba Island is the largest of the 367 islands spanning 260 km2 (100 sq mi) that comprise the Cat Ba Archipelago, which makes up the southeastern edge of Lan Ha Bay in Northern Vietnam. Cat Ba island has a surface area of 285 km2 (110 sq mi) and maintains the dramatic and rugged features of Ha Long Bay.', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DiaDanh] ([MaDiaDanh], [TenDiaDanh], [Img], [MoTa], [MaVung], [DanToc], [Dientich], [Danso], [DacSan], [ThanhPho]) VALUES (7, N'Phong Nha Ke Bang', N'Des_PNKB.jpg', N'Phong Nha-Ke Bang is a national park and UNESCO World Heritage Site in the B? Tr?ch and Minh Hóa districts of central Quang Binh Province in the North Central Coast region of Vietnam, about 500 km south of Hanoi. The park borders the Hin Namno Nature Reserve in Khammouane Province, Laos to the west and 42 km east of the South China Sea from its borderline point. Phong Nha–Ke Bang National Park is situated in a limestone zone of 2,000 km2 in Vietnamese territory and borders another limestone zone of 2,000 km2 of Hin Namno in Laotian territory. The core zone of this national park covers 857.54 km2 and a buffer zone of 1,954 km', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DiaDanh] ([MaDiaDanh], [TenDiaDanh], [Img], [MoTa], [MaVung], [DanToc], [Dientich], [Danso], [DacSan], [ThanhPho]) VALUES (8, N'Thua Thien Hue', N'Des_Hue.jpg', N'Thua Thien Hue is a province in the North Central Coast region of Vietnam, approximately in the centre of the country. It borders Quang Tri Province to the north and Da Nang to the south, Laos to the west and the East Sea to the east. The province has 128 km of coastline, 22,000 ha of lagoons and over 200,000 ha of forest. There is an extensive complex of imperial tombs and temples in Hue.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DiaDanh] ([MaDiaDanh], [TenDiaDanh], [Img], [MoTa], [MaVung], [DanToc], [Dientich], [Danso], [DacSan], [ThanhPho]) VALUES (9, N'Da Nang', N'Des_Danang.jpg', N'Da Nang is the commercial and educational centre of Central Vietnam and is the largest city in the region. It has a well-sheltered, easily accessible port, and its location on National Route 1A and the North–South Railway makes it a transport hub. It is within 100 km (62 mi) of several UNESCO World Heritage Sites, including the Imperial City of Hue, the Old Town of Hoi An, and the My Son ruins. The city was known as Cua Han during early Dai Viet settlement, and as Tourane (or Turon) during French colonial rule.', 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DiaDanh] ([MaDiaDanh], [TenDiaDanh], [Img], [MoTa], [MaVung], [DanToc], [Dientich], [Danso], [DacSan], [ThanhPho]) VALUES (10, N'Khanh Hoa', N'Des_KhanhHoa.jpg', N'Khanh Hoa is a province of Vietnam located in the South Central Coast. It has a population of 1,147,000 and spans an area of 5,197 km². Its capital is Nha Trang. Khanh Hoa is the site of Bao Dai summer home, the Pasteur Institute of Nha Trang, the Institute of Oceanography, the Institute of Vaccines and Biological Substances, and was headquarters of the US Army Special Forces ("the Green Berets") during the Vietnam War in the late 1950s and 1960s. Cam Ranh Bay port is on land closest to a deep sea drop in Vietnam - the best site for submarine bases in Vietnam. An ancient temple of Champa is on the north side of Nha Trang.', 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DiaDanh] ([MaDiaDanh], [TenDiaDanh], [Img], [MoTa], [MaVung], [DanToc], [Dientich], [Danso], [DacSan], [ThanhPho]) VALUES (11, N'Da Lat', N'Des_Dalat.jpg', N'Da Lat is the capital of Lam Dong Province and the largest city of Central Highlands region. The city is located 1,500m  above sea level on the Langbian Plateau. Da Lat is one of the most popular tourist destinations in Vietnam.Da Lat specific sights are pine woods and twisting roads full of marigold and mimosa blossom in the winter. The city temperate weather stands in contrast to Vietnam otherwise tropical climate that no other city in the country has. Mist covering the valleys almost year-round leads to its name "City of Eternal Spring".', 6, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DiaDanh] ([MaDiaDanh], [TenDiaDanh], [Img], [MoTa], [MaVung], [DanToc], [Dientich], [Danso], [DacSan], [ThanhPho]) VALUES (12, N'Ba Ria Vung Tau', N'Des_Vungtau.jpg', N'Ba Ria Vung Tau is a province of Vietnam. It is located on the coast of the country Southeast region. It also includes the Con Dao islands, located some distance off Vietnam southeastern coast. From 1954 to 1975, this province belonged to South Vietnam with the name Phuoc Tuy.', 7, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DiaDanh] OFF
GO
SET IDENTITY_INSERT [dbo].[DichVu] ON 

INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa]) VALUES (1, N'08 hour for cycling & kayaking', N'Experience the feeling of cycling on a dreamy road with fresh air')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa]) VALUES (2, N'Entrance fee', N'Pay a small fee to step into the wonderful relaxation gates')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa]) VALUES (3, N'Private boat', N'What is more wonderful than when you alone ride a boat and surf')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa]) VALUES (4, N'Lunch on Boat', N'Enjoy delicious dishes on the cruise with your loved ones')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa]) VALUES (5, N'01 bottle of mineral water', NULL)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa]) VALUES (6, N'Single or double bicycle', NULL)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa]) VALUES (7, N'Shuttle bus', NULL)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa]) VALUES (8, N'English speaking guide?', NULL)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [MoTa]) VALUES (9, N'09 hour for cycling & kayaking', NULL)
SET IDENTITY_INSERT [dbo].[DichVu] OFF
GO
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (1, 1)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (1, 2)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (1, 3)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (1, 4)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (1, 5)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (1, 6)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (1, 7)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (1, 8)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (1, 9)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (2, 1)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (2, 2)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (2, 3)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (2, 5)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (2, 6)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (2, 7)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (3, 1)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (3, 2)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (3, 3)
INSERT [dbo].[DichVu_Tour] ([MaDichVu], [MaTour]) VALUES (3, 4)
GO
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'1', N'tour-1-1.jpg', 1)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'10', N'tour-1-4.jpg', 4)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'11', N'tour-1-2.jpg', 4)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'12', N'tour-1-2.jpg', 4)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'13', N'tour-1-3.jpg', 5)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'14', N'tour-1-4.jpg', 5)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'15', N'tour-1-3.jpg', 6)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'16', N'tour-1-4.jpg', 6)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'17', N'tour-1-4.jpg', 6)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'18', N'tour-1-2.jpg', 7)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'19', N'tour-1-1.jpg', 7)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'2', N'tour-1-2.jpg', 1)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'20', N'tour-1-1.jpg', 7)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'3', N'tour-1-3.jpg', 1)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'4', N'tour-1-4.jpg', 1)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'5', N'tour-1-1.jpg', 2)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'6', N'tour-1-3.jpg', 2)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'7', N'tour-1-1.jpg', 3)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'8', N'tour-1-2.jpg', 3)
INSERT [dbo].[LinkImg] ([MaLink], [LinkImg], [MaChiTietTour]) VALUES (N'9', N'tour-1-3.jpg', 3)
GO
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (1, N'Departure', 1)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (1, N'Departure', 2)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (1, N'Entertaiment', 3)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (1, N'Entertaiment', 4)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (1, N'Adventure Beggins', 5)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (2, N'Adventure Beggins', 1)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (2, N'Adventure Beggins', 2)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (2, N'Departure', 3)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (2, N'Adventure Beggins', 4)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (2, N'Entertaiment', 5)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (3, N'Historical Tour', 1)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (3, N'Historical Tour', 2)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (3, N'Adventure Beggins', 3)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (3, N'Entertaiment', 4)
INSERT [dbo].[Ngay] ([MaNgay], [TieuDe], [MaChiTietTour]) VALUES (4, N'Entertaiment', 1)
GO
SET IDENTITY_INSERT [dbo].[PhanHoi] ON 

INSERT [dbo].[PhanHoi] ([MaPhanHoi], [NoiDung], [TraLoi], [MaChiTietTK]) VALUES (1, N'This tour is so wonderfull', NULL, NULL)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [NoiDung], [TraLoi], [MaChiTietTK]) VALUES (2, N'This tour is so wonderful', NULL, NULL)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [NoiDung], [TraLoi], [MaChiTietTK]) VALUES (3, N'This tour is amazing', NULL, NULL)
SET IDENTITY_INSERT [dbo].[PhanHoi] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [username], [pass], [email], [role]) VALUES (1, N'khongthao', N'matkhau', N'shinkhong97@gmail.com', N'user      ')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [username], [pass], [email], [role]) VALUES (2, N'linhphuong', N'matkhau', N'hlphuong157@gmail.com', N'user      ')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [username], [pass], [email], [role]) VALUES (3, N'quanghung', N'matkhau', N'quanghungdo@gmail.com', N'user      ')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [username], [pass], [email], [role]) VALUES (4, N'thanhtu', N'matkhau', N'anthanhtu@gmail.com', N'user      ')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [username], [pass], [email], [role]) VALUES (5, N'admin', N'admin', N'admin@gmail.com', N'admin     ')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [username], [pass], [email], [role]) VALUES (9, N'hungdnvp', N'10b9ff3bf7d5a4a8d1ef4a6327d58531', N'hungkk@gmail.com', N'user      ')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [username], [pass], [email], [role]) VALUES (10, N'hungkk', N'10b9ff3bf7d5a4a8d1ef4a6327d58531', N'm@gmail.com', N'user      ')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [username], [pass], [email], [role]) VALUES (11, N'hungas', N'25d55ad283aa400af464c76d713c07ad', N'k@gmail.com', N'user      ')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([MaTour], [TenTour], [Mota], [Gia], [MaChiTietTour], [NumView], [LinkImage], [DiaDiem], [NumDay], [LinkVideo], [lat], [lng]) VALUES (1, N'Three Days In Phu Quoc', N'Some text to describe this tour', CAST(1500 AS Decimal(18, 0)), 6, 1200, N'img/tour/tour-1.jpg', N'Kien Giang, Viet Nam', 3, N'https://www.youtube.com/embed/HaKIPxCMzBo', NULL, NULL)
INSERT [dbo].[Tour] ([MaTour], [TenTour], [Mota], [Gia], [MaChiTietTour], [NumView], [LinkImage], [DiaDiem], [NumDay], [LinkVideo], [lat], [lng]) VALUES (2, N'A Peaceful Beach - Vung Tau', N'Some text to describe this tour', CAST(2000 AS Decimal(18, 0)), 1, 1400, N'img/tour/tour-2.jpg', N'Vung Tau, Viet Nam', 4, N'https://www.youtube.com/embed/HaKIPxCMzBo', N'10.411483453106948 ', N'107.1339507802514')
INSERT [dbo].[Tour] ([MaTour], [TenTour], [Mota], [Gia], [MaChiTietTour], [NumView], [LinkImage], [DiaDiem], [NumDay], [LinkVideo], [lat], [lng]) VALUES (3, N'BaNa - way to heaven', N'Some text to describe this tour', CAST(3000 AS Decimal(18, 0)), 5, 600, N'img/tour/tour-3.jpg', N'Da Nang, Viet Nam', 5, N'https://www.youtube.com/embed/HaKIPxCMzBo', N'16.00471199706594 ', N'107.99818529885454')
INSERT [dbo].[Tour] ([MaTour], [TenTour], [Mota], [Gia], [MaChiTietTour], [NumView], [LinkImage], [DiaDiem], [NumDay], [LinkVideo], [lat], [lng]) VALUES (4, N'Explore Cave in Phong Nha', N'Some text to describe this tour', CAST(1700 AS Decimal(18, 0)), 4, 300, N'img/tour/tour-4.jpg', N'Quang Binh, Viet Nam', 2, N'https://www.youtube.com/embed/HaKIPxCMzBo', N'17.58151528609836', N'106.28348575439162')
INSERT [dbo].[Tour] ([MaTour], [TenTour], [Mota], [Gia], [MaChiTietTour], [NumView], [LinkImage], [DiaDiem], [NumDay], [LinkVideo], [lat], [lng]) VALUES (5, N'Tour for group in Sapa', N'Some text to describe this tour', CAST(2100 AS Decimal(18, 0)), 1, 200, N'img/tour/tour-5.jpg', N'Lao Cai, Viet Nam', 3, N'https://www.youtube.com/embed/HaKIPxCMzBo', N'22.352866642719956', N'103.81735600288516')
INSERT [dbo].[Tour] ([MaTour], [TenTour], [Mota], [Gia], [MaChiTietTour], [NumView], [LinkImage], [DiaDiem], [NumDay], [LinkVideo], [lat], [lng]) VALUES (6, N'Autumn In Ha Noi ', N'Some text to describe this tour', CAST(2900 AS Decimal(18, 0)), 2, 3000, N'img/tour/tour-6.jpg', N'Ha Noi, Viet Nam', 1, N'https://www.youtube.com/embed/HaKIPxCMzBo', N'21.02519932051045', N'105.85767691212766
')
INSERT [dbo].[Tour] ([MaTour], [TenTour], [Mota], [Gia], [MaChiTietTour], [NumView], [LinkImage], [DiaDiem], [NumDay], [LinkVideo], [lat], [lng]) VALUES (7, N'Be Love With Nha Trang', N'Some text to describe this tour', CAST(1500 AS Decimal(18, 0)), 2, 545, N'img/tour/tour-7.jpg', N'Quang Ninh, Viet Nam', 6, N'https://www.youtube.com/embed/HaKIPxCMzBo', N'12.243006164623022', N'109.19467383238222')
INSERT [dbo].[Tour] ([MaTour], [TenTour], [Mota], [Gia], [MaChiTietTour], [NumView], [LinkImage], [DiaDiem], [NumDay], [LinkVideo], [lat], [lng]) VALUES (8, N'Family Tour In Ha Long Bay', N'Some text to describe this tour', CAST(1500 AS Decimal(18, 0)), 3, 1000, N'img/tour/tour-8.jpg', N'Quang Ninh, Viet Nam', 3, N'https://www.youtube.com/embed/HaKIPxCMzBo', N'20.96639242961097', N'107.04667404106326
')
INSERT [dbo].[Tour] ([MaTour], [TenTour], [Mota], [Gia], [MaChiTietTour], [NumView], [LinkImage], [DiaDiem], [NumDay], [LinkVideo], [lat], [lng]) VALUES (9, N'BaNa - way to heaven2', N'Some text to describe this tour', CAST(1700 AS Decimal(18, 0)), 3, 1400, N'img/tour/tour-3.jpg', N'Da Nang, Viet Nam', 3, N'https://www.youtube.com/embed/HaKIPxCMzBo', N'16.00471199706594 ', N'107.99818529885454')
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (1, 1)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (1, 2)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (1, 3)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (1, 4)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (1, 5)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (1, 6)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (1, 7)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (1, 10)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (1, 12)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (2, 3)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (2, 4)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (2, 5)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (3, 4)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (3, 11)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (4, 6)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (4, 9)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (5, 2)
INSERT [dbo].[Tour_DiaDanh] ([MaTour], [MaDiaDanh]) VALUES (5, 10)
GO
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (1, 1)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (1, 2)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (1, 4)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (2, 1)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (2, 3)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (3, 3)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (3, 4)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (4, 1)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (4, 4)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (5, 2)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (6, 1)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (6, 3)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (7, 4)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (8, 2)
INSERT [dbo].[Tour_TravelType] ([MaTour], [MaTravelType]) VALUES (8, 3)
GO
SET IDENTITY_INSERT [dbo].[TravelType] ON 

INSERT [dbo].[TravelType] ([MaTravelType], [TravelTypeName]) VALUES (1, N'Adventure')
INSERT [dbo].[TravelType] ([MaTravelType], [TravelTypeName]) VALUES (2, N'Escorted Tour')
INSERT [dbo].[TravelType] ([MaTravelType], [TravelTypeName]) VALUES (3, N'River Cruise')
INSERT [dbo].[TravelType] ([MaTravelType], [TravelTypeName]) VALUES (4, N'Suffing')
SET IDENTITY_INSERT [dbo].[TravelType] OFF
GO
SET IDENTITY_INSERT [dbo].[Vung] ON 

INSERT [dbo].[Vung] ([MaVung], [TenVung]) VALUES (1, N'NorthWest')
INSERT [dbo].[Vung] ([MaVung], [TenVung]) VALUES (2, N'Northwest')
INSERT [dbo].[Vung] ([MaVung], [TenVung]) VALUES (3, N'Northeast')
INSERT [dbo].[Vung] ([MaVung], [TenVung]) VALUES (4, N'Red River Delta')
INSERT [dbo].[Vung] ([MaVung], [TenVung]) VALUES (5, N'North Central')
INSERT [dbo].[Vung] ([MaVung], [TenVung]) VALUES (6, N'South Central Coast')
INSERT [dbo].[Vung] ([MaVung], [TenVung]) VALUES (7, N'Central Highlands')
INSERT [dbo].[Vung] ([MaVung], [TenVung]) VALUES (8, N'Southeast')
INSERT [dbo].[Vung] ([MaVung], [TenVung]) VALUES (9, N'Southwest')
SET IDENTITY_INSERT [dbo].[Vung] OFF
GO
ALTER TABLE [dbo].[BangGia]  WITH CHECK ADD FOREIGN KEY([MaTour])
REFERENCES [dbo].[Tour] ([MaTour])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_ThanhVien] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_ThanhVien]
GO
ALTER TABLE [dbo].[ChiTietNgay]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietNgay_Ngay] FOREIGN KEY([MaNgay], [MaChiTietTour])
REFERENCES [dbo].[Ngay] ([MaNgay], [MaChiTietTour])
GO
ALTER TABLE [dbo].[ChiTietNgay] CHECK CONSTRAINT [FK_ChiTietNgay_Ngay]
GO
ALTER TABLE [dbo].[ChiTietTK]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietTK_TaiKhoan] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[ChiTietTK] CHECK CONSTRAINT [FK_ChiTietTK_TaiKhoan]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaChiTietTK])
REFERENCES [dbo].[ChiTietTK] ([MaChiTietTK])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaTour])
REFERENCES [dbo].[Tour] ([MaTour])
GO
ALTER TABLE [dbo].[DiaDanh]  WITH CHECK ADD  CONSTRAINT [FK__DiaDanh__MaVung__267ABA7A] FOREIGN KEY([MaVung])
REFERENCES [dbo].[Vung] ([MaVung])
GO
ALTER TABLE [dbo].[DiaDanh] CHECK CONSTRAINT [FK__DiaDanh__MaVung__267ABA7A]
GO
ALTER TABLE [dbo].[DichVu_Tour]  WITH CHECK ADD FOREIGN KEY([MaDichVu])
REFERENCES [dbo].[DichVu] ([MaDichVu])
GO
ALTER TABLE [dbo].[DichVu_Tour]  WITH CHECK ADD FOREIGN KEY([MaTour])
REFERENCES [dbo].[Tour] ([MaTour])
GO
ALTER TABLE [dbo].[LinkImg]  WITH CHECK ADD  CONSTRAINT [FK__Link__MaChiTietT__2B3F6F97] FOREIGN KEY([MaChiTietTour])
REFERENCES [dbo].[ChiTietTour] ([MaChiTietTour])
GO
ALTER TABLE [dbo].[LinkImg] CHECK CONSTRAINT [FK__Link__MaChiTietT__2B3F6F97]
GO
ALTER TABLE [dbo].[Ngay]  WITH CHECK ADD FOREIGN KEY([MaChiTietTour])
REFERENCES [dbo].[ChiTietTour] ([MaChiTietTour])
GO
ALTER TABLE [dbo].[PhanHoi]  WITH CHECK ADD  CONSTRAINT [FK_PhanHoi_ChiTietTK] FOREIGN KEY([MaChiTietTK])
REFERENCES [dbo].[ChiTietTK] ([MaChiTietTK])
GO
ALTER TABLE [dbo].[PhanHoi] CHECK CONSTRAINT [FK_PhanHoi_ChiTietTK]
GO
ALTER TABLE [dbo].[PhieuDatTour]  WITH CHECK ADD  CONSTRAINT [FK__PhieuDatT__MaTou__3A81B327] FOREIGN KEY([MaTour])
REFERENCES [dbo].[Tour] ([MaTour])
GO
ALTER TABLE [dbo].[PhieuDatTour] CHECK CONSTRAINT [FK__PhieuDatT__MaTou__3A81B327]
GO
ALTER TABLE [dbo].[PhieuDatTour]  WITH CHECK ADD  CONSTRAINT [FK__PhieuDatTo__MaKH__398D8EEE] FOREIGN KEY([MaChiTietTK])
REFERENCES [dbo].[ChiTietTK] ([MaChiTietTK])
GO
ALTER TABLE [dbo].[PhieuDatTour] CHECK CONSTRAINT [FK__PhieuDatTo__MaKH__398D8EEE]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK__Tour__MaChiTietT__36B12243] FOREIGN KEY([MaChiTietTour])
REFERENCES [dbo].[ChiTietTour] ([MaChiTietTour])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK__Tour__MaChiTietT__36B12243]
GO
ALTER TABLE [dbo].[Tour_DiaDanh]  WITH CHECK ADD FOREIGN KEY([MaDiaDanh])
REFERENCES [dbo].[DiaDanh] ([MaDiaDanh])
GO
ALTER TABLE [dbo].[Tour_DiaDanh]  WITH CHECK ADD FOREIGN KEY([MaTour])
REFERENCES [dbo].[Tour] ([MaTour])
GO
ALTER TABLE [dbo].[Tour_TravelType]  WITH CHECK ADD FOREIGN KEY([MaTour])
REFERENCES [dbo].[Tour] ([MaTour])
GO
ALTER TABLE [dbo].[Tour_TravelType]  WITH CHECK ADD FOREIGN KEY([MaTravelType])
REFERENCES [dbo].[TravelType] ([MaTravelType])
GO
USE [master]
GO
ALTER DATABASE [TravelVietNam] SET  READ_WRITE 
GO
