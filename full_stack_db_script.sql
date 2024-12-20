USE [master]
GO
/****** Object:  Database [full_stack_db]    Script Date: 1.12.2024 12:18:30 ******/
CREATE DATABASE [full_stack_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'full_stack_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FULLSTACKDB\MSSQL\DATA\full_stack_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'full_stack_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FULLSTACKDB\MSSQL\DATA\full_stack_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [full_stack_db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [full_stack_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [full_stack_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [full_stack_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [full_stack_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [full_stack_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [full_stack_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [full_stack_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [full_stack_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [full_stack_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [full_stack_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [full_stack_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [full_stack_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [full_stack_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [full_stack_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [full_stack_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [full_stack_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [full_stack_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [full_stack_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [full_stack_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [full_stack_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [full_stack_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [full_stack_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [full_stack_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [full_stack_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [full_stack_db] SET  MULTI_USER 
GO
ALTER DATABASE [full_stack_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [full_stack_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [full_stack_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [full_stack_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [full_stack_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [full_stack_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [full_stack_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [full_stack_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [full_stack_db]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 1.12.2024 12:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] NOT NULL,
	[CityName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassDetails]    Script Date: 1.12.2024 12:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassDetails](
	[ClassID] [int] NOT NULL,
	[StudentID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 1.12.2024 12:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassProfID] [int] NULL,
	[ClassStartDate] [datetime] NULL,
	[CalssEndDate] [datetime] NULL,
	[ClassDescription] [nvarchar](50) NULL,
	[ClassFieldID] [int] NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fields]    Script Date: 1.12.2024 12:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[FieldID] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Fields] PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professors]    Script Date: 1.12.2024 12:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[ProfID] [int] IDENTITY(1,1) NOT NULL,
	[ProfName] [nvarchar](50) NULL,
	[ProfSurname] [nvarchar](50) NULL,
	[ProfFieldID] [int] NULL,
	[ProfCityID] [int] NULL,
 CONSTRAINT [PK_Professor] PRIMARY KEY CLUSTERED 
(
	[ProfID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 1.12.2024 12:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](50) NULL,
	[StudentSurname] [nvarchar](50) NULL,
	[StudentNumber] [nvarchar](50) NULL,
	[StudentCityID] [int] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (1, N'Adana')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (2, N'Adıyaman')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (3, N'Afyonkarahisar')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (4, N'Ağrı')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (5, N'Amasya')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (6, N'Ankara')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (7, N'Antalya')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (8, N'Artvin')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (9, N'Aydın')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (10, N'Balıkesir')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (11, N'Bilecik')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (12, N'Bingöl')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (13, N'Bitlis')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (14, N'Bolu')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (15, N'Burdur')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (16, N'Bursa')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (17, N'Çanakkale')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (18, N'Çankırı')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (19, N'Çorum')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (20, N'Denizli')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (21, N'Diyarbakır')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (22, N'Edirne')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (23, N'Elazığ')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (24, N'Erzincan')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (25, N'Erzurum')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (26, N'Eskişehir')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (27, N'Gaziantep')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (28, N'Giresun')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (29, N'Gümüşhane')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (30, N'Hakkâri')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (31, N'Hatay')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (32, N'Isparta')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (33, N'Mersin')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (34, N'İstanbul')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (35, N'İzmir')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (36, N'Kars')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (37, N'Kastamonu')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (38, N'Kayseri')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (39, N'Kırklareli')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (40, N'Kırşehir')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (41, N'Kocaeli')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (42, N'Konya')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (43, N'Kütahya')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (44, N'Malatya')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (45, N'Manisa')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (46, N'Kahramanmaraş')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (47, N'Mardin')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (48, N'Muğla')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (49, N'Muş')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (50, N'Nevşehir')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (51, N'Niğde')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (52, N'Ordu')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (53, N'Rize')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (54, N'Sakarya')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (55, N'Samsun')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (56, N'Siirt')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (57, N'Sinop')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (58, N'Sivas')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (59, N'Tekirdağ')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (60, N'Tokat')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (61, N'Trabzon')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (62, N'Tunceli')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (63, N'Şanlıurfa')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (64, N'Uşak')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (65, N'Van')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (66, N'Yozgat')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (67, N'Zonguldak')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (68, N'Aksaray')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (69, N'Bayburt')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (70, N'Karaman')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (71, N'Kırıkkale')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (72, N'Batman')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (73, N'Şırnak')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (74, N'Bartın')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (75, N'Ardahan')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (76, N'Iğdır')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (77, N'Yalova')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (78, N'Karabük')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (79, N'Kilis')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (80, N'Osmaniye')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (81, N'Düzce')
GO
INSERT [dbo].[ClassDetails] ([ClassID], [StudentID]) VALUES (1, 1)
INSERT [dbo].[ClassDetails] ([ClassID], [StudentID]) VALUES (1, 4)
INSERT [dbo].[ClassDetails] ([ClassID], [StudentID]) VALUES (1, 3)
INSERT [dbo].[ClassDetails] ([ClassID], [StudentID]) VALUES (1, 7)
INSERT [dbo].[ClassDetails] ([ClassID], [StudentID]) VALUES (1, 8)
INSERT [dbo].[ClassDetails] ([ClassID], [StudentID]) VALUES (2, 3)
INSERT [dbo].[ClassDetails] ([ClassID], [StudentID]) VALUES (2, 4)
INSERT [dbo].[ClassDetails] ([ClassID], [StudentID]) VALUES (2, 5)
INSERT [dbo].[ClassDetails] ([ClassID], [StudentID]) VALUES (3, 6)
INSERT [dbo].[ClassDetails] ([ClassID], [StudentID]) VALUES (3, 8)
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([ClassID], [ClassProfID], [ClassStartDate], [CalssEndDate], [ClassDescription], [ClassFieldID]) VALUES (1, 1, CAST(N'2024-11-30T00:00:00.000' AS DateTime), CAST(N'2025-11-30T00:00:00.000' AS DateTime), N'Nice Lecture', 1)
INSERT [dbo].[Classes] ([ClassID], [ClassProfID], [ClassStartDate], [CalssEndDate], [ClassDescription], [ClassFieldID]) VALUES (2, 2, CAST(N'2024-12-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime), N'Siber Güvenlik dersi', 2)
INSERT [dbo].[Classes] ([ClassID], [ClassProfID], [ClassStartDate], [CalssEndDate], [ClassDescription], [ClassFieldID]) VALUES (3, 4, CAST(N'2024-12-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime), N'Matematik dersi çok güzel', 4)
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
SET IDENTITY_INSERT [dbo].[Fields] ON 

INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (1, N'Computer Eng')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (2, N'Cyber Security')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (3, N'Dil bilgisi')
INSERT [dbo].[Fields] ([FieldID], [FieldName]) VALUES (4, N'Matematik')
SET IDENTITY_INSERT [dbo].[Fields] OFF
GO
SET IDENTITY_INSERT [dbo].[Professors] ON 

INSERT [dbo].[Professors] ([ProfID], [ProfName], [ProfSurname], [ProfFieldID], [ProfCityID]) VALUES (1, N'Tarık', N'Hamarat', 1, 35)
INSERT [dbo].[Professors] ([ProfID], [ProfName], [ProfSurname], [ProfFieldID], [ProfCityID]) VALUES (2, N'Halit', N'Özer', 2, 35)
INSERT [dbo].[Professors] ([ProfID], [ProfName], [ProfSurname], [ProfFieldID], [ProfCityID]) VALUES (3, N'Furkan', N'Demirbaş', 3, 35)
INSERT [dbo].[Professors] ([ProfID], [ProfName], [ProfSurname], [ProfFieldID], [ProfCityID]) VALUES (4, N'Kerem', N'Hamarat', 4, 34)
SET IDENTITY_INSERT [dbo].[Professors] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentID], [StudentName], [StudentSurname], [StudentNumber], [StudentCityID]) VALUES (1, N'Tarık', N'Hamarat', N'100', 1)
INSERT [dbo].[Students] ([StudentID], [StudentName], [StudentSurname], [StudentNumber], [StudentCityID]) VALUES (2, N'Esra', N'Çakıcı', N'454', 34)
INSERT [dbo].[Students] ([StudentID], [StudentName], [StudentSurname], [StudentNumber], [StudentCityID]) VALUES (3, N'Yusuf', N'Ergin', N'123', 12)
INSERT [dbo].[Students] ([StudentID], [StudentName], [StudentSurname], [StudentNumber], [StudentCityID]) VALUES (4, N'Tuna ', N'Genç', N'789', 45)
INSERT [dbo].[Students] ([StudentID], [StudentName], [StudentSurname], [StudentNumber], [StudentCityID]) VALUES (5, N'Alper', N'Kayabaşı', N'457', 34)
INSERT [dbo].[Students] ([StudentID], [StudentName], [StudentSurname], [StudentNumber], [StudentCityID]) VALUES (6, N'Duhan', N'Göksal', N'639', 1)
INSERT [dbo].[Students] ([StudentID], [StudentName], [StudentSurname], [StudentNumber], [StudentCityID]) VALUES (7, N'Hamdi', N'Kantekin', N'951', 1)
INSERT [dbo].[Students] ([StudentID], [StudentName], [StudentSurname], [StudentNumber], [StudentCityID]) VALUES (8, N'Ömer', N'Şahin', N'782', 34)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Classes_Fields] FOREIGN KEY([ClassFieldID])
REFERENCES [dbo].[Fields] ([FieldID])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Classes_Fields]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Classes_Professors] FOREIGN KEY([ClassProfID])
REFERENCES [dbo].[Professors] ([ProfID])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Classes_Professors]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Cities] FOREIGN KEY([ProfCityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Cities]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_ProfFieldID_FieldID] FOREIGN KEY([ProfFieldID])
REFERENCES [dbo].[Fields] ([FieldID])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_ProfFieldID_FieldID]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Cities] FOREIGN KEY([StudentCityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Cities]
GO
USE [master]
GO
ALTER DATABASE [full_stack_db] SET  READ_WRITE 
GO
