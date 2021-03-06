USE [master]
GO
/****** Object:  Database [QuizOnline]    Script Date: 7/18/2021 6:28:25 PM ******/
CREATE DATABASE [QuizOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuizOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuizOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuizOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuizOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuizOnline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuizOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuizOnline] SET  MULTI_USER 
GO
ALTER DATABASE [QuizOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuizOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuizOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuizOnline] SET QUERY_STORE = OFF
GO
USE [QuizOnline]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/18/2021 6:28:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 7/18/2021 6:28:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](1000) NOT NULL,
	[Option1] [nvarchar](1000) NOT NULL,
	[Option2] [nvarchar](1000) NOT NULL,
	[Option3] [nvarchar](1000) NOT NULL,
	[Option4] [nvarchar](1000) NOT NULL,
	[Solution] [int] NOT NULL,
	[DateCreated] [date] NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password], [Type], [Email]) VALUES (N'admin', N'admin', 1, N'admin@gmail.com')
INSERT [dbo].[Account] ([Username], [Password], [Type], [Email]) VALUES (N'khanh', N'khanh', 0, N'khanhpdhe141226@fpt.edu.vn')
INSERT [dbo].[Account] ([Username], [Password], [Type], [Email]) VALUES (N'student', N'student', 0, N'student@gmail.com')
INSERT [dbo].[Account] ([Username], [Password], [Type], [Email]) VALUES (N'teacher', N'teacher', 1, N'teacher@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (2, N'2 largest cities in Vietnam?', N'Ha Noi', N'Ho Chi Minh', N'Da Nang', N'Nha Trang', 12, CAST(N'2021-06-23' AS Date), N'admin')
INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (4, N'What is the color of banana?', N'Orange', N'Grey', N'Yellow', N'Red', 3, CAST(N'2021-06-23' AS Date), N'admin')
INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (5, N'Where is FPT University located?', N'Hoa Lac', N'Hoang Mai', N'Cau Giay', N'Ba Dinh', 1, CAST(N'2021-06-23' AS Date), N'admin')
INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (7, N'How many subjects per semester that student of FPT University have to learn?', N'5', N'7', N'1', N'Others', 1, CAST(N'2021-06-23' AS Date), N'teacher')
INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (8, N'Who is the 2018 World Cup champion?', N'Vietnam national team', N'Brazil national team', N'Germany national team', N'France national team', 4, CAST(N'2021-06-23' AS Date), N'teacher')
INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (9, N'How many times has the German national team won the World Cup?', N'6', N'4', N'1', N'2', 2, CAST(N'2021-06-23' AS Date), N'teacher')
INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (10, N'Who below are members of Avenger?', N'Tony Stark', N'Bruce Wayne', N'Natasha', N'Steve Rogers', 134, CAST(N'2021-06-23' AS Date), N'teacher')
INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (11, N'What semester do FPT university students have to do an internship?', N'6', N'8', N'3', N'5', 1, CAST(N'2021-06-23' AS Date), N'teacher')
INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (12, N'What class are we in?', N'SE1437', N'SE1432', N'SE1505', N'SE1630', 2, CAST(N'2021-06-23' AS Date), N'admin')
INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (13, N'Does your crush like you?', N'No', N'Of course no', N'Are u stupid?', N'Absolutely no', 4, CAST(N'2021-06-27' AS Date), N'admin')
INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (15, N'Love me?', N'Yes', N'Of course you are so handsome!', N'Now and forever', N'Let''s get married!', 2, CAST(N'2021-06-27' AS Date), N'teacher')
INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (16, N'2+2=?', N'1', N'2', N'3', N'4', 4, CAST(N'2021-06-27' AS Date), N'admin')
INSERT [dbo].[Question] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Solution], [DateCreated], [Author]) VALUES (17, N'ABC', N'a', N'b', N'c', N'd', 123, CAST(N'2021-07-02' AS Date), N'admin')
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
USE [master]
GO
ALTER DATABASE [QuizOnline] SET  READ_WRITE 
GO
