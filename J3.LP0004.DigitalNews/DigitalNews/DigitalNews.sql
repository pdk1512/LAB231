USE [master]
GO
/****** Object:  Database [DigitalNews]    Script Date: 7/19/2021 9:46:54 AM ******/
CREATE DATABASE [DigitalNews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DigitalNews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DigitalNews.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DigitalNews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DigitalNews_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DigitalNews] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DigitalNews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DigitalNews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DigitalNews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DigitalNews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DigitalNews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DigitalNews] SET ARITHABORT OFF 
GO
ALTER DATABASE [DigitalNews] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DigitalNews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DigitalNews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DigitalNews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DigitalNews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DigitalNews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DigitalNews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DigitalNews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DigitalNews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DigitalNews] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DigitalNews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DigitalNews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DigitalNews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DigitalNews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DigitalNews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DigitalNews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DigitalNews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DigitalNews] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DigitalNews] SET  MULTI_USER 
GO
ALTER DATABASE [DigitalNews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DigitalNews] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DigitalNews] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DigitalNews] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DigitalNews] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DigitalNews] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DigitalNews] SET QUERY_STORE = OFF
GO
USE [DigitalNews]
GO
/****** Object:  Table [dbo].[News]    Script Date: 7/19/2021 9:46:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [text] NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Summary] [text] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([ID], [Title], [Description], [Image], [Author], [Date], [Summary]) VALUES (1, N'Poor pitches perturb players in disappointing Copa America', N'Lionel Messi and Brazil''s Neymar are among the players and coaches who have lamented having to play on surfaces that the Argentine forward euphemistically described as “not very helpful”.

“I am not going to call it horrible but it’s terrible for playing football on, it ruins the spectacle,” Brazil coach Tite said of the pitch at the Nilton Santos stadium in Rio de Janeiro, the same one that irritated Messi a few days before.

“Those that want to create aren’t able. It’s unacceptable that two top quality teams... have to play on a pitch in these conditions.”', N'images/i1.jpg', N'Andrew Downie', CAST(N'2020-08-13' AS Date), N'The contrast between the rejuvenated European Championship and a pandemic-hit Copa America are great but for South American players, at least, perhaps the biggest discrepancy is the inferior state of the pitches in Brazil.')
INSERT [dbo].[News] ([ID], [Title], [Description], [Image], [Author], [Date], [Summary]) VALUES (3, N'J Hotel Shanghai Tower: World''s highest hotel opens in China', N'In Dubai, there''s an ongoing battle for the title of tallest hotel in the city and on the planet.
The 356-meter (1,168 feet) Gevora Hotel was officially recognized as the world''s tallest hotel by the Guinness Book of World Records in 2018.
It''s worth noting the title of tallest hotel is typically applied only to buildings used wholly as hotels, unlike the J Hotel, which only occupies an upper section of the Shanghai Tower.
Hot on Gevora''s heels is the still-under-construction Ciel Tower, which will have 1,042 rooms and reach a height of 360.4 meters when it''s completed.
Unlike some of the other hotels on this list, the Ciel (French for "sky") is slated to have a glass rooftop observation deck, which will give non-guests an opportunity to experience the view for themselves.', N'images/i2.jpg', N'Lilit Marcus', CAST(N'2019-02-22' AS Date), N'The J Hotel is owned by Jin Jiang International. One of China''s largest hotel and tourism enterprise groups, it''s part of the state-owned Assets Supervision and Administration Commission.')
INSERT [dbo].[News] ([ID], [Title], [Description], [Image], [Author], [Date], [Summary]) VALUES (4, N'Switzerland stuns France in Euro 2020 as Kylian Mbappe misses in penalty shootout', N'Kylian Mbappe, who endured a torrid night leading the line for France, capped a miserable evening by missing his team''s decisive fifth penalty, the only player not to score in the shootout.
It was scarcely believable the tie had even reached this stage, as Switzerland trailed 3-1 with less than 10 minutes of regulation time remaining.
However, late goals from Haris Seferovic and Mario Gavranovic stunned their French opponents as Switzerland forced extra-time.
France looked like it was cruising after Karim Benzema''s brace and Paul Pogba''s stunning long-range strike had canceled out Seferovic''s early header, with Switzerland''s Ricardo Rodriguez missing what looked like a crucial penalty in the second half.', N'images/i3.jpg', N'Matias Grez', CAST(N'2020-06-28' AS Date), N'Switzerland stunned reigning world champion France with victory in a nerve-shredding penalty shootout to book its place in the Euro 2020 quarterfinals.')
INSERT [dbo].[News] ([ID], [Title], [Description], [Image], [Author], [Date], [Summary]) VALUES (5, N'Study nixes life in clouds of Venus, but maybe in Jupiter''s?', N'A new study is throwing cold water on the possibility of life in the clouds of Venus.

Scientists from Europe and the U.S. reported Monday there isn’t nearly enough water vapor in the scorching planet’s clouds to support life as we know it.

The team looked into the matter following September’s surprise announcement by others that strange, tiny organisms could be lurking in the thick, sulfuric acid-filled clouds of Venus. Through spacecraft observations, the latest research group found the water level is more than 100 times too low to support Earth-like life.', N'images/i4.jpg', N'The Associated Press', CAST(N'2019-05-20' AS Date), N'While the latest findings veto Venus at least for water-based organisms, they identify Jupiter as having enough water in the clouds and the right atmospheric temperatures to support life.')
INSERT [dbo].[News] ([ID], [Title], [Description], [Image], [Author], [Date], [Summary]) VALUES (6, N'Man survives great white shark attack, says he''s ''probably the luckiest guy in the world''', N'"At that point, I was like, ''OK, I got hit,''" Nemanja Spasojevic told NBC''s "TODAY" show. "I started kicking frantically toward the rocks."

Spasojevic, 38, said he''s an avid surfer and snorkeler and had been to the beach in San Mateo County on numerous occasions. He said he was aware that sharks were known to be in the area, but it was rare for them to attack people.

So Spasojevic didn''t think twice about putting on his wetsuit and going into the water Saturday morning. He told "TODAY" he was hoping to catch some crabs so he could "have a nice dinner."', N'images/i3.jpg', N'Minyvonne Burke', CAST(N'2020-12-15' AS Date), N'A San Francisco man said he was looking for crabs in Gray Whale Cove State Beach when he felt a sharp pain followed by a slight push. When he looked down, he was staring in the face of a great white shark that had just bitten him.')
INSERT [dbo].[News] ([ID], [Title], [Description], [Image], [Author], [Date], [Summary]) VALUES (7, N'Gas prices at 7-year high $3 per gallon levels here to stay', N'"Traditionally we see gas prices start declining in mid-to-late August as we start to see things [going] back to normal, kids going back to school, vacations basically ending," de Hann said. "This year, though, I think the concern is that…the normal seasonal down-turning could be mitigated by the fact that offices are starting to see returns by fall and so commutes could start to increase."

"That really brings to question," de Hann continued. "Will we see a seasonal decline in autumn, and when will it be?" The analyst said that while a decline is still likely to occur, it might be "muted" by a surge in drivers heading to their jobs who had previously been working remotely due to the coronavirus pandemic.', N'images/i1.jpg', N'Breck Dumas', CAST(N'2021-04-17' AS Date), N'Gas prices have jumped to a 7-year high, above $3.00 per gallon, and these levels may become the norm for drivers all summer long, according to GasBuddy Head of Petroleum Analysis Patrick de Hann.')
INSERT [dbo].[News] ([ID], [Title], [Description], [Image], [Author], [Date], [Summary]) VALUES (8, N'Rolling blackouts for parts of US Northwest amid heat wave', N'The intense weather that gave Seattle and Portland consecutive days of record high temperatures far exceeding 100 degrees was expected to ease in those cities. But inland Spokane was likely to surpass Monday''s high temperature — a record-tying 105 Fahrenheit.

About 8,200 utility customers in parts of Spokane lost power on Monday and Avista Utilities warned that there will be more rolling blackouts on Tuesday in the city of about 220,000 people with the high temperature predicted at 110 F, which would be an all-time record.', N'images/i2.jpg', N'Gene Johnson , Nicholas K. Geranios', CAST(N'2021-03-22' AS Date), N'The unprecedented Northwest U.S. heat wave that slammed Seattle and Portland, Ore., moved inland Tuesday — prompting an electrical utility in Spokane, Wash., to warn that people will face more rolling blackouts amid heavy power demand.')
INSERT [dbo].[News] ([ID], [Title], [Description], [Image], [Author], [Date], [Summary]) VALUES (9, N'Karl Rove: The Democratic Party has a problem', N'KARL ROVE: Look, elections are about choices and they are about the two different philosophies of the two parties. It is clear you mentioned a list of cities that have cut their police budgets. Every single one of those has a Democrat mayor. Every one of those has a Democrat majority. In fact, in many instances, an exclusive hold on the city council, meaning there are no Republicans on the city council or maybe one or two out of a dozen. ', N'images/i4.jpg', N'Paula Deen', CAST(N'2021-06-30' AS Date), N'Fox News contributor Karl Rove argued Tuesday that Democrats will run into issues at the polls if they keep supporting efforts to defund police departments')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
USE [master]
GO
ALTER DATABASE [DigitalNews] SET  READ_WRITE 
GO
