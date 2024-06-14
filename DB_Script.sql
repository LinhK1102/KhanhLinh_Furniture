USE [master]
GO
/****** Object:  Database [Interior_2]    Script Date: 14/06/2024 3:22:50 CH ******/
CREATE DATABASE [Interior_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Interior_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Interior_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Interior_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Interior_2_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Interior_2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Interior_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Interior_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Interior_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Interior_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Interior_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Interior_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Interior_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Interior_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Interior_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Interior_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Interior_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Interior_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Interior_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Interior_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Interior_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Interior_2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Interior_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Interior_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Interior_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Interior_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Interior_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Interior_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Interior_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Interior_2] SET RECOVERY FULL 
GO
ALTER DATABASE [Interior_2] SET  MULTI_USER 
GO
ALTER DATABASE [Interior_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Interior_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Interior_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Interior_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Interior_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Interior_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Interior_2', N'ON'
GO
ALTER DATABASE [Interior_2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Interior_2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Interior_2]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 14/06/2024 3:22:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserID] [varchar](10) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountDetails]    Script Date: 14/06/2024 3:22:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountDetails](
	[UserID] [varchar](10) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[CusAdd] [varchar](255) NULL,
	[CusCity] [varchar](100) NULL,
	[CusState] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 14/06/2024 3:22:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [varchar](10) NOT NULL,
	[CategoryName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14/06/2024 3:22:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[CusID] [varchar](10) NULL,
	[ProID] [varchar](10) NULL,
	[Quantity] [int] NOT NULL,
	[OrderDate] [date] NULL,
	[PaymentMethod] [varchar](20) NULL,
	[ShipDestination] [varchar](100) NULL,
	[Note] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAID]    Script Date: 14/06/2024 3:22:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAID](
	[OrderID] [int] NOT NULL,
	[CusID] [varchar](10) NULL,
	[ProID] [varchar](10) NULL,
	[PaymentMethod] [varchar](20) NULL,
	[Payment] [decimal](10, 2) NOT NULL,
	[ShipDestination] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14/06/2024 3:22:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProID] [varchar](10) NOT NULL,
	[ProName] [varchar](255) NOT NULL,
	[Picture] [varchar](255) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Designers] [varchar](255) NULL,
	[LongDes] [text] NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[CategoryID] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'ADM021', N'Lisa Gonzalez', N'ADM021')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'ADM022', N'Andrew Campbell', N'ADM022')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'ADM023', N'Christopher Young', N'ADM023')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'ADM024', N'Patricia King', N'ADM024')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'ADM025', N'Kimberly Lopez', N'ADM025')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS01', N'Lisa Gonzalez', N'CUS01')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS010', N'Edward Wright', N'CUS010')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS011', N'Debra Adams', N'CUS011')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS012', N'Jennifer Green', N'CUS012')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS013', N'Ruth Turner', N'CUS013')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS014', N'Karen Nelson', N'CUS014')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS015', N'Amy Perez', N'CUS015')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS016', N'Richard Scott', N'CUS016')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS017', N'Kimberly Lopez', N'CUS017')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS018', N'Brian Roberts', N'CUS018')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS019', N'Daniel Baker', N'CUS019')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS02', N'Mark Mitchell', N'CUS02')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS020', N'Andrew Campbell', N'CUS020')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS026', N'Christopher Young', N'CUS026')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS027', N'Richard Scott', N'CUS027')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS028', N'Edward Wright', N'CUS028')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS029', N'Andrew Campbell', N'CUS029')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS03', N'Kevin Carter', N'CUS03')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS030', N'Kimberly Lopez', N'CUS030')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS031', N'Brian Roberts', N'CUS031')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS032', N'Ruth Turner', N'CUS032')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS033', N'Retro Retreat', N'CUS033')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS034', N'Amy Perez', N'CUS034')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS035', N'Sharon Hill', N'CUS035')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS036', N'Daniel Baker', N'CUS036')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS037', N'Lisa Gonzalez', N'CUS037')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS038', N'Jennifer Green', N'CUS038')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS039', N'Joshua Hall', N'CUS039')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS04', N'Steven Carter', N'CUS04')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS040', N'Steven Carter', N'CUS040')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS041', N'Mark Mitchell', N'CUS041')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS042', N'Laura Kelly', N'CUS042')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS043', N'Debra Adams', N'CUS043')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS044', N'Kevin Carter', N'CUS044')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS045', N'Karen Nelson', N'CUS045')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS05', N'Patricia King', N'CUS05')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS06', N'Christopher Young', N'CUS06')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS07', N'Sharon Hill', N'CUS07')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS08', N'Joshua Hall', N'CUS08')
GO
INSERT [dbo].[Account] ([UserID], [UserName], [Password]) VALUES (N'CUS09', N'Laura Kelly', N'CUS09')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS01', N'Contemporary Casuals', N'1355 S Hines Blvd', N'Gainesville', N'FL')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS010', N'Seminole Interiors', N'2400 Rocky Point Dr.', N'Seminole', N'FL')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS011', N'American Euro Lifestyles', N'2424 Missouri Ave N.', N'Prospect Park', N'NJ')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS012', N'Battle Creek Furniture', N'345 Capitol Ave. SW', N'Battle Creek', N'MI')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS013', N'Heritage Furnishings', N'66789 College Ave.', N'Carlisle', N'PA')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS014', N'Kaneohe Homes', N'112 Kiowai St.', N'Kaneohe', N'HI')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS015', N'Mountain Scenes', N'4132 Main Street', N'Ogden', N'UT')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS016', N'Value Furniture', N'15145 S.W. 17th St.', N'Plano', N'TX')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS017', N'Home Furnishings', N'1900 Allard Ave.', N'Albany', N'NY')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS018', N'Eastern Furniture', N'1925 Beltline Rd.', N'Carteret', N'NJ')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS019', N'Everett Frost', N'5585 Westcott Ct.', N'Sacramento', N'CA')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS02', N'Furniture Gallery', N'325 Flatiron Dr.', N'Boulder', N'CO')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS020', N'Period Furniture', N'394 Rainbow Dr.', N'Seattle', N'WA')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS026', N'California Classics', N'816 Peach Rd.', N'Santa Clara', N'CA')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS027', N'M and H Casual Furniture', N'3709 First Street', N'Clearwater', N'FL')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS028', N'Mountain Furniture', N'1234 Oak Street', N'San Francisco', N'CA')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS029', N'Stylish Interiors', N'5678 Maple Avenue', N'New York', N'NY')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS03', N'Coastal Living', N'910 Beach Road', N'Miami', N'FL')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS030', N'Urban Designs', N'2468 Elm Street', N'Los Angeles', N'CA')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS031', N'Vintage Vibes', N'369 Pine Street', N'Chicago', N'IL')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS032', N'Modern Living', N'101 Main Street', N'Seattle', N'WA')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS033', N'Retro Retreat', N'753 Vine Avenue', N'Denver', N'CO')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS034', N'Elegant Estates', N'888 Birch Boulevard', N'Atlanta', N'GA')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS035', N'Classic Comforts', N'202 Cedar Lane', N'Dallas', N'TX')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS036', N'Chic Dwellings', N'444 Pinecrest Drive', N'Boston', N'MA')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS037', N'Luxury Living', N'676 Maplewood Court', N'Portland', N'OR')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS038', N'Country Charm', N'999 Oakwood Avenue', N'Detroit', N'MI')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS039', N'Eclectic Emporium', N'111 Elmwood Drive', N'San Diego', N'CA')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS04', N'Artistic Abodes', N'9876 Walnut Street', N'Philadelphia', N'PA')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS040', N'Traditional Treasures', N'555 Cedar Lane', N'Houston', N'TX')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS041', N'Industrial Interiors', N'777 Pine Street', N'Phoenix', N'AZ')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS042', N'Global Goods', N'888 Maple Avenue', N'Minneapolis', N'MN')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS043', N'Bohemian Bliss', N'999 Birch Boulevard', N'Las Vegas', N'NV')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS044', N'Natural Nooks', N'123 Oakwood Avenue', N'San Antonio', N'TX')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS045', N'Sustainable Styles', N'456 Elmwood Drive', N'Milwaukee', N'WI')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS05', N'Modern Meets Rustic', N'789 Pinecrest Drive', N'Charlotte', N'NC')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS06', N'Tranquil Spaces', N'1010 Maplewood Court', N'Cincinnati', N'OH')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS07', N'Cozy Corners', N'1212 Oakwood Avenue', N'Orlando', N'FL')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS08', N'Sleek Settings', N'1313 Elmwood Drive', N'St. Louis', N'MO')
GO
INSERT [dbo].[AccountDetails] ([UserID], [UserName], [CusAdd], [CusCity], [CusState]) VALUES (N'CUS09', N'Vintage Visions', N'1414 Pinecrest Drive', N'Tampa', N'FL')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (N'CHA', N'Chairs')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (N'DCO', N'Decorations')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (N'DES', N'Desks')
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1000, N'CUS02', N'DES1', 10, CAST(N'2020-11-16' AS Date), N'Bank transfer', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1001, N'CUS038', N'CHA5', 9, CAST(N'2020-05-29' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1002, N'CUS07', N'DCO6', 8, CAST(N'2020-04-18' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1003, N'CUS033', N'CHA7', 9, CAST(N'2020-02-14' AS Date), N'Bank transfer', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1004, N'CUS018', N'CHA9', 4, CAST(N'2020-11-22' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1005, N'CUS027', N'CHA7', 9, CAST(N'2020-01-24' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1006, N'CUS031', N'DCO5', 10, CAST(N'2020-06-13' AS Date), N'Bank transfer', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1007, N'CUS02', N'CHA7', 9, CAST(N'2020-12-15' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1008, N'CUS02', N'CHA9', 5, CAST(N'2020-05-26' AS Date), N'Bank transfer', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1009, N'CUS06', N'DES2', 7, CAST(N'2020-11-11' AS Date), N'Cash', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1010, N'CUS040', N'DCO5', 5, CAST(N'2020-09-15' AS Date), N'Cash', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1011, N'CUS034', N'DES1', 1, CAST(N'2020-05-24' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1012, N'CUS034', N'CHA7', 3, CAST(N'2020-09-17' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1014, N'CUS038', N'CHA6', 4, CAST(N'2020-08-12' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1015, N'CUS019', N'DES2', 4, CAST(N'2020-04-22' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1016, N'CUS014', N'CHA8', 6, CAST(N'2020-02-29' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1017, N'CUS03', N'CHA9', 10, CAST(N'2020-05-01' AS Date), N'Bank transfer', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1018, N'CUS04', N'CHA2', 8, CAST(N'2020-06-09' AS Date), N'Bank transfer', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1019, N'CUS01', N'CHA6', 8, CAST(N'2020-06-12' AS Date), N'Cash', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1020, N'CUS044', N'DCO7', 4, CAST(N'2020-10-23' AS Date), N'Bank transfer', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1021, N'CUS06', N'DES6', 20, CAST(N'2020-03-22' AS Date), N'Bank transfer', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1022, N'CUS017', N'DCO3', 2, CAST(N'2020-08-01' AS Date), N'Bank transfer', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1023, N'CUS01', N'DCO6', 9, CAST(N'2020-07-09' AS Date), N'Cash', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1024, N'CUS026', N'DCO1', 7, CAST(N'2020-07-11' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1025, N'CUS031', N'DCO1', 8, CAST(N'2020-08-11' AS Date), N'Bank transfer', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1026, N'CUS020', N'CHA9', 1, CAST(N'2020-03-23' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1027, N'CUS020', N'CHA9', 9, CAST(N'2020-09-10' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1028, N'CUS010', N'CHA2', 6, CAST(N'2020-12-13' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1029, N'CUS03', N'CHA9', 6, CAST(N'2020-01-05' AS Date), N'Bank transfer', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1030, N'CUS042', N'DCO7', 1, CAST(N'2020-06-02' AS Date), N'Bank transfer', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1031, N'CUS037', N'DCO4', 8, CAST(N'2020-05-23' AS Date), N'Cash', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1032, N'CUS016', N'CHA5', 1, CAST(N'2020-09-28' AS Date), N'Bank transfer', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1033, N'CUS045', N'CHA7', 10, CAST(N'2020-09-23' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1034, N'CUS032', N'CHA5', 7, CAST(N'2020-04-17' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1035, N'CUS019', N'DCO5', 2, CAST(N'2020-06-18' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1036, N'CUS016', N'DCO3', 4, CAST(N'2020-03-04' AS Date), N'Cash', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1038, N'CUS07', N'DCO7', 14, CAST(N'2020-07-22' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1039, N'CUS031', N'DCO1', 10, CAST(N'2020-07-08' AS Date), N'Cash', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1040, N'CUS010', N'DES2', 4, CAST(N'2020-03-12' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1041, N'CUS06', N'CHA9', 3, CAST(N'2020-08-05' AS Date), N'Bank transfer', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1042, N'CUS027', N'DES4', 6, CAST(N'2020-12-05' AS Date), N'Bank transfer', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1043, N'CUS07', N'CHA5', 10, CAST(N'2020-06-13' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1044, N'CUS06', N'CHA3', 8, CAST(N'2020-11-06' AS Date), N'Bank transfer', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1045, N'CUS045', N'DCO3', 7, CAST(N'2020-08-08' AS Date), N'Bank transfer', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1046, N'CUS030', N'CHA2', 7, CAST(N'2020-03-01' AS Date), N'Cash', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1047, N'CUS042', N'DES1', 9, CAST(N'2020-09-21' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1048, N'CUS018', N'CHA5', 8, CAST(N'2020-05-22' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1049, N'CUS09', N'DCO5', 9, CAST(N'2020-11-26' AS Date), N'Bank transfer', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1050, N'CUS03', N'DCO5', 2, CAST(N'2020-09-22' AS Date), N'Bank transfer', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1051, N'CUS029', N'DCO4', 2, CAST(N'2020-01-15' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1052, N'CUS05', N'DCO5', 6, CAST(N'2020-12-30' AS Date), N'Cash', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1053, N'CUS02', N'DES4', 2, CAST(N'2020-01-26' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1054, N'CUS036', N'CHA9', 5, CAST(N'2020-06-15' AS Date), N'Bank transfer', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1056, N'CUS018', N'DES5', 1, CAST(N'2020-08-19' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1057, N'CUS05', N'DES3', 8, CAST(N'2020-01-15' AS Date), N'Bank transfer', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1058, N'CUS036', N'CHA7', 4, CAST(N'2020-05-03' AS Date), N'Bank transfer', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1059, N'CUS017', N'DCO5', 10, CAST(N'2020-10-15' AS Date), N'Cash', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1060, N'CUS037', N'DCO5', 5, CAST(N'2020-11-12' AS Date), N'Cash', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1061, N'CUS028', N'DES4', 1, CAST(N'2020-05-25' AS Date), N'Bank transfer', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1062, N'CUS018', N'DCO5', 8, CAST(N'2020-10-19' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1063, N'CUS034', N'CHA9', 10, CAST(N'2020-08-04' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1064, N'CUS06', N'DCO2', 10, CAST(N'2020-01-15' AS Date), N'Cash', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1066, N'CUS010', N'DCO1', 2, CAST(N'2020-05-21' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1067, N'CUS014', N'CHA7', 8, CAST(N'2020-04-19' AS Date), N'Cash', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1068, N'CUS09', N'DES3', 9, CAST(N'2020-03-05' AS Date), N'Bank transfer', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1070, N'CUS029', N'CHA6', 7, CAST(N'2020-08-03' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1072, N'CUS01', N'DES3', 6, CAST(N'2020-10-17' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1073, N'CUS019', N'DCO6', 4, CAST(N'2020-03-12' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1074, N'CUS030', N'DCO5', 3, CAST(N'2020-08-24' AS Date), N'Bank transfer', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1075, N'CUS016', N'DCO1', 2, CAST(N'2020-02-29' AS Date), N'Cash', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1076, N'CUS035', N'DES1', 7, CAST(N'2020-06-09' AS Date), N'Bank transfer', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1077, N'CUS05', N'DCO6', 1, CAST(N'2020-01-13' AS Date), N'Cash', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1078, N'CUS031', N'DES3', 18, CAST(N'2020-05-15' AS Date), N'Cash', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1079, N'CUS032', N'CHA8', 5, CAST(N'2020-03-01' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1080, NULL, N'DCO2', 5, CAST(N'2010-10-30' AS Date), N'Cash', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1081, N'CUS044', N'DES5', 2, CAST(N'2020-05-31' AS Date), N'Cash', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1082, N'CUS018', N'CHA3', 5, CAST(N'2020-09-05' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1083, N'CUS015', N'DCO2', 9, CAST(N'2020-10-09' AS Date), N'Bank transfer', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1084, N'CUS09', N'CHA5', 10, CAST(N'2020-01-25' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1085, N'CUS045', N'DCO6', 9, CAST(N'2020-05-23' AS Date), N'Bank transfer', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1086, N'CUS033', N'DES3', 10, CAST(N'2020-06-28' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1087, N'CUS016', N'CHA3', 7, CAST(N'2020-05-02' AS Date), N'Cash', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1089, N'CUS034', N'DES1', 6, CAST(N'2020-09-02' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1091, N'CUS019', N'DCO2', 1, CAST(N'2020-04-23' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1092, N'CUS032', N'CHA5', 8, CAST(N'2020-08-01' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1093, N'CUS020', N'DES3', 4, CAST(N'2020-09-01' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1094, N'CUS034', N'DES6', 7, CAST(N'2020-12-29' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1095, N'CUS042', N'CHA7', 6, CAST(N'2020-10-27' AS Date), N'Bank transfer', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1096, N'CUS027', N'CHA8', 9, CAST(N'2020-05-03' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1097, N'CUS012', N'DCO2', 4, CAST(N'2020-11-07' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1098, N'CUS040', N'CHA6', 5, CAST(N'2020-03-07' AS Date), N'Bank transfer', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1099, N'CUS042', N'DCO1', 10, CAST(N'2020-11-21' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1100, N'CUS011', N'DES3', 9, CAST(N'2020-04-26' AS Date), N'Bank transfer', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1101, N'CUS019', N'DES1', 6, CAST(N'2020-03-01' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1102, N'CUS031', N'CHA5', 9, CAST(N'2020-05-03' AS Date), N'Cash', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1103, N'CUS018', N'CHA3', 1, CAST(N'2020-03-12' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1104, N'CUS015', N'DES5', 6, CAST(N'2020-05-14' AS Date), N'Bank transfer', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1105, N'CUS043', N'DES5', 2, CAST(N'2020-06-02' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1106, N'CUS018', N'CHA9', 5, CAST(N'2020-09-01' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1107, N'CUS042', N'DCO1', 1, CAST(N'2020-02-17' AS Date), N'Bank transfer', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1108, N'CUS02', N'DCO7', 8, CAST(N'2020-03-18' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1109, N'CUS026', N'DCO7', 8, CAST(N'2020-11-30' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1110, N'CUS015', N'DES1', 5, CAST(N'2020-07-21' AS Date), N'Cash', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1111, N'CUS020', N'DCO1', 7, CAST(N'2020-05-04' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1112, N'CUS029', N'CHA6', 9, CAST(N'2020-02-03' AS Date), N'Bank transfer', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1113, N'CUS019', N'DES6', 9, CAST(N'2020-06-26' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1115, N'CUS037', N'CHA7', 5, CAST(N'2020-11-27' AS Date), N'Bank transfer', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1116, N'CUS041', N'CHA7', 8, CAST(N'2020-06-26' AS Date), N'Cash', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1117, N'CUS026', N'DCO5', 1, CAST(N'2020-06-30' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1118, N'CUS014', N'DCO3', 7, CAST(N'2020-04-03' AS Date), N'Cash', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1119, N'CUS011', N'DCO1', 7, CAST(N'2020-05-09' AS Date), N'Bank transfer', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1120, N'CUS026', N'DCO4', 10, CAST(N'2020-09-03' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1121, N'CUS016', N'DCO1', 5, CAST(N'2020-01-12' AS Date), N'Bank transfer', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1122, N'CUS037', N'DCO6', 10, CAST(N'2020-10-13' AS Date), N'Bank transfer', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1123, N'CUS033', N'CHA6', 3, CAST(N'2020-03-17' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1124, N'CUS09', N'CHA8', 7, CAST(N'2020-12-08' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1125, N'CUS012', N'DCO6', 1, CAST(N'2020-04-24' AS Date), N'Bank transfer', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1126, N'CUS029', N'DCO7', 4, CAST(N'2020-11-12' AS Date), N'Bank transfer', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1127, N'CUS036', N'DCO5', 2, CAST(N'2020-02-17' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1129, N'CUS06', N'DCO2', 6, CAST(N'2020-06-12' AS Date), N'Cash', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1130, N'CUS039', N'CHA2', 2, CAST(N'2020-06-09' AS Date), N'Cash', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1131, N'CUS010', N'CHA6', 5, CAST(N'2020-04-16' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1132, N'CUS010', N'DCO4', 4, CAST(N'2020-11-17' AS Date), N'Cash', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1133, N'CUS035', N'DCO7', 9, CAST(N'2020-09-29' AS Date), N'Bank transfer', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1134, N'CUS038', N'DCO4', 6, CAST(N'2020-06-17' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1135, N'CUS011', N'DES6', 3, CAST(N'2020-01-24' AS Date), N'Bank transfer', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1136, N'CUS09', N'DCO7', 3, CAST(N'2020-07-17' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1137, N'CUS01', N'DES5', 4, CAST(N'2020-05-19' AS Date), N'Cash', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1138, N'CUS040', N'CHA5', 5, CAST(N'2020-02-06' AS Date), N'Cash', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1139, N'CUS036', N'CHA7', 3, CAST(N'2020-06-18' AS Date), N'Bank transfer', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1140, N'CUS029', N'DES5', 9, CAST(N'2020-07-12' AS Date), N'Bank transfer', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1141, N'CUS016', N'DES4', 5, CAST(N'2020-08-17' AS Date), N'Bank transfer', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1142, N'CUS045', N'DES5', 9, CAST(N'2020-09-03' AS Date), N'Bank transfer', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1143, N'CUS019', N'DES4', 3, CAST(N'2020-08-12' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1144, N'CUS028', N'CHA9', 1, CAST(N'2020-04-16' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1145, N'CUS042', N'DES4', 1, CAST(N'2020-01-29' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1146, N'CUS028', N'DES6', 10, CAST(N'2020-05-30' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1147, N'CUS04', N'DCO6', 10, CAST(N'2020-07-29' AS Date), N'Cash', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1148, N'CUS028', N'DES2', 2, CAST(N'2020-12-12' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1149, N'CUS03', N'CHA2', 9, CAST(N'2020-01-23' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1150, N'CUS045', N'CHA8', 6, CAST(N'2020-11-02' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1151, N'CUS019', N'DCO2', 12, CAST(N'2020-08-31' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1152, N'CUS043', N'CHA8', 12, CAST(N'2020-01-19' AS Date), N'Cash', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1153, N'CUS02', N'CHA9', 6, CAST(N'2020-02-08' AS Date), N'Bank transfer', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1154, N'CUS043', N'CHA5', 7, CAST(N'2020-06-24' AS Date), N'Cash', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1155, N'CUS019', N'DCO1', 8, CAST(N'2020-12-08' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1156, N'CUS038', N'CHA8', 7, CAST(N'2020-06-10' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1158, N'CUS044', N'CHA3', 1, CAST(N'2020-05-20' AS Date), N'Bank transfer', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1159, N'CUS040', N'DCO2', 4, CAST(N'2020-04-23' AS Date), N'Cash', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1160, N'CUS06', N'DCO6', 5, CAST(N'2020-07-16' AS Date), N'Cash', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1161, N'CUS09', N'DCO7', 10, CAST(N'2020-02-19' AS Date), N'Bank transfer', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1162, N'CUS037', N'DCO6', 8, CAST(N'2020-08-06' AS Date), N'Cash', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1164, N'CUS014', N'DCO1', 7, CAST(N'2020-05-07' AS Date), N'Cash', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1165, N'CUS05', N'DCO5', 8, CAST(N'2020-04-29' AS Date), N'Cash', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1166, N'CUS038', N'DES1', 5, CAST(N'2020-03-14' AS Date), N'Cash', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1167, N'CUS026', N'DCO4', 4, CAST(N'2020-09-21' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1168, N'CUS014', N'DES5', 9, CAST(N'2020-10-21' AS Date), N'Cash', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1169, N'CUS035', N'DES1', 9, CAST(N'2020-06-15' AS Date), N'Cash', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1170, N'CUS029', N'DCO7', 1, CAST(N'2020-11-13' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1171, N'CUS020', N'DCO4', 10, CAST(N'2020-04-27' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1172, N'CUS031', N'CHA2', 7, CAST(N'2020-12-06' AS Date), N'Bank transfer', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1174, N'CUS05', N'DES2', 10, CAST(N'2020-12-22' AS Date), N'Cash', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1175, N'CUS027', N'DES1', 1, CAST(N'2020-02-29' AS Date), N'Bank transfer', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1176, N'CUS032', N'DCO3', 10, CAST(N'2020-01-12' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1177, N'CUS038', N'CHA7', 7, CAST(N'2020-04-01' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1178, N'CUS09', N'DES5', 1, CAST(N'2020-08-09' AS Date), N'Bank transfer', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1179, N'CUS042', N'CHA6', 3, CAST(N'2020-09-20' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1180, N'CUS01', N'DES2', 2, CAST(N'2020-02-20' AS Date), N'Cash', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1181, N'CUS015', N'CHA5', 3, CAST(N'2020-10-04' AS Date), N'Cash', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1182, N'CUS012', N'DES3', 5, CAST(N'2020-03-10' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1183, N'CUS013', N'DES2', 6, CAST(N'2020-08-25' AS Date), N'Bank transfer', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1184, N'CUS01', N'DCO4', 1, CAST(N'2020-08-20' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1185, N'CUS01', N'DCO2', 10, CAST(N'2020-08-30' AS Date), N'Cash', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1186, N'CUS036', N'CHA2', 4, CAST(N'2020-06-09' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1187, N'CUS036', N'DCO4', 1, CAST(N'2020-08-24' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1188, N'CUS032', N'DCO6', 7, CAST(N'2020-03-12' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1189, N'CUS01', N'DCO2', 8, CAST(N'2020-12-22' AS Date), N'Cash', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1190, N'CUS036', N'CHA6', 4, CAST(N'2020-11-04' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1191, N'CUS012', N'DES3', 5, CAST(N'2020-04-19' AS Date), N'Bank transfer', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1192, N'CUS028', N'DES1', 7, CAST(N'2020-06-25' AS Date), N'Bank transfer', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1193, N'CUS012', N'CHA2', 9, CAST(N'2020-07-09' AS Date), N'Bank transfer', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1194, N'CUS018', N'DES1', 10, CAST(N'2020-09-18' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1195, N'CUS033', N'CHA2', 10, CAST(N'2020-07-09' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1196, N'CUS031', N'CHA9', 10, CAST(N'2020-07-21' AS Date), N'Bank transfer', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1197, N'CUS040', N'CHA6', 5, CAST(N'2020-03-22' AS Date), N'Bank transfer', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1198, N'CUS010', N'DCO4', 5, CAST(N'2020-10-06' AS Date), N'Cash', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1199, N'CUS09', N'CHA5', 7, CAST(N'2020-07-03' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1200, N'CUS029', N'DES3', 1, CAST(N'2020-03-19' AS Date), N'Bank transfer', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1201, N'CUS07', N'DES4', 6, CAST(N'2020-02-29' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1202, N'CUS040', N'DCO6', 9, CAST(N'2020-05-31' AS Date), N'Bank transfer', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1203, N'CUS038', N'CHA3', 8, CAST(N'2020-08-30' AS Date), N'Cash', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1205, N'CUS034', N'DES6', 5, CAST(N'2020-05-26' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1206, N'CUS038', N'DES3', 4, CAST(N'2020-03-11' AS Date), N'Cash', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1207, N'CUS018', N'DES1', 2, CAST(N'2020-05-27' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1209, N'CUS010', N'DES3', 8, CAST(N'2020-03-20' AS Date), N'Cash', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1210, N'CUS027', N'DES4', 6, CAST(N'2020-04-29' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1211, N'CUS06', N'DES5', 4, CAST(N'2020-09-22' AS Date), N'Cash', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1212, N'CUS03', N'DCO3', 5, CAST(N'2020-10-24' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1213, N'CUS033', N'CHA7', 5, CAST(N'2020-09-17' AS Date), N'Bank transfer', N'753 Vine Avenue,Denver,CO', N'')
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1214, N'CUS01', N'CHA8', 17, CAST(N'2020-09-20' AS Date), N'Cash', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1215, N'CUS016', N'CHA8', 2, CAST(N'2020-05-27' AS Date), N'Bank transfer', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1216, N'CUS043', N'DCO2', 4, CAST(N'2020-08-05' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1217, N'CUS026', N'CHA5', 3, CAST(N'2020-11-26' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1218, N'CUS018', N'DCO7', 1, CAST(N'2020-03-06' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1219, N'CUS019', N'CHA3', 9, CAST(N'2020-04-02' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1221, N'CUS039', N'DES5', 5, CAST(N'2020-11-15' AS Date), N'Cash', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1222, N'CUS030', N'DCO7', 2, CAST(N'2020-04-16' AS Date), N'Cash', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1224, N'CUS040', N'CHA2', 10, CAST(N'2020-11-03' AS Date), N'Bank transfer', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1225, N'CUS010', N'CHA6', 10, CAST(N'2020-03-03' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1226, N'CUS04', N'DES1', 2, CAST(N'2020-10-20' AS Date), N'Cash', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1227, N'CUS012', N'DES4', 5, CAST(N'2020-11-19' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1228, N'CUS016', N'CHA3', 7, CAST(N'2020-02-17' AS Date), N'Cash', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1230, N'CUS010', N'DCO7', 4, CAST(N'2020-05-04' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1231, N'CUS032', N'CHA9', 4, CAST(N'2020-03-06' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1232, N'CUS06', N'DES4', 5, CAST(N'2020-03-29' AS Date), N'Bank transfer', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1233, N'CUS01', N'DCO6', 9, CAST(N'2020-03-17' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1234, N'CUS033', N'DCO2', 6, CAST(N'2020-04-01' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1235, N'CUS032', N'CHA5', 1, CAST(N'2020-11-23' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1236, N'CUS018', N'DCO5', 10, CAST(N'2020-04-19' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1237, N'CUS030', N'CHA6', 2, CAST(N'2020-10-27' AS Date), N'Cash', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1238, N'CUS028', N'DES2', 4, CAST(N'2020-09-19' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1239, N'CUS05', N'DCO5', 1, CAST(N'2020-09-22' AS Date), N'Bank transfer', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1241, N'CUS017', N'DCO4', 5, CAST(N'2020-07-12' AS Date), N'Bank transfer', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1242, N'CUS012', N'CHA9', 3, CAST(N'2020-05-14' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1243, N'CUS045', N'CHA6', 3, CAST(N'2020-05-26' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1245, N'CUS05', N'DCO3', 5, CAST(N'2020-07-27' AS Date), N'Cash', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1247, N'CUS031', N'DCO2', 3, CAST(N'2020-01-30' AS Date), N'Cash', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1248, N'CUS043', N'DES2', 4, CAST(N'2020-09-11' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1249, N'CUS015', N'DES1', 6, CAST(N'2020-08-03' AS Date), N'Bank transfer', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1250, N'CUS04', N'DCO3', 9, CAST(N'2020-02-13' AS Date), N'Cash', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1251, N'CUS029', N'DCO3', 10, CAST(N'2020-12-06' AS Date), N'Bank transfer', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1252, N'CUS02', N'DES5', 7, CAST(N'2020-06-08' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1253, N'CUS030', N'DCO1', 10, CAST(N'2020-12-06' AS Date), N'Bank transfer', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1254, N'CUS032', N'DCO3', 4, CAST(N'2020-11-30' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1255, N'CUS03', N'DES4', 6, CAST(N'2020-04-25' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1256, N'CUS018', N'DCO1', 1, CAST(N'2020-12-16' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1257, N'CUS044', N'CHA8', 5, CAST(N'2020-07-27' AS Date), N'Bank transfer', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1258, N'CUS014', N'DCO5', 2, CAST(N'2020-04-12' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1259, N'CUS026', N'DES5', 2, CAST(N'2020-12-28' AS Date), N'Cash', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1260, N'CUS039', N'DCO6', 6, CAST(N'2020-07-14' AS Date), N'Cash', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1261, N'CUS027', N'DCO2', 6, CAST(N'2020-07-17' AS Date), N'Bank transfer', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1262, N'CUS042', N'DCO6', 7, CAST(N'2020-08-27' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1264, N'CUS01', N'DCO7', 6, CAST(N'2020-08-17' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1266, N'CUS033', N'DCO4', 8, CAST(N'2020-07-27' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1267, N'CUS035', N'DES4', 8, CAST(N'2020-03-03' AS Date), N'Bank transfer', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1268, N'CUS036', N'CHA6', 8, CAST(N'2020-04-23' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1269, N'CUS027', N'DES2', 9, CAST(N'2020-04-27' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1271, N'CUS033', N'DES3', 5, CAST(N'2020-12-21' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1272, N'CUS039', N'DES5', 8, CAST(N'2020-12-16' AS Date), N'Cash', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1273, N'CUS017', N'DCO2', 8, CAST(N'2020-10-03' AS Date), N'Bank transfer', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1275, N'CUS03', N'CHA6', 5, CAST(N'2020-08-29' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1277, N'CUS030', N'DES1', 6, CAST(N'2020-04-30' AS Date), N'Cash', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1278, N'CUS014', N'DCO3', 8, CAST(N'2020-01-29' AS Date), N'Cash', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1279, N'CUS034', N'DES5', 6, CAST(N'2020-12-26' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1280, N'CUS03', N'CHA2', 9, CAST(N'2020-06-28' AS Date), N'Bank transfer', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1281, N'CUS037', N'CHA6', 10, CAST(N'2020-10-02' AS Date), N'Cash', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1282, N'CUS012', N'DCO5', 5, CAST(N'2020-08-02' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1283, N'CUS010', N'CHA6', 2, CAST(N'2020-05-09' AS Date), N'Cash', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1284, N'CUS06', N'DCO7', 8, CAST(N'2020-09-16' AS Date), N'Cash', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1285, N'CUS012', N'DES4', 7, CAST(N'2020-03-30' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1286, N'CUS033', N'DES5', 7, CAST(N'2020-05-15' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1287, N'CUS03', N'DCO7', 4, CAST(N'2020-05-24' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1288, N'CUS030', N'DES5', 6, CAST(N'2020-10-04' AS Date), N'Cash', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1289, N'CUS014', N'CHA8', 8, CAST(N'2020-08-18' AS Date), N'Cash', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1290, N'CUS07', N'CHA3', 9, CAST(N'2020-09-05' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1291, N'CUS029', N'CHA8', 7, CAST(N'2020-12-23' AS Date), N'Bank transfer', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1292, N'CUS010', N'DES1', 4, CAST(N'2020-10-05' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1293, N'CUS06', N'DCO7', 2, CAST(N'2020-10-10' AS Date), N'Bank transfer', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1294, N'CUS02', N'DES2', 6, CAST(N'2020-04-24' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1295, N'CUS020', N'CHA9', 9, CAST(N'2020-06-27' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1296, N'CUS014', N'CHA9', 8, CAST(N'2020-12-10' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1297, N'CUS041', N'DCO1', 6, CAST(N'2020-12-08' AS Date), N'Cash', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1298, N'CUS016', N'CHA6', 5, CAST(N'2020-03-12' AS Date), N'Cash', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1299, N'CUS040', N'DCO4', 8, CAST(N'2020-03-14' AS Date), N'Bank transfer', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1300, N'CUS09', N'DCO4', 1, CAST(N'2020-08-08' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1301, N'CUS017', N'DES1', 9, CAST(N'2020-12-01' AS Date), N'Cash', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1302, N'CUS012', N'DES5', 3, CAST(N'2020-10-28' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1303, N'CUS04', N'CHA6', 8, CAST(N'2020-04-25' AS Date), N'Cash', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1304, N'CUS026', N'DCO6', 3, CAST(N'2020-06-12' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1305, N'CUS044', N'CHA6', 1, CAST(N'2020-03-01' AS Date), N'Bank transfer', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1306, N'CUS02', N'DES2', 9, CAST(N'2020-01-20' AS Date), N'Bank transfer', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1307, N'CUS039', N'DES1', 1, CAST(N'2020-07-08' AS Date), N'Bank transfer', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1308, N'CUS040', N'DCO3', 5, CAST(N'2020-05-13' AS Date), N'Bank transfer', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1309, N'CUS043', N'DCO3', 4, CAST(N'2020-04-12' AS Date), N'Cash', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1310, N'CUS019', N'CHA7', 9, CAST(N'2020-09-23' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1311, N'CUS042', N'DCO6', 8, CAST(N'2020-03-15' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1312, N'CUS015', N'CHA2', 6, CAST(N'2020-10-01' AS Date), N'Bank transfer', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1313, N'CUS027', N'CHA9', 8, CAST(N'2020-11-11' AS Date), N'Bank transfer', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1314, N'CUS05', N'CHA5', 3, CAST(N'2020-10-05' AS Date), N'Cash', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1315, N'CUS037', N'CHA9', 5, CAST(N'2020-03-28' AS Date), N'Cash', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1316, N'CUS036', N'DCO4', 2, CAST(N'2020-09-01' AS Date), N'Bank transfer', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1317, N'CUS027', N'CHA9', 8, CAST(N'2020-06-20' AS Date), N'Bank transfer', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1319, N'CUS010', N'DCO6', 6, CAST(N'2020-10-15' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1320, N'CUS026', N'DES4', 6, CAST(N'2020-10-19' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1321, N'CUS01', N'DES1', 8, CAST(N'2020-05-18' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1322, N'CUS02', N'DCO4', 5, CAST(N'2020-07-07' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1323, N'CUS037', N'CHA3', 5, CAST(N'2020-10-03' AS Date), N'Bank transfer', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1326, N'CUS07', N'DCO1', 18, CAST(N'2020-01-07' AS Date), N'Bank transfer', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1327, N'CUS027', N'DES3', 9, CAST(N'2020-11-06' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1328, N'CUS029', N'DCO7', 9, CAST(N'2020-07-21' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1329, N'CUS033', N'DCO2', 2, CAST(N'2020-09-19' AS Date), N'Bank transfer', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1330, N'CUS013', N'DCO5', 6, CAST(N'2020-05-30' AS Date), N'Bank transfer', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1331, N'CUS028', N'CHA9', 9, CAST(N'2020-01-29' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1332, N'CUS01', N'CHA8', 12, CAST(N'2020-03-26' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1333, N'CUS044', N'CHA6', 7, CAST(N'2020-10-05' AS Date), N'Cash', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1334, N'CUS041', N'CHA7', 7, CAST(N'2020-04-14' AS Date), N'Bank transfer', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1335, N'CUS043', N'CHA8', 5, CAST(N'2020-07-29' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1336, N'CUS028', N'DES2', 7, CAST(N'2020-11-12' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1337, N'CUS016', N'DES4', 4, CAST(N'2020-01-31' AS Date), N'Bank transfer', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1339, N'CUS031', N'DCO6', 9, CAST(N'2020-04-08' AS Date), N'Cash', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1341, N'CUS035', N'CHA3', 5, CAST(N'2020-06-18' AS Date), N'Bank transfer', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1342, N'CUS016', N'CHA7', 3, CAST(N'2020-05-11' AS Date), N'Cash', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1345, N'CUS018', N'CHA2', 5, CAST(N'2020-05-02' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1346, N'CUS036', N'DES6', 5, CAST(N'2020-08-18' AS Date), N'Bank transfer', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1347, N'CUS036', N'DES2', 5, CAST(N'2020-06-20' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1348, N'CUS014', N'DCO1', 7, CAST(N'2020-07-21' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1349, N'CUS020', N'CHA7', 6, CAST(N'2020-06-21' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1350, N'CUS07', N'DCO7', 7, CAST(N'2020-05-16' AS Date), N'Bank transfer', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1351, N'CUS031', N'DCO6', 1, CAST(N'2020-12-24' AS Date), N'Bank transfer', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1352, N'CUS031', N'DES3', 2, CAST(N'2020-07-16' AS Date), N'Cash', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1353, N'CUS040', N'CHA3', 10, CAST(N'2020-07-09' AS Date), N'Cash', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1354, N'CUS034', N'DCO5', 8, CAST(N'2020-08-27' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1355, N'CUS033', N'CHA5', 3, CAST(N'2020-07-31' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1356, N'CUS01', N'DES6', 6, CAST(N'2020-02-10' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1357, N'CUS018', N'DCO2', 1, CAST(N'2020-11-13' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1358, N'CUS027', N'DES1', 8, CAST(N'2020-07-30' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1359, N'CUS015', N'DES5', 1, CAST(N'2020-07-30' AS Date), N'Bank transfer', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1360, N'CUS029', N'DES2', 5, CAST(N'2020-01-06' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1361, N'CUS04', N'CHA5', 1, CAST(N'2020-05-20' AS Date), N'Cash', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1362, N'CUS017', N'DES6', 1, CAST(N'2020-08-25' AS Date), N'Cash', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1363, N'CUS042', N'DCO4', 2, CAST(N'2020-04-30' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1364, N'CUS06', N'CHA2', 5, CAST(N'2020-08-22' AS Date), N'Bank transfer', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1365, N'CUS06', N'DCO4', 8, CAST(N'2020-07-07' AS Date), N'Bank transfer', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1366, N'CUS039', N'DCO5', 8, CAST(N'2020-06-04' AS Date), N'Bank transfer', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1367, N'CUS043', N'DCO4', 5, CAST(N'2020-05-05' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1368, N'CUS07', N'CHA3', 3, CAST(N'2020-07-30' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1370, N'CUS019', N'CHA7', 9, CAST(N'2020-10-14' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1371, N'CUS013', N'DCO2', 7, CAST(N'2020-08-14' AS Date), N'Cash', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1372, N'CUS03', N'DES5', 6, CAST(N'2020-09-15' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1373, N'CUS035', N'CHA9', 10, CAST(N'2020-09-23' AS Date), N'Bank transfer', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1374, N'CUS044', N'CHA8', 2, CAST(N'2020-05-20' AS Date), N'Bank transfer', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1375, N'CUS030', N'CHA6', 10, CAST(N'2020-12-15' AS Date), N'Bank transfer', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1376, N'CUS011', N'DES1', 4, CAST(N'2020-05-05' AS Date), N'Bank transfer', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1377, N'CUS03', N'DCO2', 4, CAST(N'2020-05-12' AS Date), N'Bank transfer', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1378, N'CUS04', N'CHA9', 4, CAST(N'2020-06-26' AS Date), N'Bank transfer', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1379, N'CUS011', N'DCO5', 7, CAST(N'2020-11-19' AS Date), N'Bank transfer', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1380, N'CUS034', N'DCO7', 6, CAST(N'2020-09-14' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1381, N'CUS036', N'DES1', 6, CAST(N'2020-12-12' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1382, N'CUS045', N'CHA5', 8, CAST(N'2020-04-17' AS Date), N'Bank transfer', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1383, N'CUS028', N'DCO2', 8, CAST(N'2020-09-29' AS Date), N'Bank transfer', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1384, N'CUS011', N'DCO6', 5, CAST(N'2020-06-27' AS Date), N'Bank transfer', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1385, N'CUS029', N'CHA6', 1, CAST(N'2020-03-08' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1386, N'CUS037', N'DES3', 2, CAST(N'2020-06-08' AS Date), N'Bank transfer', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1387, N'CUS03', N'DES6', 2, CAST(N'2020-12-16' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1388, N'CUS045', N'DCO7', 5, CAST(N'2020-07-13' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1389, N'CUS015', N'DES6', 6, CAST(N'2020-12-14' AS Date), N'Bank transfer', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1390, N'CUS020', N'DCO4', 5, CAST(N'2020-04-09' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1391, N'CUS07', N'DCO4', 7, CAST(N'2020-10-07' AS Date), N'Bank transfer', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1392, N'CUS036', N'CHA2', 10, CAST(N'2020-12-08' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1394, N'CUS036', N'DES4', 5, CAST(N'2020-04-30' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1396, N'CUS028', N'DCO2', 4, CAST(N'2020-08-24' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1397, N'CUS044', N'DCO6', 7, CAST(N'2020-10-04' AS Date), N'Bank transfer', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1400, N'CUS07', N'DCO2', 6, CAST(N'2020-09-16' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1401, N'CUS034', N'DCO6', 5, CAST(N'2020-07-18' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1402, N'CUS032', N'DCO5', 7, CAST(N'2020-03-24' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1405, N'CUS034', N'DCO7', 2, CAST(N'2020-04-18' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1406, N'CUS017', N'CHA3', 5, CAST(N'2020-06-29' AS Date), N'Cash', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1407, N'CUS026', N'DCO5', 6, CAST(N'2020-08-22' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1408, N'CUS019', N'DES2', 3, CAST(N'2020-04-13' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1409, N'CUS03', N'DCO7', 9, CAST(N'2020-02-08' AS Date), N'Bank transfer', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1410, N'CUS039', N'DCO6', 10, CAST(N'2020-08-05' AS Date), N'Cash', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1411, N'CUS018', N'DES2', 2, CAST(N'2020-07-02' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1412, N'CUS028', N'CHA7', 1, CAST(N'2020-08-16' AS Date), N'Bank transfer', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1413, N'CUS015', N'CHA7', 6, CAST(N'2020-11-13' AS Date), N'Bank transfer', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1414, N'CUS014', N'CHA5', 6, CAST(N'2020-12-04' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1415, N'CUS028', N'CHA3', 2, CAST(N'2020-02-26' AS Date), N'Bank transfer', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1416, N'CUS036', N'DES2', 4, CAST(N'2020-02-13' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1417, N'CUS029', N'DCO4', 2, CAST(N'2020-10-15' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1418, N'CUS039', N'DCO5', 8, CAST(N'2020-01-17' AS Date), N'Bank transfer', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1419, N'CUS039', N'CHA3', 4, CAST(N'2020-10-23' AS Date), N'Bank transfer', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1420, N'CUS01', N'DES3', 5, CAST(N'2020-01-04' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1421, N'CUS029', N'DES2', 6, CAST(N'2020-04-24' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1422, N'CUS014', N'DES5', 10, CAST(N'2020-06-05' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1423, N'CUS031', N'DES3', 2, CAST(N'2020-04-01' AS Date), N'Bank transfer', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1424, N'CUS030', N'CHA9', 4, CAST(N'2020-08-02' AS Date), N'Bank transfer', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1425, N'CUS027', N'DES2', 10, CAST(N'2020-04-29' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1426, N'CUS019', N'DCO1', 3, CAST(N'2020-11-08' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1427, N'CUS043', N'DCO5', 4, CAST(N'2020-11-22' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1428, N'CUS017', N'DES5', 8, CAST(N'2020-02-06' AS Date), N'Cash', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1429, N'CUS045', N'DCO5', 10, CAST(N'2020-03-13' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1430, N'CUS02', N'CHA2', 2, CAST(N'2020-03-17' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1431, N'CUS09', N'CHA9', 6, CAST(N'2020-09-28' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1433, N'CUS01', N'DCO7', 6, CAST(N'2020-08-15' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1434, N'CUS03', N'CHA9', 2, CAST(N'2020-10-24' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1435, N'CUS09', N'DCO6', 5, CAST(N'2020-12-25' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1436, N'CUS037', N'CHA9', 2, CAST(N'2020-03-31' AS Date), N'Bank transfer', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1438, N'CUS012', N'DES4', 2, CAST(N'2020-08-07' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1439, N'CUS030', N'DES6', 9, CAST(N'2020-12-21' AS Date), N'Cash', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1440, N'CUS012', N'CHA7', 8, CAST(N'2020-01-01' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1441, N'CUS036', N'DCO7', 4, CAST(N'2020-09-08' AS Date), N'Bank transfer', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1442, N'CUS031', N'DCO6', 7, CAST(N'2020-03-02' AS Date), N'Cash', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1444, N'CUS026', N'DCO2', 4, CAST(N'2020-01-15' AS Date), N'Cash', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1446, N'CUS034', N'CHA9', 12, CAST(N'2020-06-13' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1447, N'CUS044', N'DCO1', 7, CAST(N'2020-11-08' AS Date), N'Cash', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1448, N'CUS019', N'CHA5', 8, CAST(N'2020-05-17' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1449, N'CUS014', N'DCO1', 4, CAST(N'2020-01-15' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1450, N'CUS031', N'CHA7', 6, CAST(N'2020-01-18' AS Date), N'Bank transfer', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1451, N'CUS018', N'DCO4', 6, CAST(N'2020-06-19' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1452, N'CUS020', N'DES5', 7, CAST(N'2020-12-26' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1453, N'CUS034', N'DES5', 5, CAST(N'2020-05-16' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1454, N'CUS039', N'CHA8', 3, CAST(N'2020-07-19' AS Date), N'Cash', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1455, N'CUS031', N'DES5', 7, CAST(N'2020-03-02' AS Date), N'Cash', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1456, N'CUS05', N'DCO5', 1, CAST(N'2020-10-18' AS Date), N'Bank transfer', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1457, N'CUS037', N'CHA5', 4, CAST(N'2020-06-30' AS Date), N'Cash', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1458, N'CUS09', N'DCO6', 9, CAST(N'2020-07-23' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1459, N'CUS07', N'DES3', 9, CAST(N'2020-08-22' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1460, N'CUS09', N'CHA5', 4, CAST(N'2020-04-17' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1461, N'CUS019', N'DCO4', 6, CAST(N'2020-04-17' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1462, N'CUS011', N'DCO7', 1, CAST(N'2020-04-28' AS Date), N'Bank transfer', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1463, N'CUS043', N'CHA8', 7, CAST(N'2020-12-15' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1464, N'CUS042', N'DES3', 5, CAST(N'2020-02-22' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1465, N'CUS015', N'CHA6', 3, CAST(N'2020-12-28' AS Date), N'Cash', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1467, N'CUS028', N'DES3', 2, CAST(N'2020-07-13' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1468, N'CUS028', N'CHA8', 8, CAST(N'2020-03-25' AS Date), N'Bank transfer', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1469, N'CUS05', N'DES1', 6, CAST(N'2020-03-24' AS Date), N'Cash', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1470, N'CUS039', N'DCO2', 4, CAST(N'2020-06-18' AS Date), N'Bank transfer', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1471, N'CUS012', N'DES5', 9, CAST(N'2020-07-27' AS Date), N'Bank transfer', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1472, N'CUS032', N'CHA8', 9, CAST(N'2020-11-10' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1473, N'CUS027', N'DCO3', 9, CAST(N'2020-04-18' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1474, N'CUS043', N'DES1', 6, CAST(N'2020-12-30' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1475, N'CUS041', N'DCO3', 1, CAST(N'2020-10-01' AS Date), N'Bank transfer', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1476, N'CUS02', N'CHA3', 7, CAST(N'2020-06-25' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1477, N'CUS017', N'DES3', 1, CAST(N'2020-04-12' AS Date), N'Cash', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1478, N'CUS031', N'DCO4', 6, CAST(N'2020-05-15' AS Date), N'Cash', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1479, N'CUS02', N'DES2', 3, CAST(N'2020-03-31' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1480, N'CUS012', N'DCO5', 1, CAST(N'2020-01-30' AS Date), N'Bank transfer', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1481, N'CUS031', N'CHA3', 6, CAST(N'2020-08-27' AS Date), N'Cash', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1483, N'CUS04', N'CHA9', 2, CAST(N'2020-09-20' AS Date), N'Cash', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1484, N'CUS041', N'CHA3', 15, CAST(N'2020-08-12' AS Date), N'Cash', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1485, N'CUS019', N'DES4', 4, CAST(N'2020-08-23' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1486, N'CUS07', N'CHA8', 8, CAST(N'2020-06-06' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1488, N'CUS016', N'DCO3', 5, CAST(N'2020-11-21' AS Date), N'Cash', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1489, N'CUS040', N'DES4', 10, CAST(N'2020-01-30' AS Date), N'Bank transfer', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1490, N'CUS045', N'CHA7', 8, CAST(N'2020-04-20' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1492, N'CUS02', N'DCO4', 2, CAST(N'2020-02-15' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1493, N'CUS01', N'CHA6', 1, CAST(N'2020-08-21' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1494, N'CUS07', N'DES1', 2, CAST(N'2020-06-15' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1495, N'CUS027', N'DES2', 8, CAST(N'2020-09-26' AS Date), N'Bank transfer', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1496, N'CUS028', N'DES2', 6, CAST(N'2020-04-02' AS Date), N'Bank transfer', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1497, N'CUS01', N'DES2', 2, CAST(N'2020-08-29' AS Date), N'Cash', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1498, N'CUS037', N'CHA3', 1, CAST(N'2020-05-14' AS Date), N'Bank transfer', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1499, N'CUS037', N'CHA2', 7, CAST(N'2020-07-29' AS Date), N'Cash', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1500, N'CUS09', N'CHA8', 9, CAST(N'2020-05-24' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1501, N'CUS042', N'DCO1', 20, CAST(N'2020-12-06' AS Date), N'Bank transfer', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1502, N'CUS038', N'DCO3', 10, CAST(N'2020-08-22' AS Date), N'Cash', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1503, N'CUS045', N'DCO2', 2, CAST(N'2020-10-28' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1504, N'CUS06', N'CHA5', 6, CAST(N'2020-02-16' AS Date), N'Bank transfer', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1505, N'CUS036', N'DES3', 9, CAST(N'2020-06-06' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1506, N'CUS014', N'DES1', 6, CAST(N'2020-07-10' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1507, N'CUS015', N'CHA7', 6, CAST(N'2020-05-13' AS Date), N'Bank transfer', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1508, N'CUS01', N'DES2', 7, CAST(N'2020-02-03' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1510, N'CUS039', N'CHA8', 8, CAST(N'2020-08-02' AS Date), N'Cash', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1511, N'CUS020', N'DES4', 6, CAST(N'2020-09-13' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1512, N'CUS010', N'DCO6', 2, CAST(N'2020-01-26' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1513, N'CUS041', N'CHA3', 2, CAST(N'2020-04-14' AS Date), N'Cash', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1514, N'CUS044', N'DES1', 8, CAST(N'2020-12-10' AS Date), N'Bank transfer', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1515, N'CUS026', N'CHA2', 1, CAST(N'2020-10-02' AS Date), N'Cash', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1516, N'CUS042', N'DES4', 6, CAST(N'2020-05-06' AS Date), N'Bank transfer', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1517, N'CUS040', N'DCO2', 2, CAST(N'2020-09-24' AS Date), N'Cash', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1518, N'CUS039', N'DES1', 2, CAST(N'2020-03-04' AS Date), N'Bank transfer', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1519, N'CUS019', N'DES4', 1, CAST(N'2020-03-12' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1520, N'CUS019', N'DES3', 8, CAST(N'2020-03-27' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1521, N'CUS045', N'CHA8', 7, CAST(N'2020-08-11' AS Date), N'Bank transfer', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1522, N'CUS010', N'DCO1', 10, CAST(N'2020-02-14' AS Date), N'Cash', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1523, N'CUS019', N'CHA9', 6, CAST(N'2020-06-10' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1524, N'CUS045', N'CHA8', 1, CAST(N'2020-05-25' AS Date), N'Bank transfer', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1525, N'CUS031', N'CHA3', 2, CAST(N'2020-11-22' AS Date), N'Cash', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1526, N'CUS017', N'DES6', 8, CAST(N'2020-03-02' AS Date), N'Bank transfer', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1527, N'CUS026', N'CHA3', 8, CAST(N'2020-07-13' AS Date), N'Cash', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1528, N'CUS043', N'DCO5', 9, CAST(N'2020-07-03' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1529, N'CUS018', N'DES2', 10, CAST(N'2020-10-12' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1530, N'CUS030', N'DES1', 1, CAST(N'2020-11-09' AS Date), N'Bank transfer', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1531, N'CUS010', N'CHA8', 9, CAST(N'2020-07-10' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1532, N'CUS028', N'CHA6', 3, CAST(N'2020-06-24' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1533, N'CUS034', N'DCO5', 8, CAST(N'2020-11-19' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1535, N'CUS041', N'DCO7', 9, CAST(N'2020-05-09' AS Date), N'Cash', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1536, N'CUS034', N'CHA7', 6, CAST(N'2020-04-20' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1537, N'CUS06', N'CHA9', 1, CAST(N'2020-09-16' AS Date), N'Bank transfer', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1539, N'CUS06', N'CHA9', 4, CAST(N'2020-10-04' AS Date), N'Cash', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1540, N'CUS028', N'CHA3', 7, CAST(N'2020-09-03' AS Date), N'Bank transfer', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1541, N'CUS012', N'DCO5', 9, CAST(N'2020-02-06' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1542, N'CUS033', N'CHA5', 5, CAST(N'2020-07-24' AS Date), N'Bank transfer', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1543, N'CUS030', N'DES2', 5, CAST(N'2020-04-14' AS Date), N'Bank transfer', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1544, N'CUS020', N'CHA9', 3, CAST(N'2020-08-07' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1545, N'CUS045', N'CHA2', 8, CAST(N'2020-02-01' AS Date), N'Bank transfer', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1546, N'CUS032', N'DCO1', 7, CAST(N'2020-03-17' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1547, N'CUS03', N'DES3', 5, CAST(N'2020-08-13' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1548, N'CUS039', N'DCO4', 9, CAST(N'2020-12-14' AS Date), N'Cash', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1549, N'CUS018', N'DCO1', 6, CAST(N'2020-07-27' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1550, N'CUS011', N'CHA9', 7, CAST(N'2020-07-10' AS Date), N'Cash', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1551, N'CUS028', N'DCO3', 5, CAST(N'2020-05-13' AS Date), N'Bank transfer', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1552, N'CUS016', N'DES2', 10, CAST(N'2020-08-12' AS Date), N'Bank transfer', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1553, N'CUS029', N'DES4', 2, CAST(N'2020-05-02' AS Date), N'Bank transfer', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1554, N'CUS034', N'DCO2', 7, CAST(N'2020-11-30' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1555, N'CUS018', N'DCO1', 5, CAST(N'2020-02-08' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1556, N'CUS011', N'CHA6', 9, CAST(N'2020-07-20' AS Date), N'Cash', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1557, N'CUS037', N'DCO1', 7, CAST(N'2020-06-08' AS Date), N'Bank transfer', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1559, N'CUS042', N'DES3', 8, CAST(N'2020-05-12' AS Date), N'Bank transfer', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1560, N'CUS033', N'DES6', 9, CAST(N'2020-02-20' AS Date), N'Bank transfer', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1561, N'CUS029', N'DCO3', 6, CAST(N'2020-04-25' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1562, N'CUS011', N'DCO3', 7, CAST(N'2020-05-09' AS Date), N'Bank transfer', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1564, N'CUS035', N'DCO3', 7, CAST(N'2020-10-29' AS Date), N'Cash', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1565, N'CUS014', N'DCO3', 1, CAST(N'2020-07-31' AS Date), N'Cash', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1566, N'CUS041', N'DES5', 7, CAST(N'2020-04-11' AS Date), N'Bank transfer', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1567, N'CUS020', N'DES4', 6, CAST(N'2020-05-29' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1568, N'CUS044', N'DES6', 2, CAST(N'2020-12-03' AS Date), N'Cash', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1569, N'CUS05', N'DES5', 8, CAST(N'2020-11-02' AS Date), N'Cash', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1570, N'CUS02', N'CHA5', 10, CAST(N'2020-11-08' AS Date), N'Bank transfer', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1571, N'CUS030', N'DES3', 10, CAST(N'2020-12-03' AS Date), N'Bank transfer', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1573, N'CUS041', N'DES2', 1, CAST(N'2020-12-22' AS Date), N'Bank transfer', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1574, N'CUS018', N'DCO5', 3, CAST(N'2020-10-15' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1575, N'CUS041', N'DES2', 10, CAST(N'2020-02-22' AS Date), N'Cash', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1576, N'CUS016', N'DES6', 9, CAST(N'2020-08-29' AS Date), N'Cash', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1577, N'CUS019', N'DCO6', 8, CAST(N'2020-10-27' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1578, N'CUS020', N'DES6', 10, CAST(N'2020-11-27' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1580, N'CUS037', N'DCO5', 5, CAST(N'2020-08-02' AS Date), N'Cash', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1581, N'CUS036', N'DES4', 7, CAST(N'2020-10-05' AS Date), N'Bank transfer', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1582, N'CUS016', N'DES2', 10, CAST(N'2020-05-15' AS Date), N'Bank transfer', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1583, N'CUS043', N'DCO2', 9, CAST(N'2020-11-22' AS Date), N'Cash', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1584, N'CUS028', N'DCO5', 5, CAST(N'2020-03-31' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1585, N'CUS020', N'DES4', 2, CAST(N'2020-08-17' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1586, N'CUS032', N'DCO1', 7, CAST(N'2020-04-13' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1587, N'CUS013', N'DES4', 8, CAST(N'2020-01-05' AS Date), N'Cash', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1588, N'CUS039', N'DCO4', 2, CAST(N'2020-04-03' AS Date), N'Bank transfer', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1589, N'CUS019', N'DES1', 5, CAST(N'2020-08-17' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1590, N'CUS042', N'CHA6', 10, CAST(N'2020-12-03' AS Date), N'Bank transfer', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1592, N'CUS011', N'DES1', 8, CAST(N'2020-09-16' AS Date), N'Bank transfer', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1593, N'CUS027', N'CHA3', 6, CAST(N'2020-01-23' AS Date), N'Bank transfer', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1595, N'CUS043', N'DES4', 2, CAST(N'2020-02-21' AS Date), N'Cash', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1596, N'CUS02', N'DCO4', 4, CAST(N'2020-11-28' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1597, N'CUS03', N'DCO2', 3, CAST(N'2020-02-13' AS Date), N'Bank transfer', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1598, N'CUS020', N'CHA8', 3, CAST(N'2020-10-17' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1599, N'CUS038', N'DCO1', 1, CAST(N'2020-06-22' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1600, N'CUS030', N'DCO3', 2, CAST(N'2020-11-02' AS Date), N'Bank transfer', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1601, N'CUS017', N'CHA2', 13, CAST(N'2020-04-08' AS Date), N'Cash', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1602, N'CUS045', N'CHA6', 6, CAST(N'2020-08-24' AS Date), N'Bank transfer', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1603, N'CUS028', N'DCO5', 8, CAST(N'2020-02-01' AS Date), N'Bank transfer', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1604, N'CUS029', N'DES3', 4, CAST(N'2020-11-17' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1605, N'CUS032', N'CHA2', 3, CAST(N'2020-11-09' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1606, N'CUS038', N'DES5', 11, CAST(N'2020-10-23' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1607, N'CUS036', N'DCO7', 9, CAST(N'2020-07-17' AS Date), N'Bank transfer', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1608, N'CUS01', N'DCO6', 8, CAST(N'2020-01-04' AS Date), N'Cash', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1609, N'CUS032', N'DCO3', 5, CAST(N'2020-08-16' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1610, N'CUS037', N'CHA7', 8, CAST(N'2020-05-07' AS Date), N'Cash', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1611, N'CUS02', N'DCO6', 4, CAST(N'2020-10-06' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1612, N'CUS045', N'DCO3', 7, CAST(N'2020-11-26' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1613, N'CUS010', N'DES2', 1, CAST(N'2020-01-14' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1614, N'CUS029', N'CHA5', 6, CAST(N'2020-12-02' AS Date), N'Bank transfer', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1615, N'CUS018', N'DES5', 9, CAST(N'2020-09-20' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1617, N'CUS041', N'CHA8', 3, CAST(N'2020-12-26' AS Date), N'Bank transfer', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1618, N'CUS01', N'CHA5', 10, CAST(N'2020-04-06' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1619, N'CUS027', N'DCO1', 9, CAST(N'2020-07-18' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1621, N'CUS042', N'CHA8', 4, CAST(N'2020-10-27' AS Date), N'Bank transfer', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1622, N'CUS07', N'DES2', 8, CAST(N'2020-07-21' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1623, N'CUS039', N'CHA6', 10, CAST(N'2020-04-08' AS Date), N'Bank transfer', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1624, N'CUS036', N'CHA7', 7, CAST(N'2020-07-29' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1625, N'CUS033', N'DES3', 10, CAST(N'2020-01-25' AS Date), N'Bank transfer', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1626, N'CUS037', N'CHA8', 6, CAST(N'2020-07-18' AS Date), N'Bank transfer', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1627, N'CUS011', N'CHA3', 1, CAST(N'2020-10-31' AS Date), N'Bank transfer', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1628, N'CUS015', N'DES5', 1, CAST(N'2020-03-20' AS Date), N'Bank transfer', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1629, N'CUS039', N'DCO7', 9, CAST(N'2020-01-14' AS Date), N'Cash', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1630, N'CUS032', N'DCO4', 1, CAST(N'2020-02-15' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1631, N'CUS035', N'DES1', 10, CAST(N'2020-06-13' AS Date), N'Bank transfer', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1632, N'CUS010', N'CHA7', 9, CAST(N'2020-09-29' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1633, N'CUS013', N'CHA3', 10, CAST(N'2020-12-15' AS Date), N'Bank transfer', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1634, N'CUS027', N'CHA6', 10, CAST(N'2020-12-11' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1635, N'CUS016', N'DCO7', 7, CAST(N'2020-04-16' AS Date), N'Bank transfer', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1636, N'CUS030', N'CHA6', 6, CAST(N'2020-04-26' AS Date), N'Bank transfer', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1637, N'CUS035', N'CHA7', 4, CAST(N'2020-04-03' AS Date), N'Cash', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1638, N'CUS03', N'CHA9', 4, CAST(N'2020-02-16' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1639, N'CUS03', N'DCO7', 1, CAST(N'2020-01-19' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1640, N'CUS034', N'DCO7', 2, CAST(N'2020-06-05' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1641, N'CUS019', N'CHA2', 9, CAST(N'2020-11-06' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1642, N'CUS06', N'DCO7', 2, CAST(N'2020-07-27' AS Date), N'Bank transfer', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1643, N'CUS06', N'CHA8', 8, CAST(N'2020-05-16' AS Date), N'Cash', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1644, N'CUS020', N'DCO4', 10, CAST(N'2020-09-25' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1645, N'CUS01', N'DCO2', 7, CAST(N'2020-11-11' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1646, N'CUS029', N'CHA5', 6, CAST(N'2020-02-29' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1647, N'CUS017', N'DCO5', 9, CAST(N'2020-02-17' AS Date), N'Cash', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1648, N'CUS016', N'CHA9', 6, CAST(N'2020-05-07' AS Date), N'Cash', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1649, N'CUS09', N'DES5', 1, CAST(N'2020-10-27' AS Date), N'Bank transfer', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1650, N'CUS043', N'CHA6', 6, CAST(N'2020-02-22' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1651, N'CUS045', N'DCO4', 7, CAST(N'2020-03-23' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1652, N'CUS09', N'DES4', 5, CAST(N'2020-07-02' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1653, N'CUS045', N'CHA3', 6, CAST(N'2020-10-31' AS Date), N'Bank transfer', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1654, N'CUS016', N'DES1', 6, CAST(N'2020-03-28' AS Date), N'Cash', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1655, N'CUS042', N'DCO5', 7, CAST(N'2020-12-02' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1657, N'CUS027', N'DES4', 5, CAST(N'2020-05-06' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1658, N'CUS016', N'DCO2', 3, CAST(N'2020-10-10' AS Date), N'Cash', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1659, N'CUS03', N'DES1', 10, CAST(N'2020-12-17' AS Date), N'Bank transfer', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1660, N'CUS01', N'CHA9', 6, CAST(N'2020-08-15' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1661, N'CUS030', N'DCO1', 7, CAST(N'2020-02-14' AS Date), N'Cash', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1662, N'CUS038', N'CHA5', 4, CAST(N'2020-08-29' AS Date), N'Cash', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1663, N'CUS041', N'CHA3', 6, CAST(N'2020-07-11' AS Date), N'Bank transfer', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1665, N'CUS05', N'DCO7', 4, CAST(N'2020-09-29' AS Date), N'Bank transfer', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1666, N'CUS034', N'CHA9', 7, CAST(N'2020-11-10' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1667, N'CUS030', N'CHA9', 5, CAST(N'2020-11-11' AS Date), N'Bank transfer', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1668, N'CUS014', N'DCO7', 4, CAST(N'2020-06-22' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1669, N'CUS07', N'DES6', 7, CAST(N'2020-03-01' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1670, N'CUS034', N'CHA2', 4, CAST(N'2020-09-22' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1671, N'CUS03', N'DES3', 2, CAST(N'2020-04-04' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1672, N'CUS038', N'DCO5', 9, CAST(N'2020-11-26' AS Date), N'Cash', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1674, N'CUS030', N'DES6', 8, CAST(N'2020-02-13' AS Date), N'Cash', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1675, N'CUS06', N'DCO1', 8, CAST(N'2020-07-15' AS Date), N'Cash', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1676, N'CUS013', N'DCO5', 4, CAST(N'2020-04-15' AS Date), N'Bank transfer', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1677, N'CUS041', N'DCO6', 7, CAST(N'2020-05-26' AS Date), N'Cash', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1678, N'CUS012', N'CHA5', 4, CAST(N'2020-06-02' AS Date), N'Bank transfer', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1680, N'CUS042', N'DES5', 9, CAST(N'2020-06-02' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1682, N'CUS09', N'DCO7', 4, CAST(N'2020-08-11' AS Date), N'Bank transfer', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1683, N'CUS027', N'CHA6', 6, CAST(N'2020-02-02' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1684, N'CUS020', N'DES4', 5, CAST(N'2020-07-03' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1685, N'CUS02', N'CHA7', 6, CAST(N'2020-03-14' AS Date), N'Bank transfer', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1686, N'CUS026', N'CHA7', 5, CAST(N'2020-04-06' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1687, N'CUS014', N'DCO6', 6, CAST(N'2020-07-02' AS Date), N'Cash', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1688, N'CUS032', N'CHA9', 4, CAST(N'2020-02-13' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1690, N'CUS04', N'DCO4', 5, CAST(N'2020-06-29' AS Date), N'Bank transfer', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1691, N'CUS07', N'DES4', 3, CAST(N'2020-07-28' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1692, N'CUS042', N'CHA8', 3, CAST(N'2020-01-03' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1693, N'CUS011', N'DCO3', 10, CAST(N'2020-12-04' AS Date), N'Cash', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1694, N'CUS011', N'DES6', 7, CAST(N'2020-07-01' AS Date), N'Cash', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1696, N'CUS09', N'DCO7', 3, CAST(N'2020-11-21' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1697, N'CUS034', N'CHA8', 2, CAST(N'2020-04-05' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1698, N'CUS037', N'DES1', 5, CAST(N'2020-10-23' AS Date), N'Bank transfer', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1699, N'CUS012', N'DES1', 4, CAST(N'2020-04-14' AS Date), N'Bank transfer', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1700, N'CUS019', N'CHA9', 2, CAST(N'2020-12-13' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1701, N'CUS032', N'DCO1', 4, CAST(N'2020-12-12' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1702, N'CUS045', N'DCO2', 3, CAST(N'2020-06-05' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1703, N'CUS019', N'CHA7', 8, CAST(N'2020-03-12' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1704, N'CUS040', N'DCO5', 3, CAST(N'2020-06-14' AS Date), N'Cash', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1705, N'CUS044', N'DCO2', 6, CAST(N'2020-10-19' AS Date), N'Cash', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1706, N'CUS04', N'DCO7', 1, CAST(N'2020-11-16' AS Date), N'Cash', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1707, N'CUS034', N'DES1', 3, CAST(N'2020-11-21' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1708, N'CUS029', N'CHA2', 8, CAST(N'2020-03-03' AS Date), N'Bank transfer', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1709, N'CUS045', N'DES3', 4, CAST(N'2020-03-14' AS Date), N'Bank transfer', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1710, N'CUS016', N'CHA9', 8, CAST(N'2020-04-21' AS Date), N'Bank transfer', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1712, N'CUS033', N'DES3', 8, CAST(N'2020-05-12' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1713, N'CUS038', N'DES5', 3, CAST(N'2020-01-11' AS Date), N'Cash', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1714, N'CUS035', N'DCO4', 6, CAST(N'2020-09-21' AS Date), N'Cash', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1715, N'CUS030', N'DES3', 3, CAST(N'2020-01-08' AS Date), N'Bank transfer', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1716, N'CUS034', N'DCO6', 8, CAST(N'2020-07-29' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1717, N'CUS013', N'CHA9', 4, CAST(N'2020-02-10' AS Date), N'Bank transfer', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1718, N'CUS03', N'DES3', 4, CAST(N'2020-07-21' AS Date), N'Bank transfer', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1719, N'CUS017', N'DCO4', 10, CAST(N'2020-04-04' AS Date), N'Cash', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1720, N'CUS032', N'DCO6', 5, CAST(N'2020-07-26' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1721, N'CUS09', N'DES4', 1, CAST(N'2020-07-11' AS Date), N'Bank transfer', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1722, N'CUS028', N'CHA7', 1, CAST(N'2020-07-27' AS Date), N'Bank transfer', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1723, N'CUS034', N'DES5', 5, CAST(N'2020-05-17' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1724, N'CUS029', N'DES5', 10, CAST(N'2020-04-13' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1725, N'CUS030', N'DCO3', 9, CAST(N'2020-05-28' AS Date), N'Cash', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1726, N'CUS013', N'DCO3', 3, CAST(N'2020-04-07' AS Date), N'Cash', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1727, N'CUS014', N'DCO2', 7, CAST(N'2020-12-26' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1728, N'CUS020', N'CHA8', 5, CAST(N'2020-11-11' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1729, N'CUS06', N'DCO2', 2, CAST(N'2020-03-19' AS Date), N'Bank transfer', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1730, N'CUS015', N'DCO3', 7, CAST(N'2020-01-26' AS Date), N'Cash', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1731, N'CUS041', N'DES2', 2, CAST(N'2020-09-13' AS Date), N'Cash', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1732, N'CUS033', N'CHA8', 11, CAST(N'2020-04-01' AS Date), N'Bank transfer', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1733, N'CUS044', N'DCO4', 7, CAST(N'2020-01-28' AS Date), N'Cash', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1734, N'CUS09', N'DES1', 17, CAST(N'2020-08-19' AS Date), N'Bank transfer', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1738, N'CUS02', N'CHA7', 2, CAST(N'2020-07-21' AS Date), N'Bank transfer', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1739, N'CUS016', N'CHA3', 8, CAST(N'2020-09-08' AS Date), N'Cash', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1740, N'CUS015', N'CHA7', 1, CAST(N'2020-03-25' AS Date), N'Cash', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1741, N'CUS035', N'DES2', 16, CAST(N'2020-04-09' AS Date), N'Cash', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1742, N'CUS019', N'DCO4', 8, CAST(N'2020-12-19' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1743, N'CUS09', N'DES5', 3, CAST(N'2020-06-05' AS Date), N'Bank transfer', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1744, N'CUS035', N'DES6', 2, CAST(N'2020-09-07' AS Date), N'Cash', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1745, N'CUS039', N'DES3', 7, CAST(N'2020-10-04' AS Date), N'Bank transfer', N'San Diego', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1746, N'CUS020', N'DES4', 2, CAST(N'2020-01-26' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1747, N'CUS042', N'DCO1', 10, CAST(N'2020-01-24' AS Date), N'Bank transfer', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1748, N'CUS042', N'DCO5', 5, CAST(N'2020-07-16' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1749, N'CUS040', N'DCO7', 2, CAST(N'2020-10-06' AS Date), N'Bank transfer', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1751, N'CUS035', N'DES6', 3, CAST(N'2020-07-04' AS Date), N'Bank transfer', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1752, N'CUS01', N'DES2', 2, CAST(N'2020-06-07' AS Date), N'Cash', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1753, N'CUS041', N'DCO1', 9, CAST(N'2020-02-04' AS Date), N'Bank transfer', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1754, N'CUS012', N'DES2', 2, CAST(N'2020-11-29' AS Date), N'Bank transfer', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1755, N'CUS026', N'CHA7', 2, CAST(N'2020-06-19' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1756, N'CUS034', N'DCO4', 9, CAST(N'2020-05-13' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1758, N'CUS040', N'DCO5', 1, CAST(N'2020-08-24' AS Date), N'Bank transfer', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1759, N'CUS02', N'DCO2', 5, CAST(N'2020-10-02' AS Date), N'Bank transfer', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1760, N'CUS034', N'DES3', 5, CAST(N'2020-10-29' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1761, N'CUS036', N'CHA6', 3, CAST(N'2020-02-11' AS Date), N'Bank transfer', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1762, N'CUS045', N'DCO4', 2, CAST(N'2020-08-12' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1763, N'CUS017', N'CHA9', 10, CAST(N'2020-08-11' AS Date), N'Cash', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1765, N'CUS028', N'CHA3', 8, CAST(N'2020-04-04' AS Date), N'Bank transfer', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1767, N'CUS013', N'DES4', 8, CAST(N'2020-08-25' AS Date), N'Bank transfer', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1768, N'CUS06', N'DCO2', 2, CAST(N'2020-03-10' AS Date), N'Cash', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1769, N'CUS040', N'DCO7', 2, CAST(N'2020-10-26' AS Date), N'Bank transfer', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1770, N'CUS019', N'DCO1', 6, CAST(N'2020-01-18' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1771, N'CUS03', N'DES6', 4, CAST(N'2020-08-03' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1772, N'CUS014', N'CHA9', 1, CAST(N'2020-11-29' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1773, N'CUS012', N'DCO5', 9, CAST(N'2020-08-08' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1774, N'CUS041', N'DES2', 3, CAST(N'2020-12-02' AS Date), N'Bank transfer', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1775, N'CUS033', N'CHA2', 1, CAST(N'2020-03-24' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1777, N'CUS042', N'DCO4', 7, CAST(N'2020-02-05' AS Date), N'Bank transfer', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1778, N'CUS034', N'CHA5', 8, CAST(N'2020-01-01' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1779, N'CUS04', N'DCO7', 9, CAST(N'2020-02-29' AS Date), N'Cash', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1780, N'CUS018', N'CHA7', 1, CAST(N'2020-11-13' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1781, N'CUS010', N'DCO3', 2, CAST(N'2020-07-23' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1782, N'CUS035', N'CHA3', 4, CAST(N'2020-10-04' AS Date), N'Cash', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1783, N'CUS035', N'CHA5', 5, CAST(N'2020-11-14' AS Date), N'Cash', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1784, N'CUS034', N'DES6', 1, CAST(N'2020-09-29' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1785, N'CUS045', N'CHA9', 9, CAST(N'2020-08-05' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1786, N'CUS012', N'DCO1', 9, CAST(N'2020-08-19' AS Date), N'Bank transfer', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1788, N'CUS019', N'CHA8', 4, CAST(N'2020-02-28' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1789, N'CUS019', N'DCO6', 2, CAST(N'2020-08-16' AS Date), N'Cash', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1791, N'CUS043', N'DES1', 1, CAST(N'2020-11-29' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1792, N'CUS045', N'DCO7', 6, CAST(N'2020-02-08' AS Date), N'Bank transfer', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1794, N'CUS014', N'CHA6', 1, CAST(N'2020-02-15' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1795, N'CUS033', N'CHA5', 10, CAST(N'2020-08-13' AS Date), N'Bank transfer', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1796, N'CUS034', N'CHA2', 5, CAST(N'2020-09-02' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1797, N'CUS034', N'CHA7', 4, CAST(N'2020-08-28' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1798, N'CUS043', N'DES1', 3, CAST(N'2020-06-07' AS Date), N'Cash', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1799, N'CUS013', N'CHA2', 8, CAST(N'2020-01-07' AS Date), N'Cash', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1800, N'CUS012', N'DES5', 10, CAST(N'2020-07-15' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1802, N'CUS019', N'CHA7', 5, CAST(N'2020-12-27' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1803, N'CUS09', N'DCO5', 7, CAST(N'2020-12-22' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1804, N'CUS031', N'CHA5', 9, CAST(N'2020-05-06' AS Date), N'Bank transfer', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1805, N'CUS036', N'DCO4', 8, CAST(N'2020-02-22' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1806, N'CUS033', N'CHA2', 6, CAST(N'2020-09-22' AS Date), N'Bank transfer', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1807, N'CUS034', N'CHA5', 4, CAST(N'2020-06-29' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1808, N'CUS03', N'DES4', 6, CAST(N'2020-02-06' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1809, N'CUS032', N'CHA6', 8, CAST(N'2020-01-23' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1810, N'CUS02', N'CHA2', 7, CAST(N'2020-02-14' AS Date), N'Bank transfer', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1811, N'CUS035', N'DCO6', 2, CAST(N'2020-12-17' AS Date), N'Bank transfer', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1813, N'CUS037', N'DCO1', 2, CAST(N'2020-04-14' AS Date), N'Bank transfer', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1814, N'CUS037', N'DCO7', 6, CAST(N'2020-09-22' AS Date), N'Bank transfer', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1815, N'CUS07', N'DES5', 7, CAST(N'2020-02-07' AS Date), N'Cash', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1817, N'CUS028', N'CHA7', 5, CAST(N'2020-07-28' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1818, N'CUS035', N'DCO2', 10, CAST(N'2020-05-21' AS Date), N'Cash', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1819, N'CUS026', N'DES2', 8, CAST(N'2020-08-19' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1820, N'CUS020', N'CHA9', 5, CAST(N'2020-04-01' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1822, N'CUS05', N'CHA3', 5, CAST(N'2020-09-14' AS Date), N'Bank transfer', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1823, N'CUS045', N'DCO5', 3, CAST(N'2020-01-16' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1825, N'CUS018', N'CHA9', 7, CAST(N'2020-11-28' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1827, N'CUS04', N'DES3', 6, CAST(N'2020-08-08' AS Date), N'Bank transfer', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1828, N'CUS026', N'CHA8', 5, CAST(N'2020-11-21' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1829, N'CUS016', N'DES4', 8, CAST(N'2020-02-16' AS Date), N'Bank transfer', N'Plano', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1830, N'CUS026', N'DCO7', 7, CAST(N'2020-09-24' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1831, N'CUS01', N'DES4', 5, CAST(N'2020-03-26' AS Date), N'Cash', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1832, N'CUS017', N'DES1', 5, CAST(N'2020-11-28' AS Date), N'Bank transfer', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1833, N'CUS033', N'DCO6', 8, CAST(N'2020-09-01' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1834, N'CUS026', N'DCO7', 4, CAST(N'2020-01-18' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1835, N'CUS014', N'DCO7', 3, CAST(N'2020-08-22' AS Date), N'Cash', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1836, N'CUS012', N'DES2', 1, CAST(N'2020-11-20' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1837, N'CUS044', N'DES6', 6, CAST(N'2020-02-29' AS Date), N'Bank transfer', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1838, N'CUS02', N'DES1', 9, CAST(N'2020-02-23' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1839, N'CUS035', N'DES3', 8, CAST(N'2020-06-08' AS Date), N'Bank transfer', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1840, N'CUS043', N'DCO3', 7, CAST(N'2020-10-31' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1841, N'CUS035', N'DCO1', 9, CAST(N'2020-01-22' AS Date), N'Bank transfer', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1842, N'CUS07', N'DES5', 10, CAST(N'2020-10-12' AS Date), N'Bank transfer', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1843, N'CUS03', N'DES3', 11, CAST(N'2020-11-10' AS Date), N'Cash', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1844, N'CUS032', N'DCO6', 9, CAST(N'2020-10-30' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1845, N'CUS026', N'DES2', 7, CAST(N'2020-02-21' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1846, N'CUS010', N'CHA8', 5, CAST(N'2020-05-30' AS Date), N'Bank transfer', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1847, N'CUS020', N'CHA3', 4, CAST(N'2020-09-22' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1848, N'CUS028', N'DCO4', 6, CAST(N'2020-02-24' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1849, N'CUS06', N'DCO4', 5, CAST(N'2020-08-30' AS Date), N'Cash', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1850, N'CUS042', N'CHA8', 8, CAST(N'2020-08-01' AS Date), N'Bank transfer', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1851, N'CUS026', N'CHA9', 4, CAST(N'2020-01-22' AS Date), N'Cash', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1852, N'CUS040', N'DES5', 7, CAST(N'2020-08-12' AS Date), N'Cash', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1853, N'CUS013', N'CHA8', 2, CAST(N'2020-06-29' AS Date), N'Bank transfer', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1854, N'CUS014', N'CHA3', 6, CAST(N'2020-05-23' AS Date), N'Cash', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1855, N'CUS034', N'DES4', 9, CAST(N'2020-06-20' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1856, N'CUS03', N'CHA6', 1, CAST(N'2020-09-20' AS Date), N'Bank transfer', N'Miami', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1858, N'CUS020', N'DES2', 10, CAST(N'2020-01-08' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1860, N'CUS041', N'DES5', 4, CAST(N'2020-03-01' AS Date), N'Bank transfer', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1861, N'CUS05', N'DCO1', 10, CAST(N'2020-11-13' AS Date), N'Cash', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1863, N'CUS013', N'CHA8', 4, CAST(N'2020-03-14' AS Date), N'Cash', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1864, N'CUS026', N'DES4', 9, CAST(N'2020-11-30' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1865, N'CUS041', N'DES6', 2, CAST(N'2020-08-13' AS Date), N'Bank transfer', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1866, N'CUS04', N'CHA3', 5, CAST(N'2020-10-31' AS Date), N'Bank transfer', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1867, N'CUS042', N'DCO2', 2, CAST(N'2020-12-03' AS Date), N'Cash', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1868, N'CUS033', N'CHA7', 9, CAST(N'2020-05-29' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1869, N'CUS042', N'DES1', 5, CAST(N'2020-01-10' AS Date), N'Bank transfer', N'Minneapolis', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1870, N'CUS012', N'DCO4', 3, CAST(N'2020-03-12' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1872, N'CUS033', N'CHA3', 10, CAST(N'2020-07-09' AS Date), N'Cash', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1873, N'CUS041', N'DES3', 2, CAST(N'2020-09-05' AS Date), N'Bank transfer', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1874, N'CUS04', N'DCO3', 3, CAST(N'2020-06-16' AS Date), N'Cash', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1876, N'CUS014', N'DCO6', 4, CAST(N'2020-11-11' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1877, N'CUS033', N'DES2', 8, CAST(N'2020-02-16' AS Date), N'Bank transfer', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1879, N'CUS031', N'DCO4', 6, CAST(N'2020-12-20' AS Date), N'Bank transfer', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1880, N'CUS041', N'DCO2', 6, CAST(N'2020-05-22' AS Date), N'Bank transfer', N'Phoenix', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1881, N'CUS09', N'CHA7', 19, CAST(N'2020-07-08' AS Date), N'Bank transfer', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1882, N'CUS028', N'DES6', 5, CAST(N'2020-05-21' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1883, N'CUS010', N'DES6', 2, CAST(N'2020-07-02' AS Date), N'Cash', N'Seminole', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1884, N'CUS045', N'DES2', 3, CAST(N'2020-05-22' AS Date), N'Bank transfer', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1885, N'CUS06', N'DES1', 2, CAST(N'2020-09-11' AS Date), N'Cash', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1886, N'CUS029', N'CHA6', 4, CAST(N'2020-06-12' AS Date), N'Cash', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1887, N'CUS044', N'CHA2', 8, CAST(N'2020-04-22' AS Date), N'Bank transfer', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1888, N'CUS01', N'CHA5', 8, CAST(N'2020-03-20' AS Date), N'Bank transfer', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1889, N'CUS043', N'CHA6', 6, CAST(N'2020-11-04' AS Date), N'Cash', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1890, N'CUS037', N'DCO1', 8, CAST(N'2020-07-17' AS Date), N'Cash', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1891, N'CUS014', N'CHA5', 1, CAST(N'2020-02-21' AS Date), N'Bank transfer', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1892, N'CUS037', N'DCO3', 20, CAST(N'2020-08-07' AS Date), N'Bank transfer', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1893, N'CUS06', N'CHA8', 5, CAST(N'2020-09-25' AS Date), N'Bank transfer', N'Cincinnati', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1894, N'CUS015', N'DCO1', 19, CAST(N'2020-04-08' AS Date), N'Cash', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1896, N'CUS015', N'DCO2', 9, CAST(N'2020-11-09' AS Date), N'Bank transfer', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1897, N'CUS033', N'DCO2', 8, CAST(N'2020-12-16' AS Date), N'Bank transfer', N'Denver', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1898, N'CUS011', N'DCO4', 4, CAST(N'2020-09-08' AS Date), N'Bank transfer', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1899, N'CUS027', N'DES2', 1, CAST(N'2020-03-28' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1900, N'CUS011', N'DCO7', 2, CAST(N'2020-09-17' AS Date), N'Cash', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1903, N'CUS036', N'CHA2', 10, CAST(N'2020-02-12' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1904, N'CUS044', N'CHA9', 3, CAST(N'2020-05-03' AS Date), N'Cash', N'San Antonio', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1906, N'CUS038', N'DES2', 7, CAST(N'2020-10-06' AS Date), N'Cash', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1907, N'CUS031', N'DCO7', 5, CAST(N'2020-03-23' AS Date), N'Bank transfer', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1908, N'CUS038', N'CHA5', 4, CAST(N'2020-10-11' AS Date), N'Cash', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1909, N'CUS035', N'CHA8', 10, CAST(N'2020-08-06' AS Date), N'Bank transfer', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1910, N'CUS043', N'DES5', 9, CAST(N'2020-02-22' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1911, N'CUS032', N'DCO3', 10, CAST(N'2020-10-26' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1912, N'CUS031', N'CHA7', 8, CAST(N'2020-08-21' AS Date), N'Cash', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1913, N'CUS034', N'DES4', 3, CAST(N'2020-09-06' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1914, N'CUS038', N'CHA5', 8, CAST(N'2020-06-15' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1915, N'CUS017', N'DCO1', 3, CAST(N'2020-12-10' AS Date), N'Cash', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1916, N'CUS026', N'DES5', 8, CAST(N'2020-12-29' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1918, N'CUS05', N'DCO3', 9, CAST(N'2020-01-02' AS Date), N'Bank transfer', N'Charlotte', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1920, N'CUS09', N'DCO4', 4, CAST(N'2020-12-17' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1921, N'CUS09', N'DCO6', 3, CAST(N'2020-10-25' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1922, N'CUS030', N'DES2', 4, CAST(N'2020-05-22' AS Date), N'Cash', N'Los Angeles', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1924, N'CUS020', N'DCO1', 1, CAST(N'2020-08-02' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1925, N'CUS018', N'CHA5', 6, CAST(N'2020-04-13' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1926, N'CUS014', N'DES3', 10, CAST(N'2020-04-24' AS Date), N'Cash', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1927, N'CUS038', N'DCO2', 3, CAST(N'2020-07-30' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1929, N'CUS045', N'CHA2', 1, CAST(N'2020-06-20' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1930, N'CUS011', N'DCO3', 9, CAST(N'2020-11-24' AS Date), N'Cash', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1931, N'CUS026', N'CHA3', 8, CAST(N'2020-03-09' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1932, N'CUS015', N'DES2', 1, CAST(N'2020-09-08' AS Date), N'Bank transfer', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1933, N'CUS037', N'CHA9', 3, CAST(N'2020-04-11' AS Date), N'Cash', N'Portland', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1934, N'CUS012', N'DCO2', 4, CAST(N'2020-04-23' AS Date), N'Bank transfer', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1935, N'CUS043', N'CHA8', 7, CAST(N'2020-10-30' AS Date), N'Bank transfer', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1938, N'CUS038', N'CHA2', 12, CAST(N'2020-01-04' AS Date), N'Cash', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1939, N'CUS015', N'DCO7', 9, CAST(N'2020-02-29' AS Date), N'Bank transfer', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1940, N'CUS07', N'DES3', 5, CAST(N'2020-03-05' AS Date), N'Bank transfer', N'Orlando', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1941, N'CUS028', N'DES1', 6, CAST(N'2020-06-20' AS Date), N'Cash', N'San Francisco', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1942, N'CUS043', N'DCO6', 8, CAST(N'2020-12-15' AS Date), N'Cash', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1944, N'CUS038', N'DES4', 9, CAST(N'2020-09-21' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1945, N'CUS013', N'DCO6', 15, CAST(N'2020-12-14' AS Date), N'Cash', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1946, N'CUS018', N'CHA5', 9, CAST(N'2020-05-11' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1947, N'CUS012', N'CHA8', 10, CAST(N'2020-04-24' AS Date), N'Bank transfer', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1948, N'CUS034', N'CHA9', 6, CAST(N'2020-07-29' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1949, N'CUS045', N'DCO5', 7, CAST(N'2020-02-20' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1952, N'CUS04', N'DCO1', 3, CAST(N'2020-10-22' AS Date), N'Bank transfer', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1953, N'CUS020', N'CHA2', 3, CAST(N'2020-02-06' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1955, N'CUS035', N'DES3', 4, CAST(N'2020-05-23' AS Date), N'Bank transfer', N'Dallas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1956, N'CUS034', N'DES6', 4, CAST(N'2020-07-21' AS Date), N'Cash', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1957, N'CUS038', N'CHA5', 4, CAST(N'2020-03-15' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1958, N'CUS032', N'DES1', 3, CAST(N'2020-12-11' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1960, N'CUS026', N'DCO5', 10, CAST(N'2020-11-16' AS Date), N'Bank transfer', N'Santa Clara', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1961, N'CUS013', N'DES4', 2, CAST(N'2020-11-21' AS Date), N'Bank transfer', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1962, N'CUS040', N'DCO3', 10, CAST(N'2020-09-27' AS Date), N'Bank transfer', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1963, N'CUS013', N'DES5', 1, CAST(N'2020-10-22' AS Date), N'Bank transfer', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1964, N'CUS031', N'DES3', 17, CAST(N'2020-04-01' AS Date), N'Bank transfer', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1965, N'CUS09', N'CHA2', 4, CAST(N'2020-10-31' AS Date), N'Cash', N'Tampa', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1966, N'CUS038', N'DCO6', 3, CAST(N'2020-07-19' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1967, N'CUS013', N'DES2', 8, CAST(N'2020-01-26' AS Date), N'Bank transfer', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1968, N'CUS02', N'DCO6', 9, CAST(N'2020-01-30' AS Date), N'Bank transfer', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1969, N'CUS04', N'CHA8', 1, CAST(N'2020-05-05' AS Date), N'Bank transfer', N'Philadelphia', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1970, N'CUS038', N'DCO2', 5, CAST(N'2020-02-12' AS Date), N'Cash', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1971, N'CUS043', N'CHA3', 10, CAST(N'2020-07-18' AS Date), N'Cash', N'Las Vegas', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1972, N'CUS029', N'DCO6', 3, CAST(N'2020-01-31' AS Date), N'Bank transfer', N'New York', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1973, N'CUS018', N'CHA9', 4, CAST(N'2020-01-23' AS Date), N'Bank transfer', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1974, N'CUS02', N'DCO1', 1, CAST(N'2020-05-29' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1975, N'CUS015', N'DCO3', 9, CAST(N'2020-03-05' AS Date), N'Cash', N'Ogden', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1976, N'CUS019', N'DES1', 7, CAST(N'2020-02-21' AS Date), N'Bank transfer', N'Sacramento', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1977, N'CUS017', N'DCO6', 1, CAST(N'2020-01-05' AS Date), N'Bank transfer', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1978, N'CUS013', N'DES6', 1, CAST(N'2020-09-12' AS Date), N'Cash', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1979, N'CUS027', N'CHA2', 8, CAST(N'2020-12-19' AS Date), N'Cash', N'Clearwater', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1980, N'CUS038', N'CHA9', 4, CAST(N'2020-06-18' AS Date), N'Bank transfer', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1981, N'CUS040', N'CHA6', 6, CAST(N'2020-07-19' AS Date), N'Bank transfer', N'Houston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1982, N'CUS018', N'DES2', 2, CAST(N'2020-02-28' AS Date), N'Cash', N'Carteret', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1983, N'CUS031', N'CHA2', 2, CAST(N'2020-06-15' AS Date), N'Bank transfer', N'Chicago', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1984, N'CUS036', N'DCO1', 7, CAST(N'2020-03-30' AS Date), N'Cash', N'Boston', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1985, N'CUS038', N'CHA2', 5, CAST(N'2020-07-23' AS Date), N'Cash', N'Detroit', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1986, N'CUS02', N'CHA5', 10, CAST(N'2020-08-08' AS Date), N'Cash', N'Boulder', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1987, N'CUS011', N'CHA3', 4, CAST(N'2020-01-17' AS Date), N'Cash', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1988, N'CUS034', N'DCO3', 5, CAST(N'2020-08-29' AS Date), N'Bank transfer', N'Atlanta', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1989, N'CUS017', N'DCO5', 2, CAST(N'2020-02-24' AS Date), N'Bank transfer', N'Albany', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1990, N'CUS014', N'CHA9', 4, CAST(N'2020-10-17' AS Date), N'Cash', N'Kaneohe', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1991, N'CUS01', N'DES5', 7, CAST(N'2020-04-05' AS Date), N'Cash', N'Gainesville', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1992, N'CUS032', N'DES1', 1, CAST(N'2020-08-02' AS Date), N'Bank transfer', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1993, N'CUS045', N'DCO7', 2, CAST(N'2020-09-20' AS Date), N'Cash', N'Milwaukee', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1994, N'CUS012', N'CHA6', 7, CAST(N'2020-05-19' AS Date), N'Cash', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1995, N'CUS012', N'CHA8', 6, CAST(N'2020-03-04' AS Date), N'Bank transfer', N'Battle Creek', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1996, N'CUS020', N'CHA3', 2, CAST(N'2020-11-29' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1997, N'CUS013', N'DES2', 7, CAST(N'2020-05-11' AS Date), N'Cash', N'Carlisle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1998, N'CUS032', N'DCO2', 7, CAST(N'2020-05-28' AS Date), N'Cash', N'Seattle', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (1999, N'CUS011', N'DES2', 4, CAST(N'2020-12-21' AS Date), N'Bank transfer', N'Prospect Park', NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (2342, N'CUS08', N'CHA2', 5, CAST(N'2024-04-23' AS Date), N'Cash', N'', N'')
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (2898, N'CUS033', N'CHA9', 2, CAST(N'2024-04-23' AS Date), N'', N'CO', N'')
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (2899, N'CUS033', N'DES6', 4, CAST(N'2024-04-23' AS Date), N'Cash', N'1313 Elmwood Drive,St. Louis,MO', N'')
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (3899, N'CUS010', N'CHA9', 2, CAST(N'2024-04-23' AS Date), N'', N'FL', N'')
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (3900, N'CUS08', N'CHA9', 3, CAST(N'2024-04-23' AS Date), N'', N'MO', N'')
GO
INSERT [dbo].[Orders] ([OrderID], [CusID], [ProID], [Quantity], [OrderDate], [PaymentMethod], [ShipDestination], [Note]) VALUES (3901, N'CUS08', N'CHA9', 1, CAST(N'2024-04-23' AS Date), N'', N'MO', N'')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1000, N'CUS02', N'DES1', N'Bank transfer', CAST(1680.00 AS Decimal(10, 2)), N'Mississippi')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1001, N'CUS038', N'CHA5', N'Bank transfer', CAST(1197.00 AS Decimal(10, 2)), N'Delaware')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1002, N'CUS07', N'DCO6', N'Cash', CAST(1520.00 AS Decimal(10, 2)), N'Wisconsin')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1003, N'CUS033', N'CHA7', N'Bank transfer', CAST(1440.00 AS Decimal(10, 2)), N'Connecticut')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1004, N'CUS018', N'CHA9', N'Cash', CAST(736.00 AS Decimal(10, 2)), N'Washington')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1005, N'CUS027', N'CHA7', N'Cash', CAST(1440.00 AS Decimal(10, 2)), N'Massachusetts')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1006, N'CUS031', N'DCO5', N'Bank transfer', CAST(1960.00 AS Decimal(10, 2)), N'Idaho')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1007, N'CUS02', N'CHA7', N'Cash', CAST(1440.00 AS Decimal(10, 2)), N'California')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1008, N'CUS02', N'CHA9', N'Bank transfer', CAST(920.00 AS Decimal(10, 2)), N'Kentucky')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1009, N'CUS06', N'DES2', N'Cash', CAST(1344.00 AS Decimal(10, 2)), N'Nevada')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1010, N'CUS040', N'DCO5', N'Cash', CAST(980.00 AS Decimal(10, 2)), N'Florida')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1011, N'CUS034', N'DES1', N'Credit Card', CAST(168.00 AS Decimal(10, 2)), N'Tennessee')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1012, N'CUS034', N'CHA7', N'Bank transfer', CAST(480.00 AS Decimal(10, 2)), N'North Carolina')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1014, N'CUS038', N'CHA6', N'Bank transfer', CAST(612.00 AS Decimal(10, 2)), N'Arizona')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1015, N'CUS019', N'DES2', N'Cash', CAST(768.00 AS Decimal(10, 2)), N'South Dakota')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1016, N'CUS014', N'CHA8', N'Bank transfer', CAST(546.00 AS Decimal(10, 2)), N'Maryland')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1017, N'CUS03', N'CHA9', N'Bank transfer', CAST(1840.00 AS Decimal(10, 2)), N'Minnesota')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1018, N'CUS04', N'CHA2', N'Bank transfer', CAST(816.00 AS Decimal(10, 2)), N'Oregon')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1019, N'CUS01', N'CHA6', N'Cash', CAST(1224.00 AS Decimal(10, 2)), N'Louisiana')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1020, N'CUS044', N'DCO7', N'Bank transfer', CAST(276.00 AS Decimal(10, 2)), N'Indiana')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1021, N'CUS06', N'DES6', N'PayPal', CAST(1460.00 AS Decimal(10, 2)), N'New York')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1022, N'CUS017', N'DCO3', N'Bank transfer', CAST(232.00 AS Decimal(10, 2)), N'Virginia')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1023, N'CUS01', N'DCO6', N'Cash', CAST(1710.00 AS Decimal(10, 2)), N'Oklahoma')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1024, N'CUS026', N'DCO1', N'Bank transfer', CAST(882.00 AS Decimal(10, 2)), N'Nebraska')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1025, N'CUS031', N'DCO1', N'Bank transfer', CAST(1008.00 AS Decimal(10, 2)), N'Michigan')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1026, N'CUS020', N'CHA9', N'Bank transfer', CAST(184.00 AS Decimal(10, 2)), N'Arkansas')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1027, N'CUS020', N'CHA9', N'Bank Transfer', CAST(1656.00 AS Decimal(10, 2)), N'South Carolina')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1028, N'CUS010', N'CHA2', N'Bank transfer', CAST(612.00 AS Decimal(10, 2)), N'Rhode Island')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1029, N'CUS03', N'CHA9', N'Bank transfer', CAST(1104.00 AS Decimal(10, 2)), N'Alaska')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1030, N'CUS042', N'DCO7', N'Bank transfer', CAST(69.00 AS Decimal(10, 2)), N'New Jersey')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1031, N'CUS037', N'DCO4', N'Cash', CAST(760.00 AS Decimal(10, 2)), N'Alabama')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1032, N'CUS016', N'CHA5', N'Bank transfer', CAST(133.00 AS Decimal(10, 2)), N'Vermont')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1033, N'CUS045', N'CHA7', N'Cash', CAST(1600.00 AS Decimal(10, 2)), N'Georgia')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1034, N'CUS032', N'CHA5', N'Cash', CAST(931.00 AS Decimal(10, 2)), N'Colorado')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1035, N'CUS019', N'DCO5', N'Cash', CAST(392.00 AS Decimal(10, 2)), N'North Dakota')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1036, N'CUS016', N'DCO3', N'Cash', CAST(464.00 AS Decimal(10, 2)), N'New Mexico')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1038, N'CUS07', N'DCO7', N'Cash', CAST(966.00 AS Decimal(10, 2)), N'New Hampshire')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1039, N'CUS031', N'DCO1', N'Cash', CAST(1260.00 AS Decimal(10, 2)), N'Kansas')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1040, N'CUS010', N'DES2', N'Bank transfer', CAST(768.00 AS Decimal(10, 2)), N'Ohio')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1041, N'CUS06', N'CHA9', N'Bank transfer', CAST(552.00 AS Decimal(10, 2)), N'Illinois')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1042, N'CUS027', N'DES4', N'Bank transfer', CAST(744.00 AS Decimal(10, 2)), N'Hawaii')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1043, N'CUS07', N'CHA5', N'Cash', CAST(1330.00 AS Decimal(10, 2)), N'Pennsylvania')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1044, N'CUS06', N'CHA3', N'Bank transfer', CAST(832.00 AS Decimal(10, 2)), N'Texas')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1045, N'CUS045', N'DCO3', N'Bank transfer', CAST(812.00 AS Decimal(10, 2)), N'Iowa')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1046, N'CUS030', N'CHA2', N'Cash', CAST(714.00 AS Decimal(10, 2)), N'Wyoming')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1047, N'CUS042', N'DES1', N'Cash', CAST(1512.00 AS Decimal(10, 2)), N'Montana')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1048, N'CUS018', N'CHA5', N'Cash', CAST(1064.00 AS Decimal(10, 2)), N'Missouri')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1049, N'CUS09', N'DCO5', N'Bank transfer', CAST(1764.00 AS Decimal(10, 2)), N'Maine')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1050, N'CUS03', N'DCO5', N'Bank transfer', CAST(392.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1051, N'CUS029', N'DCO4', N'Cash', CAST(190.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1052, N'CUS05', N'DCO5', N'Cash', CAST(1176.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1053, N'CUS02', N'DES4', N'Cash', CAST(248.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1054, N'CUS036', N'CHA9', N'Bank transfer', CAST(920.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1055, N'CUS08', N'CHA3', N'Cash', CAST(312.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1056, N'CUS018', N'DES5', N'Cash', CAST(84.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1057, N'CUS05', N'DES3', N'Bank transfer', CAST(728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1058, N'CUS036', N'CHA7', N'Bank transfer', CAST(640.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1059, N'CUS017', N'DCO5', N'Cash', CAST(1960.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1060, N'CUS037', N'DCO5', N'Cash', CAST(980.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1061, N'CUS028', N'DES4', N'Bank transfer', CAST(124.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1062, N'CUS018', N'DCO5', N'Cash', CAST(1568.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1063, N'CUS034', N'CHA9', N'Bank transfer', CAST(1840.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1064, N'CUS06', N'DCO2', N'Cash', CAST(1840.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1065, N'CUS037', N'DCO7', N'Bank transfer', CAST(483.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1066, N'CUS010', N'DCO1', N'Bank transfer', CAST(252.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1067, N'CUS014', N'CHA7', N'Cash', CAST(1280.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1068, N'CUS09', N'DES3', N'Bank transfer', CAST(819.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1070, N'CUS029', N'CHA6', N'Cash', CAST(1071.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1072, N'CUS01', N'DES3', N'Bank transfer', CAST(546.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1073, N'CUS019', N'DCO6', N'Cash', CAST(760.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1074, N'CUS030', N'DCO5', N'Bank transfer', CAST(588.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1075, N'CUS016', N'DCO1', N'Cash', CAST(252.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1076, N'CUS035', N'DES1', N'Bank transfer', CAST(1176.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1077, N'CUS05', N'DCO6', N'Cash', CAST(190.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1078, N'CUS031', N'DES3', N'Credit Card', CAST(1638.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1079, N'CUS032', N'CHA8', N'Cash', CAST(455.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1080, NULL, N'DCO2', N'PayPal', CAST(920.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1081, N'CUS044', N'DES5', N'Cash', CAST(168.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1082, N'CUS018', N'CHA3', N'Bank transfer', CAST(520.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1083, N'CUS015', N'DCO2', N'Bank transfer', CAST(1656.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1084, N'CUS09', N'CHA5', N'Cash', CAST(1330.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1085, N'CUS045', N'DCO6', N'Bank transfer', CAST(1710.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1086, N'CUS033', N'DES3', N'Cash', CAST(910.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1087, N'CUS016', N'CHA3', N'Cash', CAST(728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1088, N'CUS038', N'DCO6', N'Cash', CAST(380.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1089, N'CUS034', N'DES1', N'Cash', CAST(1008.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1090, N'CUS08', N'DES5', N'Cash', CAST(420.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1091, N'CUS019', N'DCO2', N'Cash', CAST(184.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1092, N'CUS032', N'CHA5', N'Bank transfer', CAST(1064.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1093, N'CUS020', N'DES3', N'Cash', CAST(364.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1094, N'CUS034', N'DES6', N'Bank transfer', CAST(511.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1095, N'CUS042', N'CHA7', N'Bank Transfer', CAST(960.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1096, N'CUS027', N'CHA8', N'Cash', CAST(819.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1097, N'CUS012', N'DCO2', N'Cash', CAST(736.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1098, N'CUS040', N'CHA6', N'Bank transfer', CAST(765.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1099, N'CUS042', N'DCO1', N'Cash', CAST(1260.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1100, N'CUS011', N'DES3', N'Bank transfer', CAST(819.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1101, N'CUS019', N'DES1', N'Cash', CAST(1008.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1102, N'CUS031', N'CHA5', N'Cash', CAST(1197.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1103, N'CUS018', N'CHA3', N'Cash', CAST(104.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1104, N'CUS015', N'DES5', N'Bank transfer', CAST(504.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1105, N'CUS043', N'DES5', N'Bank transfer', CAST(168.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1106, N'CUS018', N'CHA9', N'Cash', CAST(920.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1107, N'CUS042', N'DCO1', N'Bank transfer', CAST(126.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1108, N'CUS02', N'DCO7', N'Cash', CAST(552.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1109, N'CUS026', N'DCO7', N'Bank transfer', CAST(552.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1110, N'CUS015', N'DES1', N'Cash', CAST(840.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1111, N'CUS020', N'DCO1', N'Bank transfer', CAST(882.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1112, N'CUS029', N'CHA6', N'Bank transfer', CAST(1377.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1113, N'CUS019', N'DES6', N'Bank transfer', CAST(657.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1115, N'CUS037', N'CHA7', N'Bank transfer', CAST(800.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1116, N'CUS041', N'CHA7', N'Cash', CAST(1280.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1117, N'CUS026', N'DCO5', N'Bank transfer', CAST(196.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1118, N'CUS014', N'DCO3', N'Cash', CAST(812.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1119, N'CUS011', N'DCO1', N'Bank transfer', CAST(882.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1120, N'CUS026', N'DCO4', N'Bank transfer', CAST(950.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1121, N'CUS016', N'DCO1', N'Bank transfer', CAST(630.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1122, N'CUS037', N'DCO6', N'Bank transfer', CAST(1900.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1123, N'CUS033', N'CHA6', N'Cash', CAST(459.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1124, N'CUS09', N'CHA8', N'Cash', CAST(637.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1125, N'CUS012', N'DCO6', N'Bank transfer', CAST(190.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1126, N'CUS029', N'DCO7', N'Bank transfer', CAST(276.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1127, N'CUS036', N'DCO5', N'Cash', CAST(392.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1129, N'CUS06', N'DCO2', N'Cash', CAST(1104.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1130, N'CUS039', N'CHA2', N'Cash', CAST(204.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1131, N'CUS010', N'CHA6', N'Bank transfer', CAST(765.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1132, N'CUS010', N'DCO4', N'Cash', CAST(380.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1133, N'CUS035', N'DCO7', N'Bank transfer', CAST(621.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1134, N'CUS038', N'DCO4', N'Bank transfer', CAST(570.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1135, N'CUS011', N'DES6', N'Bank transfer', CAST(219.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1136, N'CUS09', N'DCO7', N'Cash', CAST(207.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1137, N'CUS01', N'DES5', N'Cash', CAST(336.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1138, N'CUS040', N'CHA5', N'Cash', CAST(665.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1139, N'CUS036', N'CHA7', N'Bank transfer', CAST(480.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1140, N'CUS029', N'DES5', N'Bank transfer', CAST(756.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1141, N'CUS016', N'DES4', N'Bank transfer', CAST(620.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1142, N'CUS045', N'DES5', N'Bank transfer', CAST(756.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1143, N'CUS019', N'DES4', N'Bank transfer', CAST(372.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1144, N'CUS028', N'CHA9', N'Cash', CAST(184.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1145, N'CUS042', N'DES4', N'Cash', CAST(124.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1146, N'CUS028', N'DES6', N'Cash', CAST(730.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1147, N'CUS04', N'DCO6', N'Cash', CAST(1900.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1148, N'CUS028', N'DES2', N'Cash', CAST(384.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1149, N'CUS03', N'CHA2', N'Cash', CAST(918.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1150, N'CUS045', N'CHA8', N'Cash', CAST(546.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1151, N'CUS019', N'DCO2', N'Cash', CAST(2208.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1152, N'CUS043', N'CHA8', N'Cash', CAST(1092.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1153, N'CUS02', N'CHA9', N'Bank transfer', CAST(1104.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1154, N'CUS043', N'CHA5', N'Cash', CAST(931.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1155, N'CUS019', N'DCO1', N'Cash', CAST(1008.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1156, N'CUS038', N'CHA8', N'Bank transfer', CAST(637.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1158, N'CUS044', N'CHA3', N'Bank transfer', CAST(104.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1159, N'CUS040', N'DCO2', N'Cash', CAST(736.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1160, N'CUS06', N'DCO6', N'Cash', CAST(950.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1161, N'CUS09', N'DCO7', N'Bank transfer', CAST(690.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1162, N'CUS037', N'DCO6', N'Cash', CAST(1520.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1164, N'CUS014', N'DCO1', N'Cash', CAST(882.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1165, N'CUS05', N'DCO5', N'Cash', CAST(1568.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1166, N'CUS038', N'DES1', N'Cash', CAST(840.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1167, N'CUS026', N'DCO4', N'Bank transfer', CAST(380.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1168, N'CUS014', N'DES5', N'Cash', CAST(756.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1169, N'CUS035', N'DES1', N'Cash', CAST(1512.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1170, N'CUS029', N'DCO7', N'Cash', CAST(69.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1171, N'CUS020', N'DCO4', N'Cash', CAST(950.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1172, N'CUS031', N'CHA2', N'Bank transfer', CAST(714.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1174, N'CUS05', N'DES2', N'Cash', CAST(1920.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1175, N'CUS027', N'DES1', N'Bank transfer', CAST(168.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1176, N'CUS032', N'DCO3', N'Bank transfer', CAST(1160.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1177, N'CUS038', N'CHA7', N'Bank transfer', CAST(1120.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1178, N'CUS09', N'DES5', N'Bank transfer', CAST(84.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1179, N'CUS042', N'CHA6', N'Cash', CAST(459.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1180, N'CUS01', N'DES2', N'Cash', CAST(384.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1181, N'CUS015', N'CHA5', N'Cash', CAST(399.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1182, N'CUS012', N'DES3', N'Cash', CAST(455.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1183, N'CUS013', N'DES2', N'Bank transfer', CAST(1152.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1184, N'CUS01', N'DCO4', N'Bank transfer', CAST(95.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1185, N'CUS01', N'DCO2', N'Cash', CAST(1840.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1186, N'CUS036', N'CHA2', N'Cash', CAST(408.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1187, N'CUS036', N'DCO4', N'Cash', CAST(95.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1188, N'CUS032', N'DCO6', N'Bank transfer', CAST(1330.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1189, N'CUS01', N'DCO2', N'Cash', CAST(1472.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1190, N'CUS036', N'CHA6', N'Cash', CAST(612.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1191, N'CUS012', N'DES3', N'Bank transfer', CAST(455.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1192, N'CUS028', N'DES1', N'Bank transfer', CAST(1176.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1193, N'CUS012', N'CHA2', N'Bank transfer', CAST(918.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1194, N'CUS018', N'DES1', N'Bank transfer', CAST(1680.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1195, N'CUS033', N'CHA2', N'Cash', CAST(1020.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1196, N'CUS031', N'CHA9', N'Bank transfer', CAST(1840.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1197, N'CUS040', N'CHA6', N'Bank transfer', CAST(765.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1198, N'CUS010', N'DCO4', N'Cash', CAST(475.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1199, N'CUS09', N'CHA5', N'Cash', CAST(931.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1200, N'CUS029', N'DES3', N'Bank transfer', CAST(91.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1201, N'CUS07', N'DES4', N'Cash', CAST(744.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1202, N'CUS040', N'DCO6', N'Bank transfer', CAST(1710.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1203, N'CUS038', N'CHA3', N'Cash', CAST(832.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1205, N'CUS034', N'DES6', N'Bank transfer', CAST(365.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1206, N'CUS038', N'DES3', N'Cash', CAST(364.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1207, N'CUS018', N'DES1', N'Cash', CAST(336.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1209, N'CUS010', N'DES3', N'Cash', CAST(728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1210, N'CUS027', N'DES4', N'Cash', CAST(744.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1211, N'CUS06', N'DES5', N'Cash', CAST(336.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1212, N'CUS03', N'DCO3', N'Cash', CAST(580.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1213, N'CUS033', N'CHA7', N'Bank transfer', CAST(640.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1214, N'CUS01', N'CHA8', N'Cash', CAST(1547.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1215, N'CUS016', N'CHA8', N'Bank transfer', CAST(182.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1216, N'CUS043', N'DCO2', N'Bank transfer', CAST(736.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1217, N'CUS026', N'CHA5', N'Bank transfer', CAST(399.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1218, N'CUS018', N'DCO7', N'Cash', CAST(69.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1219, N'CUS019', N'CHA3', N'Cash', CAST(936.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1221, N'CUS039', N'DES5', N'Cash', CAST(420.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1222, N'CUS030', N'DCO7', N'Cash', CAST(138.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1224, N'CUS040', N'CHA2', N'Bank transfer', CAST(1020.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1225, N'CUS010', N'CHA6', N'Bank transfer', CAST(1530.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1226, N'CUS04', N'DES1', N'Cash', CAST(336.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1227, N'CUS012', N'DES4', N'Cash', CAST(620.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1228, N'CUS016', N'CHA3', N'Cash', CAST(728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1229, N'CUS08', N'CHA9', N'Cash', CAST(1288.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1230, N'CUS010', N'DCO7', N'Bank transfer', CAST(276.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1231, N'CUS032', N'CHA9', N'Cash', CAST(736.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1232, N'CUS06', N'DES4', N'Bank transfer', CAST(620.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1233, N'CUS01', N'DCO6', N'Bank transfer', CAST(1710.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1234, N'CUS033', N'DCO2', N'Cash', CAST(1104.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1235, N'CUS032', N'CHA5', N'Bank transfer', CAST(133.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1236, N'CUS018', N'DCO5', N'Bank transfer', CAST(1960.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1237, N'CUS030', N'CHA6', N'Cash', CAST(306.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1238, N'CUS028', N'DES2', N'Cash', CAST(768.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1239, N'CUS05', N'DCO5', N'Bank transfer', CAST(196.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1241, N'CUS017', N'DCO4', N'Bank transfer', CAST(475.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1242, N'CUS012', N'CHA9', N'Cash', CAST(552.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1243, N'CUS045', N'CHA6', N'Cash', CAST(459.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1245, N'CUS05', N'DCO3', N'Cash', CAST(580.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1247, N'CUS031', N'DCO2', N'Cash', CAST(552.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1248, N'CUS043', N'DES2', N'Bank transfer', CAST(768.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1249, N'CUS015', N'DES1', N'Bank transfer', CAST(1008.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1250, N'CUS04', N'DCO3', N'Cash', CAST(1044.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1251, N'CUS029', N'DCO3', N'Bank transfer', CAST(1160.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1252, N'CUS02', N'DES5', N'Cash', CAST(588.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1253, N'CUS030', N'DCO1', N'Bank transfer', CAST(1260.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1254, N'CUS032', N'DCO3', N'Bank transfer', CAST(464.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1255, N'CUS03', N'DES4', N'Cash', CAST(744.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1256, N'CUS018', N'DCO1', N'Bank transfer', CAST(126.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1257, N'CUS044', N'CHA8', N'Bank transfer', CAST(455.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1258, N'CUS014', N'DCO5', N'Bank transfer', CAST(392.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1259, N'CUS026', N'DES5', N'Cash', CAST(168.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1260, N'CUS039', N'DCO6', N'Cash', CAST(1140.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1261, N'CUS027', N'DCO2', N'Bank transfer', CAST(1104.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1262, N'CUS042', N'DCO6', N'Cash', CAST(1330.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1264, N'CUS01', N'DCO7', N'Bank transfer', CAST(414.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1266, N'CUS033', N'DCO4', N'Cash', CAST(760.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1267, N'CUS035', N'DES4', N'Bank transfer', CAST(992.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1268, N'CUS036', N'CHA6', N'Cash', CAST(1224.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1269, N'CUS027', N'DES2', N'Cash', CAST(1728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1271, N'CUS033', N'DES3', N'Cash', CAST(455.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1272, N'CUS039', N'DES5', N'Cash', CAST(672.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1273, N'CUS017', N'DCO2', N'Bank transfer', CAST(1472.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1274, N'CUS08', N'CHA9', N'Cash', CAST(1656.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1275, N'CUS03', N'CHA6', N'Cash', CAST(765.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1276, N'CUS08', N'DES5', N'Bank transfer', CAST(168.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1277, N'CUS030', N'DES1', N'Cash', CAST(1008.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1278, N'CUS014', N'DCO3', N'Cash', CAST(928.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1279, N'CUS034', N'DES5', N'Cash', CAST(504.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1280, N'CUS03', N'CHA2', N'Bank transfer', CAST(918.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1281, N'CUS037', N'CHA6', N'Cash', CAST(1530.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1282, N'CUS012', N'DCO5', N'Cash', CAST(980.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1283, N'CUS010', N'CHA6', N'Cash', CAST(306.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1284, N'CUS06', N'DCO7', N'Cash', CAST(552.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1285, N'CUS012', N'DES4', N'Cash', CAST(868.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1286, N'CUS033', N'DES5', N'Cash', CAST(588.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1287, N'CUS03', N'DCO7', N'Cash', CAST(276.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1288, N'CUS030', N'DES5', N'Cash', CAST(504.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1289, N'CUS014', N'CHA8', N'Cash', CAST(728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1290, N'CUS07', N'CHA3', N'Cash', CAST(936.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1291, N'CUS029', N'CHA8', N'Bank transfer', CAST(637.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1292, N'CUS010', N'DES1', N'Bank transfer', CAST(672.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1293, N'CUS06', N'DCO7', N'Bank transfer', CAST(138.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1294, N'CUS02', N'DES2', N'Cash', CAST(1152.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1295, N'CUS020', N'CHA9', N'Bank transfer', CAST(1656.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1296, N'CUS014', N'CHA9', N'Bank transfer', CAST(1472.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1297, N'CUS041', N'DCO1', N'Cash', CAST(756.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1298, N'CUS016', N'CHA6', N'Cash', CAST(765.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1299, N'CUS040', N'DCO4', N'Bank transfer', CAST(760.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1300, N'CUS09', N'DCO4', N'Cash', CAST(95.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1301, N'CUS017', N'DES1', N'Cash', CAST(1512.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1302, N'CUS012', N'DES5', N'Cash', CAST(252.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1303, N'CUS04', N'CHA6', N'Cash', CAST(1224.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1304, N'CUS026', N'DCO6', N'Bank transfer', CAST(570.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1305, N'CUS044', N'CHA6', N'Bank transfer', CAST(153.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1306, N'CUS02', N'DES2', N'Bank transfer', CAST(1728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1307, N'CUS039', N'DES1', N'Bank transfer', CAST(168.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1308, N'CUS040', N'DCO3', N'Bank transfer', CAST(580.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1309, N'CUS043', N'DCO3', N'Cash', CAST(464.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1310, N'CUS019', N'CHA7', N'Cash', CAST(1440.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1311, N'CUS042', N'DCO6', N'Cash', CAST(1520.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1312, N'CUS015', N'CHA2', N'Bank transfer', CAST(612.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1313, N'CUS027', N'CHA9', N'Bank transfer', CAST(1472.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1314, N'CUS05', N'CHA5', N'Cash', CAST(399.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1315, N'CUS037', N'CHA9', N'Cash', CAST(920.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1316, N'CUS036', N'DCO4', N'Bank transfer', CAST(190.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1317, N'CUS027', N'CHA9', N'Bank transfer', CAST(1472.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1319, N'CUS010', N'DCO6', N'Bank transfer', CAST(1140.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1320, N'CUS026', N'DES4', N'Bank transfer', CAST(744.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1321, N'CUS01', N'DES1', N'Bank transfer', CAST(1344.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1322, N'CUS02', N'DCO4', N'Cash', CAST(475.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1323, N'CUS037', N'CHA3', N'Bank transfer', CAST(520.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1326, N'CUS07', N'DCO1', N'Bank transfer', CAST(2268.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1327, N'CUS027', N'DES3', N'Cash', CAST(819.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1328, N'CUS029', N'DCO7', N'Cash', CAST(621.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1329, N'CUS033', N'DCO2', N'Bank transfer', CAST(368.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1330, N'CUS013', N'DCO5', N'Bank transfer', CAST(1176.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1331, N'CUS028', N'CHA9', N'Cash', CAST(1656.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1332, N'CUS01', N'CHA8', N'Bank transfer', CAST(1092.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1333, N'CUS044', N'CHA6', N'Cash', CAST(1071.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1334, N'CUS041', N'CHA7', N'Bank transfer', CAST(1120.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1335, N'CUS043', N'CHA8', N'Bank transfer', CAST(455.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1336, N'CUS028', N'DES2', N'Cash', CAST(1344.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1337, N'CUS016', N'DES4', N'Bank transfer', CAST(496.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1339, N'CUS031', N'DCO6', N'Cash', CAST(1710.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1341, N'CUS035', N'CHA3', N'Bank transfer', CAST(520.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1342, N'CUS016', N'CHA7', N'Cash', CAST(480.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1344, N'CUS042', N'CHA7', N'Cash', CAST(160.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1345, N'CUS018', N'CHA2', N'Bank transfer', CAST(510.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1346, N'CUS036', N'DES6', N'Bank transfer', CAST(365.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1347, N'CUS036', N'DES2', N'Cash', CAST(960.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1348, N'CUS014', N'DCO1', N'Bank transfer', CAST(882.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1349, N'CUS020', N'CHA7', N'Cash', CAST(960.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1350, N'CUS07', N'DCO7', N'Bank transfer', CAST(483.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1351, N'CUS031', N'DCO6', N'Bank transfer', CAST(190.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1352, N'CUS031', N'DES3', N'Cash', CAST(182.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1353, N'CUS040', N'CHA3', N'Cash', CAST(1040.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1354, N'CUS034', N'DCO5', N'Bank transfer', CAST(1568.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1355, N'CUS033', N'CHA5', N'Cash', CAST(399.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1356, N'CUS01', N'DES6', N'Bank transfer', CAST(438.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1357, N'CUS018', N'DCO2', N'Bank transfer', CAST(184.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1358, N'CUS027', N'DES1', N'Cash', CAST(1344.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1359, N'CUS015', N'DES5', N'Bank transfer', CAST(84.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1360, N'CUS029', N'DES2', N'Cash', CAST(960.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1361, N'CUS04', N'CHA5', N'Cash', CAST(133.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1362, N'CUS017', N'DES6', N'Cash', CAST(73.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1363, N'CUS042', N'DCO4', N'Cash', CAST(190.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1364, N'CUS06', N'CHA2', N'Bank transfer', CAST(510.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1365, N'CUS06', N'DCO4', N'Bank transfer', CAST(760.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1366, N'CUS039', N'DCO5', N'Bank transfer', CAST(1568.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1367, N'CUS043', N'DCO4', N'Bank transfer', CAST(475.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1368, N'CUS07', N'CHA3', N'Cash', CAST(312.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1369, N'CUS08', N'CHA3', N'Bank transfer', CAST(312.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1370, N'CUS019', N'CHA7', N'Bank transfer', CAST(1440.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1371, N'CUS013', N'DCO2', N'Cash', CAST(1288.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1372, N'CUS03', N'DES5', N'Cash', CAST(504.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1373, N'CUS035', N'CHA9', N'Bank transfer', CAST(1840.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1374, N'CUS044', N'CHA8', N'Bank transfer', CAST(182.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1375, N'CUS030', N'CHA6', N'Bank transfer', CAST(1530.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1376, N'CUS011', N'DES1', N'Bank transfer', CAST(672.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1377, N'CUS03', N'DCO2', N'Bank transfer', CAST(736.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1378, N'CUS04', N'CHA9', N'Bank transfer', CAST(736.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1379, N'CUS011', N'DCO5', N'Bank transfer', CAST(1372.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1380, N'CUS034', N'DCO7', N'Cash', CAST(414.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1381, N'CUS036', N'DES1', N'Cash', CAST(1008.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1382, N'CUS045', N'CHA5', N'Bank transfer', CAST(1064.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1383, N'CUS028', N'DCO2', N'Bank transfer', CAST(1472.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1384, N'CUS011', N'DCO6', N'Bank transfer', CAST(950.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1385, N'CUS029', N'CHA6', N'Cash', CAST(153.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1386, N'CUS037', N'DES3', N'Bank transfer', CAST(182.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1387, N'CUS03', N'DES6', N'Cash', CAST(146.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1388, N'CUS045', N'DCO7', N'Cash', CAST(345.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1389, N'CUS015', N'DES6', N'Bank transfer', CAST(438.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1390, N'CUS020', N'DCO4', N'Cash', CAST(475.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1391, N'CUS07', N'DCO4', N'Bank transfer', CAST(665.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1392, N'CUS036', N'CHA2', N'Cash', CAST(1020.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1394, N'CUS036', N'DES4', N'Cash', CAST(620.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1395, N'CUS027', N'DES5', N'Cash', CAST(672.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1396, N'CUS028', N'DCO2', N'Cash', CAST(736.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1397, N'CUS044', N'DCO6', N'Bank transfer', CAST(1330.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1398, N'CUS036', N'DCO2', N'Bank transfer', CAST(184.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1399, N'CUS08', N'CHA7', N'Bank transfer', CAST(160.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1400, N'CUS07', N'DCO2', N'Cash', CAST(1104.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1401, N'CUS034', N'DCO6', N'Cash', CAST(950.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1402, N'CUS032', N'DCO5', N'Bank transfer', CAST(1372.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1405, N'CUS034', N'DCO7', N'Cash', CAST(138.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1406, N'CUS017', N'CHA3', N'Cash', CAST(520.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1407, N'CUS026', N'DCO5', N'Bank transfer', CAST(1176.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1408, N'CUS019', N'DES2', N'Cash', CAST(576.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1409, N'CUS03', N'DCO7', N'Bank transfer', CAST(621.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1410, N'CUS039', N'DCO6', N'Cash', CAST(1900.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1411, N'CUS018', N'DES2', N'Cash', CAST(384.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1412, N'CUS028', N'CHA7', N'Bank transfer', CAST(160.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1413, N'CUS015', N'CHA7', N'Bank transfer', CAST(960.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1414, N'CUS014', N'CHA5', N'Bank transfer', CAST(798.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1415, N'CUS028', N'CHA3', N'Bank transfer', CAST(208.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1416, N'CUS036', N'DES2', N'Cash', CAST(768.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1417, N'CUS029', N'DCO4', N'Cash', CAST(190.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1418, N'CUS039', N'DCO5', N'Bank transfer', CAST(1568.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1419, N'CUS039', N'CHA3', N'Bank transfer', CAST(416.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1420, N'CUS01', N'DES3', N'Bank transfer', CAST(455.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1421, N'CUS029', N'DES2', N'Cash', CAST(1152.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1422, N'CUS014', N'DES5', N'Bank transfer', CAST(840.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1423, N'CUS031', N'DES3', N'Bank transfer', CAST(182.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1424, N'CUS030', N'CHA9', N'Bank transfer', CAST(736.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1425, N'CUS027', N'DES2', N'Cash', CAST(1920.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1426, N'CUS019', N'DCO1', N'Bank transfer', CAST(378.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1427, N'CUS043', N'DCO5', N'Bank transfer', CAST(784.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1428, N'CUS017', N'DES5', N'Cash', CAST(672.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1429, N'CUS045', N'DCO5', N'Cash', CAST(1960.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1430, N'CUS02', N'CHA2', N'Cash', CAST(204.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1431, N'CUS09', N'CHA9', N'Cash', CAST(1104.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1433, N'CUS01', N'DCO7', N'Bank transfer', CAST(414.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1434, N'CUS03', N'CHA9', N'Cash', CAST(368.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1435, N'CUS09', N'DCO6', N'Cash', CAST(950.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1436, N'CUS037', N'CHA9', N'Bank transfer', CAST(368.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1438, N'CUS012', N'DES4', N'Cash', CAST(248.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1439, N'CUS030', N'DES6', N'Cash', CAST(657.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1440, N'CUS012', N'CHA7', N'Cash', CAST(1280.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1441, N'CUS036', N'DCO7', N'Bank transfer', CAST(276.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1442, N'CUS031', N'DCO6', N'Cash', CAST(1330.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1444, N'CUS026', N'DCO2', N'Cash', CAST(736.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1446, N'CUS034', N'CHA9', N'Cash', CAST(2208.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1447, N'CUS044', N'DCO1', N'Cash', CAST(882.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1448, N'CUS019', N'CHA5', N'Bank transfer', CAST(1064.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1449, N'CUS014', N'DCO1', N'Bank transfer', CAST(504.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1450, N'CUS031', N'CHA7', N'Bank transfer', CAST(960.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1451, N'CUS018', N'DCO4', N'Cash', CAST(570.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1452, N'CUS020', N'DES5', N'Bank transfer', CAST(588.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1453, N'CUS034', N'DES5', N'Bank transfer', CAST(420.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1454, N'CUS039', N'CHA8', N'Cash', CAST(273.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1455, N'CUS031', N'DES5', N'Cash', CAST(588.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1456, N'CUS05', N'DCO5', N'Bank transfer', CAST(196.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1457, N'CUS037', N'CHA5', N'Cash', CAST(532.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1458, N'CUS09', N'DCO6', N'Cash', CAST(1710.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1459, N'CUS07', N'DES3', N'Cash', CAST(819.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1460, N'CUS09', N'CHA5', N'Cash', CAST(532.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1461, N'CUS019', N'DCO4', N'Bank transfer', CAST(570.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1462, N'CUS011', N'DCO7', N'Bank transfer', CAST(69.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1463, N'CUS043', N'CHA8', N'Bank transfer', CAST(637.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1464, N'CUS042', N'DES3', N'Cash', CAST(455.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1465, N'CUS015', N'CHA6', N'Cash', CAST(459.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1467, N'CUS028', N'DES3', N'Cash', CAST(182.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1468, N'CUS028', N'CHA8', N'Bank transfer', CAST(728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1469, N'CUS05', N'DES1', N'Cash', CAST(1008.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1470, N'CUS039', N'DCO2', N'Bank transfer', CAST(736.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1471, N'CUS012', N'DES5', N'Bank transfer', CAST(756.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1472, N'CUS032', N'CHA8', N'Bank transfer', CAST(819.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1473, N'CUS027', N'DCO3', N'Cash', CAST(1044.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1474, N'CUS043', N'DES1', N'Bank transfer', CAST(1008.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1475, N'CUS041', N'DCO3', N'Bank transfer', CAST(116.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1476, N'CUS02', N'CHA3', N'Cash', CAST(728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1477, N'CUS017', N'DES3', N'Cash', CAST(91.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1478, N'CUS031', N'DCO4', N'Cash', CAST(570.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1479, N'CUS02', N'DES2', N'Cash', CAST(576.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1480, N'CUS012', N'DCO5', N'Bank transfer', CAST(196.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1481, N'CUS031', N'CHA3', N'Cash', CAST(624.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1483, N'CUS04', N'CHA9', N'Cash', CAST(368.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1484, N'CUS041', N'CHA3', N'Cash', CAST(1560.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1485, N'CUS019', N'DES4', N'Cash', CAST(496.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1486, N'CUS07', N'CHA8', N'Cash', CAST(728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1488, N'CUS016', N'DCO3', N'Cash', CAST(580.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1489, N'CUS040', N'DES4', N'Bank transfer', CAST(1240.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1490, N'CUS045', N'CHA7', N'Cash', CAST(1280.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1492, N'CUS02', N'DCO4', N'Cash', CAST(190.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1493, N'CUS01', N'CHA6', N'Bank transfer', CAST(153.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1494, N'CUS07', N'DES1', N'Cash', CAST(336.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1495, N'CUS027', N'DES2', N'Bank transfer', CAST(1536.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1496, N'CUS028', N'DES2', N'Bank transfer', CAST(1152.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1497, N'CUS01', N'DES2', N'Cash', CAST(384.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1498, N'CUS037', N'CHA3', N'Bank transfer', CAST(104.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1499, N'CUS037', N'CHA2', N'Cash', CAST(714.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1500, N'CUS09', N'CHA8', N'Cash', CAST(819.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1501, N'CUS042', N'DCO1', N'Bank transfer', CAST(2520.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1502, N'CUS038', N'DCO3', N'Cash', CAST(1160.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1503, N'CUS045', N'DCO2', N'Cash', CAST(368.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1504, N'CUS06', N'CHA5', N'Bank transfer', CAST(798.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1505, N'CUS036', N'DES3', N'Cash', CAST(819.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1506, N'CUS014', N'DES1', N'Bank transfer', CAST(1008.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1507, N'CUS015', N'CHA7', N'Bank transfer', CAST(960.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1508, N'CUS01', N'DES2', N'Bank transfer', CAST(1344.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1510, N'CUS039', N'CHA8', N'Cash', CAST(728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1511, N'CUS020', N'DES4', N'Bank transfer', CAST(744.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1512, N'CUS010', N'DCO6', N'Bank transfer', CAST(380.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1513, N'CUS041', N'CHA3', N'Cash', CAST(208.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1514, N'CUS044', N'DES1', N'Bank transfer', CAST(1344.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1515, N'CUS026', N'CHA2', N'Cash', CAST(102.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1516, N'CUS042', N'DES4', N'Bank transfer', CAST(744.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1517, N'CUS040', N'DCO2', N'Cash', CAST(368.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1518, N'CUS039', N'DES1', N'Bank transfer', CAST(336.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1519, N'CUS019', N'DES4', N'Cash', CAST(124.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1520, N'CUS019', N'DES3', N'Bank transfer', CAST(728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1521, N'CUS045', N'CHA8', N'Bank transfer', CAST(637.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1522, N'CUS010', N'DCO1', N'Cash', CAST(1260.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1523, N'CUS019', N'CHA9', N'Bank transfer', CAST(1104.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1524, N'CUS045', N'CHA8', N'Bank transfer', CAST(91.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1525, N'CUS031', N'CHA3', N'Cash', CAST(208.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1526, N'CUS017', N'DES6', N'Bank transfer', CAST(584.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1527, N'CUS026', N'CHA3', N'Cash', CAST(832.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1528, N'CUS043', N'DCO5', N'Bank transfer', CAST(1764.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1529, N'CUS018', N'DES2', N'Bank transfer', CAST(1920.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1530, N'CUS030', N'DES1', N'Bank transfer', CAST(168.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1531, N'CUS010', N'CHA8', N'Bank transfer', CAST(819.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1532, N'CUS028', N'CHA6', N'Cash', CAST(459.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1533, N'CUS034', N'DCO5', N'Cash', CAST(1568.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1535, N'CUS041', N'DCO7', N'Cash', CAST(621.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1536, N'CUS034', N'CHA7', N'Cash', CAST(960.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1537, N'CUS06', N'CHA9', N'Bank transfer', CAST(184.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1539, N'CUS06', N'CHA9', N'Cash', CAST(736.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1540, N'CUS028', N'CHA3', N'Bank transfer', CAST(728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1541, N'CUS012', N'DCO5', N'Cash', CAST(1764.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1542, N'CUS033', N'CHA5', N'Bank transfer', CAST(665.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1543, N'CUS030', N'DES2', N'Bank transfer', CAST(960.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1544, N'CUS020', N'CHA9', N'Bank transfer', CAST(552.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1545, N'CUS045', N'CHA2', N'Bank transfer', CAST(816.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1546, N'CUS032', N'DCO1', N'Cash', CAST(882.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1547, N'CUS03', N'DES3', N'Cash', CAST(455.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1548, N'CUS039', N'DCO4', N'Cash', CAST(855.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1549, N'CUS018', N'DCO1', N'Cash', CAST(756.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1550, N'CUS011', N'CHA9', N'Cash', CAST(1288.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1551, N'CUS028', N'DCO3', N'Bank transfer', CAST(580.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1552, N'CUS016', N'DES2', N'Bank transfer', CAST(1920.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1553, N'CUS029', N'DES4', N'Bank transfer', CAST(248.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1554, N'CUS034', N'DCO2', N'Bank transfer', CAST(1288.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1555, N'CUS018', N'DCO1', N'Bank transfer', CAST(630.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1556, N'CUS011', N'CHA6', N'Cash', CAST(1377.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1557, N'CUS037', N'DCO1', N'Bank transfer', CAST(882.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1559, N'CUS042', N'DES3', N'Bank transfer', CAST(728.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1560, N'CUS033', N'DES6', N'Bank transfer', CAST(657.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1561, N'CUS029', N'DCO3', N'Cash', CAST(696.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1562, N'CUS011', N'DCO3', N'Bank transfer', CAST(812.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1564, N'CUS035', N'DCO3', N'Cash', CAST(812.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1565, N'CUS014', N'DCO3', N'Cash', CAST(116.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1566, N'CUS041', N'DES5', N'Bank transfer', CAST(588.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1567, N'CUS020', N'DES4', N'Bank transfer', CAST(744.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1568, N'CUS044', N'DES6', N'Cash', CAST(146.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1569, N'CUS05', N'DES5', N'Cash', CAST(672.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1570, N'CUS02', N'CHA5', N'Bank transfer', CAST(1330.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1571, N'CUS030', N'DES3', N'Bank transfer', CAST(910.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1572, N'CUS015', N'DCO2', N'Bank transfer', CAST(1840.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1573, N'CUS041', N'DES2', N'Bank transfer', CAST(192.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1574, N'CUS018', N'DCO5', N'Bank transfer', CAST(588.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1575, N'CUS041', N'DES2', N'Cash', CAST(1920.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1576, N'CUS016', N'DES6', N'Cash', CAST(657.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1577, N'CUS019', N'DCO6', N'Cash', CAST(1520.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1578, N'CUS020', N'DES6', N'Bank transfer', CAST(730.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1580, N'CUS037', N'DCO5', N'Cash', CAST(980.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1581, N'CUS036', N'DES4', N'Bank transfer', CAST(868.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1582, N'CUS016', N'DES2', N'Bank transfer', CAST(1920.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1583, N'CUS043', N'DCO2', N'Cash', CAST(1656.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1584, N'CUS028', N'DCO5', N'Cash', CAST(980.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1585, N'CUS020', N'DES4', N'Cash', CAST(248.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1586, N'CUS032', N'DCO1', N'Bank transfer', CAST(882.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1587, N'CUS013', N'DES4', N'Cash', CAST(992.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1588, N'CUS039', N'DCO4', N'Bank transfer', CAST(190.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1589, N'CUS019', N'DES1', N'Bank transfer', CAST(840.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1590, N'CUS042', N'CHA6', N'Bank transfer', CAST(1530.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1591, N'CUS08', N'DES3', N'Bank transfer', CAST(364.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1592, N'CUS011', N'DES1', N'Bank transfer', CAST(1344.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1593, N'CUS027', N'CHA3', N'Bank transfer', CAST(624.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1595, N'CUS043', N'DES4', N'Cash', CAST(248.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1596, N'CUS02', N'DCO4', N'Cash', CAST(380.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1597, N'CUS03', N'DCO2', N'Bank transfer', CAST(552.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1598, N'CUS020', N'CHA8', N'Cash', CAST(273.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1599, N'CUS038', N'DCO1', N'Bank transfer', CAST(126.00 AS Decimal(10, 2)), N'Utah')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1600, N'CUS030', N'DCO3', N'Bank transfer', CAST(232.00 AS Decimal(10, 2)), N'West Virginia')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1888, N'CUS028', N'DES3', N'Bank transfer', CAST(364.06 AS Decimal(10, 2)), N'Massachusetts')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (1919, N'CUS034', N'DCO7', N'Bank transfer', CAST(9.00 AS Decimal(10, 2)), N'Atlanta')
GO
INSERT [dbo].[PAID] ([OrderID], [CusID], [ProID], [PaymentMethod], [Payment], [ShipDestination]) VALUES (8806, N'CUS044', N'CHA6', N'Cash', CAST(10.00 AS Decimal(10, 2)), N'Connecticut')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'CHA2', N'Beads Sofa', N'chair_2.png', 55, N'Eva', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(102.00 AS Decimal(10, 2)), N'CHA')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'CHA3', N'Modern Chair', N'chair_3.png', 31, N'Alice', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(104.00 AS Decimal(10, 2)), N'CHA')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'CHA5', N'Pink Armchair', N'chair_5.png', 48, N'Susan K', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(133.00 AS Decimal(10, 2)), N'CHA')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'CHA6', N'High Pink Armchair', N'chair_6.png', 44, N'Alice', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(153.00 AS Decimal(10, 2)), N'CHA')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'CHA7', N'Leather Armchair', N'chair_7.png', 47, N'Charlie', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(160.00 AS Decimal(10, 2)), N'CHA')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'CHA8', N'Bamboo Armchair', N'chair_8.png', 17, N'Ivy', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(91.00 AS Decimal(10, 2)), N'CHA')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'CHA9', N'Knitting Armchair', N'chair_9.png', 27, N'Eva', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(184.00 AS Decimal(10, 2)), N'CHA')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DCO1', N'Sansevieria trifasciata', N'decoration_1.png', 13, N'Charlie', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(126.00 AS Decimal(10, 2)), N'DCO')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DCO2', N'Lamp 3-legged', N'decoration_2.png', 30, N'Eva', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(184.00 AS Decimal(10, 2)), N'DCO')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DCO3', N'Mirror', N'decoration_3.png', 33, N'Grace', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(116.00 AS Decimal(10, 2)), N'DCO')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DCO4', N'Lamp 1-legged', N'decoration_4.png', 10, N'Alice', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(95.00 AS Decimal(10, 2)), N'DCO')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DCO5', N'Mirror with Light', N'decoration_5.png', 45, N'Susan K', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(196.00 AS Decimal(10, 2)), N'DCO')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DCO6', N'Tree Decoration', N'decoration_6.png', 18, N'Grace', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(190.00 AS Decimal(10, 2)), N'DCO')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DCO7', N'Rocks and Box', N'decoration_7.png', 22, N'Susan K', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(69.00 AS Decimal(10, 2)), N'DCO')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DES1', N'Desk 0.6m', N'desk_1.png', 28, N'Charlie', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(165.00 AS Decimal(10, 2)), N'DES')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DES2', N'Desk 0.5m', N'desk_2.png', 47, N'Susan K', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(192.00 AS Decimal(10, 2)), N'DES')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DES3', N'Desk 0.7m', N'desk_3.png', 37, N'Grace', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(91.00 AS Decimal(10, 2)), N'DES')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DES4', N'Cabinet 2 drawers', N'desk_4.png', 42, N'Harry', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(124.00 AS Decimal(10, 2)), N'DES')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DES5', N'Desk 3 drawers', N'desk_5.png', 44, N'Charlie', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(84.00 AS Decimal(10, 2)), N'DES')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'DES6', N'Desk 3 cabinets', N'desk_6.png', 9, N'Harry', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', CAST(73.00 AS Decimal(10, 2)), N'DES')
GO
INSERT [dbo].[Products] ([ProID], [ProName], [Picture], [Quantity], [Designers], [LongDes], [Price], [CategoryID]) VALUES (N'r', N'linh', N'linh.png', 222, N'Linh', N'qwertyuiop', CAST(300.00 AS Decimal(10, 2)), N'DES')
GO
ALTER TABLE [dbo].[AccountDetails]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([UserID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CusID])
REFERENCES [dbo].[Account] ([UserID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Products] ([ProID])
GO
ALTER TABLE [dbo].[PAID]  WITH CHECK ADD FOREIGN KEY([CusID])
REFERENCES [dbo].[Account] ([UserID])
GO
ALTER TABLE [dbo].[PAID]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Products] ([ProID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
/****** Object:  StoredProcedure [dbo].[InsertRandomAmericanStates]    Script Date: 14/06/2024 3:22:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertRandomAmericanStates]
AS
BEGIN
    DECLARE @States TABLE (
        StateName VARCHAR(100)
    );

    INSERT INTO @States (StateName)
    VALUES
        ('Alabama'), ('Alaska'), ('Arizona'), ('Arkansas'), ('California'),
        ('Colorado'), ('Connecticut'), ('Delaware'), ('Florida'), ('Georgia'),
        ('Hawaii'), ('Idaho'), ('Illinois'), ('Indiana'), ('Iowa'),
        ('Kansas'), ('Kentucky'), ('Louisiana'), ('Maine'), ('Maryland'),
        ('Massachusetts'), ('Michigan'), ('Minnesota'), ('Mississippi'), ('Missouri'),
        ('Montana'), ('Nebraska'), ('Nevada'), ('New Hampshire'), ('New Jersey'),
        ('New Mexico'), ('New York'), ('North Carolina'), ('North Dakota'), ('Ohio'),
        ('Oklahoma'), ('Oregon'), ('Pennsylvania'), ('Rhode Island'), ('South Carolina'),
        ('South Dakota'), ('Tennessee'), ('Texas'), ('Utah'), ('Vermont'),
        ('Virginia'), ('Washington'), ('West Virginia'), ('Wisconsin'), ('Wyoming');

    INSERT INTO Orders (ShipDestination)
    SELECT TOP (3) StateName
    FROM @States
    ORDER BY NEWID(); -- Randomly select states
END;
GO
/****** Object:  StoredProcedure [dbo].[Old_UpdateOrderShipDestinations]    Script Date: 14/06/2024 3:22:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Old_UpdateOrderShipDestinations]
AS
BEGIN
    DECLARE @ShipDestination VARCHAR(100); -- Adjust the size as per your requirement
    DECLARE @OrderID INT;

    -- List of American states
    DECLARE @States TABLE (
        StateName VARCHAR(100)
    );

    INSERT INTO @States (StateName)
    VALUES
        ('Alabama'), ('Alaska'), ('Arizona'), ('Arkansas'), ('California'),
        ('Colorado'), ('Connecticut'), ('Delaware'), ('Florida'), ('Georgia'),
        ('Hawaii'), ('Idaho'), ('Illinois'), ('Indiana'), ('Iowa'),
        ('Kansas'), ('Kentucky'), ('Louisiana'), ('Maine'), ('Maryland'),
        ('Massachusetts'), ('Michigan'), ('Minnesota'), ('Mississippi'), ('Missouri'),
        ('Montana'), ('Nebraska'), ('Nevada'), ('New Hampshire'), ('New Jersey'),
        ('New Mexico'), ('New York'), ('North Carolina'), ('North Dakota'), ('Ohio'),
        ('Oklahoma'), ('Oregon'), ('Pennsylvania'), ('Rhode Island'), ('South Carolina'),
        ('South Dakota'), ('Tennessee'), ('Texas'), ('Utah'), ('Vermont'),
        ('Virginia'), ('Washington'), ('West Virginia'), ('Wisconsin'), ('Wyoming');

    -- Declare a cursor to loop through all OrderIDs
    DECLARE OrderCursor CURSOR FOR
    SELECT OrderID
    FROM Orders;

    -- Open the cursor
    OPEN OrderCursor;

    -- Fetch the first OrderID
    FETCH NEXT FROM OrderCursor INTO @OrderID;

    -- Loop through each OrderID
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Generate random ship destination
        SET @ShipDestination = (
            SELECT TOP 1 StateName
            FROM @States
            ORDER BY NEWID() -- Randomly select state
        );

        -- Update ship destination for the current OrderID
        UPDATE Orders
        SET @ShipDestination = @ShipDestination
        WHERE OrderID = @OrderID;

        -- Fetch the next OrderID
        FETCH NEXT FROM OrderCursor INTO @OrderID;
    END

    -- Close and deallocate the cursor
    CLOSE OrderCursor;
    DEALLOCATE OrderCursor;
END;

GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderShipDestinations]    Script Date: 14/06/2024 3:22:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOrderShipDestinations]
AS
BEGIN
    DECLARE @ShipDestination VARCHAR(100); -- Adjust the size as per your requirement
    DECLARE @OrderID INT;

    -- List of American states
    DECLARE @States TABLE (
        StateName VARCHAR(100)
    );

    INSERT INTO @States (StateName)
    VALUES
        ('Alabama'), ('Alaska'), ('Arizona'), ('Arkansas'), ('California'),
        ('Colorado'), ('Connecticut'), ('Delaware'), ('Florida'), ('Georgia'),
        ('Hawaii'), ('Idaho'), ('Illinois'), ('Indiana'), ('Iowa'),
        ('Kansas'), ('Kentucky'), ('Louisiana'), ('Maine'), ('Maryland'),
        ('Massachusetts'), ('Michigan'), ('Minnesota'), ('Mississippi'), ('Missouri'),
        ('Montana'), ('Nebraska'), ('Nevada'), ('New Hampshire'), ('New Jersey'),
        ('New Mexico'), ('New York'), ('North Carolina'), ('North Dakota'), ('Ohio'),
        ('Oklahoma'), ('Oregon'), ('Pennsylvania'), ('Rhode Island'), ('South Carolina'),
        ('South Dakota'), ('Tennessee'), ('Texas'), ('Utah'), ('Vermont'),
        ('Virginia'), ('Washington'), ('West Virginia'), ('Wisconsin'), ('Wyoming');

    -- Declare a cursor to loop through all OrderIDs
    DECLARE OrderCursor CURSOR FOR
    SELECT OrderID
    FROM Orders;

    -- Open the cursor
    OPEN OrderCursor;

    -- Fetch the first OrderID
    FETCH NEXT FROM OrderCursor INTO @OrderID;

    -- Loop through each OrderID
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Generate random ship destination
        SET @ShipDestination = (
            SELECT TOP 1 StateName
            FROM @States
            ORDER BY NEWID() -- Randomly select state
        );

        -- Update ship destination for the current OrderID
        UPDATE Orders
        SET [ShipDestination] = @ShipDestination
        WHERE OrderID = @OrderID;

        -- Fetch the next OrderID
        FETCH NEXT FROM OrderCursor INTO @OrderID;
    END

    -- Close and deallocate the cursor
    CLOSE OrderCursor;
    DEALLOCATE OrderCursor;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductQuantity]    Script Date: 14/06/2024 3:22:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProductQuantity]
AS
BEGIN
    UPDATE Products
    SET Quantity = ROUND(RAND() * (50 - 5) + 5, 0)
    WHERE Quantity BETWEEN 5 AND 50;
END;

EXEC UpdateProductQuantity;

GO
/****** Object:  StoredProcedure [dbo].[UpdateProductQuantityForIDs]    Script Date: 14/06/2024 3:22:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProductQuantityForIDs]
AS
BEGIN
    DECLARE @ProID VARCHAR(10);
    DECLARE @RandomQuantity INT;

    -- Declare a table variable to store the provided product IDs
    DECLARE @ProductIDs TABLE (ProID VARCHAR(10));

    -- Insert the provided product IDs into the table variable
    INSERT INTO @ProductIDs (ProID)
    VALUES 
    ('CHA2'), ('CHA3'), ('CHA5'), ('CHA6'), ('CHA7'), ('CHA8'), ('CHA9'),
    ('DCO1'), ('DCO2'), ('DCO3'), ('DCO4'), ('DCO5'), ('DCO6'), ('DCO7'),
    ('DES1'), ('DES2'), ('DES3'), ('DES4'), ('DES5'), ('DES6');

    -- Declare a cursor to loop through the provided product IDs
    DECLARE product_cursor CURSOR FOR
    SELECT ProID
    FROM @ProductIDs;

    -- Open the cursor
    OPEN product_cursor;

    -- Fetch the first row
    FETCH NEXT FROM product_cursor INTO @ProID;

    -- Loop through each provided product
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Generate a random quantity between 5 and 50
        SET @RandomQuantity = ROUND(RAND() * (50 - 5) + 5, 0);

        -- Update the quantity for the current product
        UPDATE Products
        SET Quantity = @RandomQuantity
        WHERE ProID = @ProID;

        -- Fetch the next row
        FETCH NEXT FROM product_cursor INTO @ProID;
    END;

    -- Close and deallocate the cursor
    CLOSE product_cursor;
    DEALLOCATE product_cursor;
END;

EXEC UpdateProductQuantityForIDs;
GO
USE [master]
GO
ALTER DATABASE [Interior_2] SET  READ_WRITE 
GO
