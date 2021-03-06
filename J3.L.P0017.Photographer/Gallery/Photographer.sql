USE [master]
GO
/****** Object:  Database [GalleryLab]    Script Date: 7/19/2021 9:48:14 AM ******/
CREATE DATABASE [GalleryLab]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GalleryLab', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GalleryLab.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GalleryLab_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GalleryLab_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GalleryLab] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GalleryLab].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GalleryLab] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GalleryLab] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GalleryLab] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GalleryLab] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GalleryLab] SET ARITHABORT OFF 
GO
ALTER DATABASE [GalleryLab] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GalleryLab] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GalleryLab] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GalleryLab] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GalleryLab] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GalleryLab] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GalleryLab] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GalleryLab] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GalleryLab] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GalleryLab] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GalleryLab] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GalleryLab] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GalleryLab] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GalleryLab] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GalleryLab] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GalleryLab] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GalleryLab] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GalleryLab] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GalleryLab] SET  MULTI_USER 
GO
ALTER DATABASE [GalleryLab] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GalleryLab] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GalleryLab] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GalleryLab] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GalleryLab] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GalleryLab] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GalleryLab] SET QUERY_STORE = OFF
GO
USE [GalleryLab]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/19/2021 9:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[address] [nvarchar](100) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[telephone] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[map] [varchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 7/19/2021 9:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](30) NULL,
	[description] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Introduction]    Script Date: 7/19/2021 9:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Introduction](
	[banner] [varchar](100) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[about] [nvarchar](1000) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 7/19/2021 9:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gallery_id] [int] NULL,
	[image_url] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Share]    Script Date: 7/19/2021 9:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Share](
	[facebook_url] [varchar](500) NOT NULL,
	[twitter_url] [varchar](500) NOT NULL,
	[google_url] [varchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Views]    Script Date: 7/19/2021 9:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Views](
	[ViewsPage] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Contact] ([address], [city], [country], [telephone], [email], [map]) VALUES (N'Quang Trung', N'Hải Dương', N'Việt Nam', N'0964810558', N'khanhphamduy2000@gmail.com', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3726.286653732397!2d106.3333155148193!3d20.941000496144603!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31359b488fa9f5fd%3A0xb4539c002f676104!2zMTEgVGhpIFPDoWNoLCBQLiBRdWFuZyBUcnVuZywgVGjDoG5oIHBo4buRIEjhuqNpIETGsMahbmcsIEjhuqNpIETGsMahbmcsIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1624586333155!5m2!1sen!2s')
GO
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([id], [title], [description]) VALUES (10, N'Gallery 1', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
                                tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,
                                quis nostrud exerci tation')
INSERT [dbo].[Gallery] ([id], [title], [description]) VALUES (11, N'Gallery 2', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
                                tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,
                                quis nostrud exerci tation')
INSERT [dbo].[Gallery] ([id], [title], [description]) VALUES (12, N'Gallery 3', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
                                tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,
                                quis nostrud exerci tation')
INSERT [dbo].[Gallery] ([id], [title], [description]) VALUES (13, N'Gallery 4', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
                                tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,
                                quis nostrud exerci tation')
INSERT [dbo].[Gallery] ([id], [title], [description]) VALUES (14, N'Gallery 5', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
                                tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,
                                quis nostrud exerci tation')
SET IDENTITY_INSERT [dbo].[Gallery] OFF
GO
INSERT [dbo].[Introduction] ([banner], [description], [about]) VALUES (N'images/banner.jpg', N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
                    laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation
                    ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure
                    dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
                    facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
                    delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend
                    option congue nihil imperdiet doming id quod mazim')
GO
SET IDENTITY_INSERT [dbo].[Picture] ON 

INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (11, 10, N'images/img1.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (12, 10, N'images/img2.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (13, 10, N'images/img3.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (14, 10, N'images/img4.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (15, 10, N'images/img5.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (16, 10, N'images/img10.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (17, 10, N'images/img6.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (18, 10, N'images/img7.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (19, 10, N'images/img8.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (24, 11, N'images/img14.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (25, 11, N'images/img13.png')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (26, 11, N'images/img8.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (27, 11, N'images/img7.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (28, 12, N'images/img6.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (29, 12, N'images/img5.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (30, 12, N'images/img4.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (31, 12, N'images/img3.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (32, 12, N'images/img2.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (33, 12, N'images/img1.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (34, 12, N'images/img12.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (35, 12, N'images/img14.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (36, 13, N'images/img8.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (37, 13, N'images/img7.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (38, 13, N'images/img6.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (39, 13, N'images/img5.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (40, 13, N'images/img4.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (41, 13, N'images/img3.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (42, 13, N'images/img2.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (43, 13, N'images/img1.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (44, 14, N'images/img9.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (45, 14, N'images/img8.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (46, 14, N'images/img10.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (47, 14, N'images/img12.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (48, 14, N'images/img14.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (49, 14, N'images/img1.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (50, 14, N'images/img5.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (51, 14, N'images/img7.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (52, 14, N'images/img6.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (53, 14, N'images/img4.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (54, 14, N'images/img3.jpg')
INSERT [dbo].[Picture] ([id], [gallery_id], [image_url]) VALUES (55, 14, N'images/img2.jpg')
SET IDENTITY_INSERT [dbo].[Picture] OFF
GO
INSERT [dbo].[Share] ([facebook_url], [twitter_url], [google_url]) VALUES (N'https://www.facebook.com/', N'https://twitter.com/?lang=en', N'https://www.google.com/')
GO
INSERT [dbo].[Views] ([ViewsPage]) VALUES (120)
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD FOREIGN KEY([gallery_id])
REFERENCES [dbo].[Gallery] ([id])
GO
USE [master]
GO
ALTER DATABASE [GalleryLab] SET  READ_WRITE 
GO
