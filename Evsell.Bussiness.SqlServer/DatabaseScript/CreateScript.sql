USE [master]
GO
/****** Object:  Database [evsellDb]    Script Date: 5.11.2023 13:03:59 ******/
CREATE DATABASE [evsellDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'evsellDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\evsellDb.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'evsellDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\evsellDb_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [evsellDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [evsellDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [evsellDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [evsellDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [evsellDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [evsellDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [evsellDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [evsellDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [evsellDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [evsellDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [evsellDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [evsellDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [evsellDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [evsellDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [evsellDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [evsellDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [evsellDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [evsellDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [evsellDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [evsellDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [evsellDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [evsellDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [evsellDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [evsellDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [evsellDb] SET RECOVERY FULL 
GO
ALTER DATABASE [evsellDb] SET  MULTI_USER 
GO
ALTER DATABASE [evsellDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [evsellDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [evsellDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [evsellDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [evsellDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [evsellDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'evsellDb', N'ON'
GO
ALTER DATABASE [evsellDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [evsellDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [evsellDb]
GO
/****** Object:  Table [dbo].[Basket]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [int] NOT NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BasketLog]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NULL,
	[ProductId] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[IsInput] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [int] NOT NULL,
 CONSTRAINT [PK_BasketLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserId] [int] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnumUserType]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnumUserType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_EnumUserType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HtmlEmailPages]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HtmlEmailPages](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Page] [varchar](max) NOT NULL,
 CONSTRAINT [PK_HtmlEmailPages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyerUserId] [int] NOT NULL,
	[SellerCompanyId] [int] NOT NULL,
	[TransactionDateTime] [datetime] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[VatTotal] [decimal](18, 2) NOT NULL,
	[GrandTotal] [decimal](18, 2) NOT NULL,
	[IsCancelled] [bit] NOT NULL,
	[StatusId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [int] NOT NULL,
	[CancelDate] [datetime] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceProduct]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductPrice] [decimal](18, 2) NOT NULL,
	[ProductVat] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[Tax] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[LineTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_InvoiceProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceStatusLog]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceStatusLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [int] NOT NULL,
 CONSTRAINT [PK_InvoiceStatusLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogHttp]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogHttp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestRaw] [nvarchar](max) NOT NULL,
	[RequestDateTime] [datetime] NOT NULL,
	[ResponseRaw] [nvarchar](max) NOT NULL,
	[ResponseDateTime] [datetime] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LogHttp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Image] [nvarchar](2048) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Stock] [int] NOT NULL,
	[Tax] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductComment]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Header] [nvarchar](255) NOT NULL,
	[Comments] [nvarchar](255) NOT NULL,
	[ProductRate] [int] NOT NULL,
 CONSTRAINT [PK_Product_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStockLog]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStockLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[IsInput] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [int] NOT NULL,
 CONSTRAINT [PK_ProductStockLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5.11.2023 13:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [int] NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[FirtsName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Basket] ON 

INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (7, 1003, 4, 1, CAST(N'2023-04-17T12:43:04.570' AS DateTime), 1003)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (18, 3010, 7, 2, CAST(N'2023-04-17T18:35:49.663' AS DateTime), 3010)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (20, 5009, 4, 2, CAST(N'2023-04-17T19:00:58.617' AS DateTime), 5009)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (28, 1011, 7, 4, CAST(N'2023-04-20T16:29:16.490' AS DateTime), 1011)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (30, 1011, 4, 10, CAST(N'2023-04-20T16:31:14.540' AS DateTime), 1011)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (36, 1012, 4, 10, CAST(N'2023-04-20T16:50:27.920' AS DateTime), 1012)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (42, 4, 4, 2, CAST(N'2023-04-20T18:21:11.460' AS DateTime), 4)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (43, 4, 4, 4, CAST(N'2023-04-20T18:21:11.460' AS DateTime), 4)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (1028, 3, 4, 120, CAST(N'2023-04-24T13:01:50.267' AS DateTime), 3)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (1029, 3, 4, 30, CAST(N'2023-04-24T13:02:26.997' AS DateTime), 3)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (1030, 3, 7, 20, CAST(N'2023-04-24T13:02:27.003' AS DateTime), 3)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (1031, 2, 4, 20, CAST(N'2023-04-24T13:04:12.393' AS DateTime), 2)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (1032, 2, 4, 20, CAST(N'2023-04-24T13:04:25.653' AS DateTime), 2)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (1033, 2, 7, 10, CAST(N'2023-04-24T13:04:25.657' AS DateTime), 2)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (1040, 5, 7, 30, CAST(N'2023-04-24T13:13:52.680' AS DateTime), 5)
INSERT [dbo].[Basket] ([Id], [UserId], [ProductId], [Qty], [CreateDate], [CreateUserId]) VALUES (1041, 5, 4, 110, CAST(N'2023-04-24T13:13:52.680' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[Basket] OFF
GO
SET IDENTITY_INSERT [dbo].[BasketLog] ON 

INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T16:22:21.267' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (2, NULL, 4, 4, 1, 0, CAST(N'2023-04-20T16:22:21.307' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (3, NULL, 4, 1, 0, 0, CAST(N'2023-04-20T16:22:38.290' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (4, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T16:27:07.340' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (5, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T16:27:07.677' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (6, NULL, 7, 2, 1, 0, CAST(N'2023-04-20T16:27:07.690' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (7, NULL, 4, 3, 1, 0, CAST(N'2023-04-20T16:27:57.140' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (8, NULL, 4, 3, 1, 0, CAST(N'2023-04-20T16:28:48.033' AS DateTime), 1011)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (9, NULL, 4, 1, 1, 0, CAST(N'2023-04-20T16:29:01.243' AS DateTime), 1011)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (10, NULL, 7, 4, 1, 0, CAST(N'2023-04-20T16:29:16.483' AS DateTime), 1011)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (11, NULL, 4, 3, 1, 0, CAST(N'2023-04-20T16:29:39.433' AS DateTime), 1011)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (12, NULL, 4, 3, 1, 0, CAST(N'2023-04-20T16:31:10.063' AS DateTime), 1011)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (13, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T16:33:58.343' AS DateTime), 1012)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (14, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T16:34:57.853' AS DateTime), 1012)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (15, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T16:36:28.557' AS DateTime), 1012)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (16, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T16:36:29.843' AS DateTime), 1012)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (17, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T16:39:01.240' AS DateTime), 1012)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (18, NULL, 7, 2, 1, 0, CAST(N'2023-04-20T16:40:11.820' AS DateTime), 1012)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (19, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T16:50:06.950' AS DateTime), 1012)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (20, NULL, 4, 3, 1, 0, CAST(N'2023-04-20T18:18:58.620' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (21, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:19:41.843' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (22, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:21:03.083' AS DateTime), 4)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (23, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:21:11.450' AS DateTime), 4)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (24, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:27:55.790' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (25, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:31:12.683' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (26, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:31:18.250' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (27, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:32:50.797' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (28, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:35:42.843' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (29, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:35:47.677' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (30, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:37:52.030' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (31, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:38:16.227' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (32, NULL, 7, 2, 1, 0, CAST(N'2023-04-20T18:39:37.267' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (33, NULL, 4, 1, 1, 0, CAST(N'2023-04-20T18:40:45.583' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (34, NULL, 4, 1, 1, 0, CAST(N'2023-04-20T18:40:47.317' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (35, NULL, 4, 1, 1, 0, CAST(N'2023-04-20T18:41:07.773' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (36, NULL, 4, 1, 1, 0, CAST(N'2023-04-20T18:41:55.173' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (37, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:43:47.967' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (38, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:43:56.630' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (39, NULL, 4, 2, 1, 0, CAST(N'2023-04-20T18:43:56.633' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1002, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T12:50:07.900' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1003, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T12:52:33.063' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1004, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T12:52:57.503' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1005, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T12:52:57.507' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1006, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T12:56:45.503' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1007, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T12:57:28.220' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1008, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T12:59:12.950' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1009, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T12:59:47.173' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1010, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T12:59:47.177' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1011, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:01:50.260' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1012, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:01:50.263' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1013, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:01:50.267' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1014, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:02:26.990' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1015, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:02:26.993' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1016, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:02:26.997' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1017, NULL, 7, 10, 1, 0, CAST(N'2023-04-24T13:02:26.997' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1018, NULL, 7, 10, 1, 0, CAST(N'2023-04-24T13:02:27.000' AS DateTime), 3)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1019, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:04:12.273' AS DateTime), 2)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1020, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:04:12.377' AS DateTime), 2)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1021, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:04:25.633' AS DateTime), 2)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1022, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:04:25.650' AS DateTime), 2)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1023, NULL, 7, 10, 1, 0, CAST(N'2023-04-24T13:04:25.653' AS DateTime), 2)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1024, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:05:38.140' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1025, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:05:38.243' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1026, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:07:57.710' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1027, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:07:57.870' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1028, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:08:22.713' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1029, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:08:22.720' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1030, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:08:54.190' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1031, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:08:54.200' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1032, NULL, 7, 10, 1, 0, CAST(N'2023-04-24T13:08:54.200' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1033, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:10:36.057' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1034, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:10:36.213' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1035, NULL, 7, 10, 1, 0, CAST(N'2023-04-24T13:10:36.230' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1036, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:12:38.210' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1037, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:12:38.347' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1038, NULL, 7, 10, 1, 0, CAST(N'2023-04-24T13:12:38.360' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1039, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:13:17.053' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1040, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:13:17.053' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1041, NULL, 7, 10, 1, 0, CAST(N'2023-04-24T13:13:17.057' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1042, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:13:52.543' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1043, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:13:52.680' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1044, NULL, 7, 10, 1, 0, CAST(N'2023-04-24T13:13:52.680' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1045, NULL, 4, 10, 1, 0, CAST(N'2023-04-24T13:13:52.680' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1046, NULL, 4, 100, 1, 0, CAST(N'2023-04-24T14:46:29.187' AS DateTime), 5)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (1047, NULL, 4, 2, 1, 0, CAST(N'2023-04-24T14:58:00.550' AS DateTime), 10000)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (2002, NULL, 7, 2, 1, 0, CAST(N'2023-05-16T15:41:52.460' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (2003, NULL, 7, 2, 1, 0, CAST(N'2023-05-16T15:41:52.547' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (2004, NULL, 4, 3, 0, 1, CAST(N'2023-10-05T11:43:26.447' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (2005, NULL, 4, 3, 0, 0, CAST(N'2023-10-05T11:43:29.640' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (2006, NULL, 4, 3, 0, 1, CAST(N'2023-10-05T11:43:39.120' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (2007, NULL, 4, 2, 1, 0, CAST(N'2023-10-05T11:44:52.463' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (2008, NULL, 4, 2, 1, 0, CAST(N'2023-10-05T11:45:30.397' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (2009, NULL, 4, 3, 1, 0, CAST(N'2023-10-05T11:46:05.707' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (3004, NULL, 4, 2, 1, 0, CAST(N'2023-10-05T18:13:32.887' AS DateTime), 1)
INSERT [dbo].[BasketLog] ([Id], [InvoiceId], [ProductId], [Qty], [IsInput], [IsDeleted], [CreateDate], [CreateUserId]) VALUES (3005, NULL, 4, 2, 1, 0, CAST(N'2023-10-05T18:14:04.563' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[BasketLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (2, 1011, N'elmasium', 1, CAST(N'2023-02-20T14:34:41.077' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (1002, 3, N'APITEST', 1, CAST(N'2023-02-24T11:55:14.463' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (1003, 1012, N'hllTEST', 1, CAST(N'2023-02-24T11:58:33.970' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (1004, 1012, N'şirket', 1, CAST(N'2023-02-24T12:39:36.597' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (1005, 1, N'market', 1, CAST(N'2023-02-24T15:57:21.327' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (1006, 2009, N'asdasd', 1, CAST(N'2023-02-24T17:10:55.320' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (2002, 2009, N'asdglikasdgil', 1, CAST(N'2023-02-28T12:35:05.963' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (2003, 2009, N'safaf', 1, CAST(N'2023-02-28T13:56:04.727' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (3002, 3010, N'TESTTTTT', 1, CAST(N'2023-03-04T09:57:54.583' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (3004, 3009, N'test', 1, CAST(N'2023-03-04T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (3013, 3, N'aşdfaşk', 1, CAST(N'2023-03-04T10:04:50.973' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (3014, 5010, N'regex', 1, CAST(N'2023-03-04T16:45:11.640' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4005, 2009, N'cmpny', 1, CAST(N'2023-03-07T13:32:56.567' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4013, 3, N'asf', 1, CAST(N'2023-03-07T13:54:28.497' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4015, 3, N'testasdfas', 1, CAST(N'2023-03-07T13:55:04.750' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4017, 5009, N'testasdfasafsasdf', 1, CAST(N'2023-03-07T13:55:18.870' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4018, 3, N'Testing', 1, CAST(N'2023-03-07T16:57:44.913' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4020, 3, N'asfasfcafs', 1, CAST(N'2023-03-08T09:56:14.470' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4021, 3, N'heaghdgaadg', 1, CAST(N'2023-03-08T10:14:56.697' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4022, 3, N'ADGGADDGADGA', 1, CAST(N'2023-03-08T10:29:29.800' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4023, 3, N'agdfdg', 1, CAST(N'2023-03-08T10:42:14.470' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4024, 3, N'Testtttas', 1, CAST(N'2023-03-08T11:58:32.623' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4030, 3, N'asfgadgdgaadgadgg', 1, CAST(N'2023-03-14T10:57:46.977' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4031, 3, N'TESTDASTGAGD', 1, CAST(N'2023-03-14T11:00:20.063' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4033, 7038, N'Markettt', 1, CAST(N'2023-03-23T11:20:05.307' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Company] ([Id], [UserId], [Name], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (5032, 8056, N'NEWPROGRAMTEST', 1, CAST(N'2023-10-17T22:07:29.133' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
INSERT [dbo].[EnumUserType] ([Id], [Name]) VALUES (0, N'Customer')
INSERT [dbo].[EnumUserType] ([Id], [Name]) VALUES (1, N'Company')
INSERT [dbo].[EnumUserType] ([Id], [Name]) VALUES (2, N'Admin')
GO
INSERT [dbo].[HtmlEmailPages] ([Id], [Name], [Page]) VALUES (1, N'WelcomeEmail', N'<!DOCTYPE html><html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" lang="en"><head><title></title><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css"><link href="https://fonts.googleapis.com/css?family=Lora" rel="stylesheet" type="text/css"><style>*{box-sizing: border-box;}body{margin: 0;padding: 0;}a[x-apple-data-detectors]{color: inherit !important;text-decoration: inherit !important;}#MessageViewBody a{color: inherit;text-decoration: none;}p{line-height: inherit}.desktop_hide,.desktop_hide table{mso-hide: all;display: none;max-height: 0px;overflow: hidden;}.image_block img+div{display: none;}.menu_block.desktop_hide .menu-links span{mso-hide: all;}@media (max-width:620px){.desktop_hide table.icons-inner,.social_block.desktop_hide .social-table{display: inline-block !important;}.icons-inner{text-align: center;}.icons-inner td{margin: 0 auto;}.fullMobileWidth,.row-content{width: 100% !important;}.mobile_hide{display: none;}.stack .column{width: 100%;display: block;}.mobile_hide{min-height: 0;max-height: 0;max-width: 0;overflow: hidden;font-size: 0px;}.desktop_hide,.desktop_hide table{display: table !important;max-height: none !important;}}</style></head><body style="background-color: #FFFFFF; margin: 0; padding: 0; -webkit-text-size-adjust: none; text-size-adjust: none;"><table class="nl-container" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF;"><tbody><tr><td><table class="row row-1" align="center" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f7f6f5;"><tbody><tr><td><table class="row-content stack" align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #fff; color: #000000; width: 600.00px;" width="600.00"><tbody><tr><td class="column column-1" width="100%" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 15px; padding-top: 15px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"><table class="menu_block block-1" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"><tr><td class="pad" style="color:#072b52;font-family:''Lato'', Tahoma, Verdana, Segoe, sans-serif;font-size:13px;letter-spacing:2px;text-align:center;"><table width="100%" cellpadding="0" cellspacing="0" border="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"><tr><td class="alignment" style="text-align:center;font-size:0px;"><div class="menu-links"><a href="www.example.com" target="_self" style="mso-hide:false;padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;display:inline-block;color:#072b52;font-family:''Lato'', Tahoma, Verdana, Segoe, sans-serif;font-size:13px;text-decoration:none;letter-spacing:2px;">Market</a><span class="sep" style="font-size:13px;font-family:''Lato'', Tahoma, Verdana, Segoe, sans-serif;color:#072b52;">|</span><a href="www.example.com" target="_self" style="mso-hide:false;padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;display:inline-block;color:#072b52;font-family:''Lato'', Tahoma, Verdana, Segoe, sans-serif;font-size:13px;text-decoration:none;letter-spacing:2px;">Elektronik</a><span class="sep" style="font-size:13px;font-family:''Lato'', Tahoma, Verdana, Segoe, sans-serif;color:#072b52;">|</span><a href="www.example.com" target="_self" style="mso-hide:false;padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;display:inline-block;color:#072b52;font-family:''Lato'', Tahoma, Verdana, Segoe, sans-serif;font-size:13px;text-decoration:none;letter-spacing:2px;">Giyim</a><span class="sep" style="font-size:13px;font-family:''Lato'', Tahoma, Verdana, Segoe, sans-serif;color:#072b52;">|</span><a href="www.example.com" target="_self" style="mso-hide:false;padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;display:inline-block;color:#072b52;font-family:''Lato'', Tahoma, Verdana, Segoe, sans-serif;font-size:13px;text-decoration:none;letter-spacing:2px;">Ev & Yaşam</a></div></td></tr></table></td></tr></table></td></tr></tbody></table></td></tr></tbody></table><table class="row row-2" align="center" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f7f6f5;"><tbody><tr><td><table class="row-content stack" align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #072b52; color: #000000; width: 600.00px;" width="600.00"><tbody><tr><td class="column column-1" width="100%" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"><div class="spacer_block" style="height:20px;line-height:20px;font-size:1px;">&#8202;</div><table class="image_block block-2" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"><tr><td class="pad" style="width:100%;padding-right:0px;padding-left:0px;"><div class="alignment" align="center" style="line-height:10px"><img src="https://wixmp-fe53c9ff592a4da924211f23.wixmp.com/users/15dfc534-4331-4163-8b8e-5d50886c9943/design-previews/69886356-296a-42c8-af54-372dbc4a952f/1678727069555-thumbnail.jpeg" style="display: block; height: auto; border: 0; width: 150px; max-width: 100%;" width="150" alt="your-logo" title="your-logo"></div></td></tr></table><div class="spacer_block" style="height:20px;line-height:20px;font-size:1px;">&#8202;</div></td></tr></tbody></table></td></tr></tbody></table><table class="row row-3" align="center" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f7f6f5;"><tbody><tr><td><table class="row-content stack" align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #fff; color: #000000; width: 600.00px;" width="600.00"><tbody><tr><td class="column column-1" width="100%" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"><table class="image_block block-1" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"><tr><td class="pad" style="width:100%;padding-right:0px;padding-left:0px;"><div class="alignment" align="center" style="line-height:10px"><a href="https://www.hazirticaretsitesi.com/wp-content/uploads/eticaret-sitesi-masraflari.png" target="_blank" style="outline:none" tabindex="-1"><img class="fullMobileWidth" src="https://www.hazirticaretsitesi.com/wp-content/uploads/eticaret-sitesi-masraflari.png" style="display: block; height: auto; border: 0; width: 600px; max-width: 100%;" width="600" alt="hotel-bed" title="hotel-bed"></a></div></td></tr></table><table class="heading_block block-2" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"><tr><td class="pad" style="text-align:center;width:100%;"><h1 style="margin: 0; color: #555555; direction: ltr; font-family: Arial, Helvetica Neue, Helvetica, sans-serif; font-size: 32px; font-weight: 700; letter-spacing: normal; line-height: 120%; text-align: center; margin-top: 0; margin-bottom: 0;"><strong><br>Hoşgeldiniz{FirtsName}.</strong></h1></td></tr></table></td></tr></tbody></table></td></tr></tbody></table><table class="row row-4" align="center" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f7f6f5;"><tbody><tr><td><table class="row-content stack" align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #fff; color: #000000; width: 600.00px;" width="600.00"><tbody><tr><td class="column column-1" width="100%" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"><div class="spacer_block" style="height:30px;line-height:30px;font-size:1px;">&#8202;</div><table class="text_block block-2" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"><tr><td class="pad" style="padding-bottom:10px;padding-left:15px;padding-right:15px;padding-top:10px;"><div style="font-family: Tahoma, Verdana, sans-serif"><div class style="font-size: 12px; font-family: ''Lato'', Tahoma, Verdana, Segoe, sans-serif; mso-line-height-alt: 18px; color: #222222; line-height: 1.5;"><p style="margin: 0; font-size: 16px; text-align: center; mso-line-height-alt: 24px;"><span style="font-size:16px;"><strong>Bizi Tercih Ettiğiniz İçin Teşekkürler,</strong></span></p><p style="margin: 0; font-size: 16px; text-align: center; mso-line-height-alt: 18px;">&nbsp;</p><p style="margin: 0; font-size: 16px; text-align: center; mso-line-height-alt: 24px;"><span style="font-size:16px;">Evsell her Türlü Ürünü Satabiliceğiniz Ürün Yelpazesi Geniş Bi Eticaret Uygulamasıdır.</span></p><p style="margin: 0; font-size: 16px; text-align: center; mso-line-height-alt: 18px;">&nbsp;</p><p style="margin: 0; font-size: 16px; text-align: center; mso-line-height-alt: 24px;">Ayrıca Yeni bi Üye Girişi İle Dükkan açıp 84 Kategoride Dilediğiniz Ürünü Satabilirsiniz.</p><p style="margin: 0; font-size: 16px; text-align: center; mso-line-height-alt: 18px;">&nbsp;</p></div></div></td></tr></table><table class="heading_block block-3" width="100%" border="0" cellpadding="5" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"><tr><td class="pad"><h1 style="margin: 0; color: #072b52; direction: ltr; font-family: ''Lora'', Georgia, serif; font-size: 19px; font-weight: 400; letter-spacing: 1px; line-height: 120%; text-align: center; margin-top: 0; margin-bottom: 0;"><span class="tinyMce-placeholder">#Şirketinizi Etiketleyerek Bizimle Paylaşmaya Devam Edin</span></h1></td></tr></table></td></tr></tbody></table></td></tr></tbody></table><table class="row row-5" align="center" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f7f6f5;"><tbody><tr><td><table class="row-content stack" align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #fff; color: #000000; width: 600.00px;" width="600.00"><tbody><tr><td class="column column-1" width="100%" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"><div class="spacer_block" style="height:25px;line-height:25px;font-size:1px;">&#8202;</div></td></tr></tbody></table></td></tr></tbody></table><table class="row row-6" align="center" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f7f6f5;"><tbody><tr><td><table class="row-content stack" align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f7f6f5; color: #000000; width: 600.00px;" width="600.00"><tbody><tr><td class="column column-1" width="100%" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"><table class="html_block block-1" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"><tr><td class="pad"><div style="font-family:Arial, Helvetica Neue, Helvetica, sans-serif;text-align:center;" align="center"><div style="height:30px;">&nbsp;</div></div></td></tr></table><table class="social_block block-2" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"><tr><td class="pad" style="text-align:center;padding-right:0px;padding-left:0px;"><div class="alignment" align="center"><table class="social-table" width="168px" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; display: inline-block;"><tr><td style="padding:0 5px 0 5px;"><a href="https://www.facebook.com/" target="_blank"><img src="https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/t-only-logo-default-gray/facebook@2x.png" width="32" height="32" alt="Facebook" title="Facebook" style="display: block; height: auto; border: 0;"></a></td><td style="padding:0 5px 0 5px;"><a href="https://twitter.com/" target="_blank"><img src="https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/t-only-logo-default-gray/twitter@2x.png" width="32" height="32" alt="Twitter" title="Twitter" style="display: block; height: auto; border: 0;"></a></td><td style="padding:0 5px 0 5px;"><a href="https://instagram.com/" target="_blank"><img src="https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/t-only-logo-default-gray/instagram@2x.png" width="32" height="32" alt="Instagram" title="Instagram" style="display: block; height: auto; border: 0;"></a></td><td style="padding:0 5px 0 5px;"><a href="https://www.youtube.com/" target="_blank"><img src="https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/t-only-logo-default-gray/youtube@2x.png" width="32" height="32" alt="YouTube" title="YouTube" style="display: block; height: auto; border: 0;"></a></td></tr></table></div></td></tr></table><table class="html_block block-3" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"><tr><td class="pad"><div style="font-family:Arial, Helvetica Neue, Helvetica, sans-serif;text-align:center;" align="center"><div style="height:30px;">&nbsp;</div></div></td></tr></table></td></tr></tbody></table></td></tr></tbody></table><table class="row row-7" align="center" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f7f6f5;"><tbody><tr><td><table class="row-content stack" align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #072b52; color: #000000; width: 600.00px;" width="600.00"><tbody><tr><td class="column column-1" width="100%" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"><table class="text_block block-1" width="100%" border="0" cellpadding="10" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"><tr><td class="pad"><div style="font-family: Tahoma, Verdana, sans-serif"><div class style="font-size: 12px; font-family: ''Lato'', Tahoma, Verdana, Segoe, sans-serif; mso-line-height-alt: 14.399999999999999px; color: #f7f6f5; line-height: 1.2;"><p style="margin: 0; mso-line-height-alt: 14.399999999999999px;">&nbsp;</p><p style="margin: 0; text-align: center; mso-line-height-alt: 14.399999999999999px;"><a title="http://www.example.com/" href="http://www.example.com/" target="_blank" style="text-decoration: underline; color: #f7f6f5;" rel="noopener">Terms & Conditions</a></p><p style="margin: 0; text-align: center; mso-line-height-alt: 14.399999999999999px;">bizimle iletişime geçmekten çekinmeyin</p><p style="margin: 0; font-size: 12px; text-align: center; mso-line-height-alt: 14.399999999999999px;"><span style="color:#c0c0c0;"><br><br></span></p><p style="margin: 0; text-align: center; mso-line-height-alt: 14.399999999999999px;">© Copyright 2021. YourBrand All Rights Reserved.</p><p style="margin: 0; text-align: center; mso-line-height-alt: 14.399999999999999px;"><a title="http://www.example.com" href="http://www.example.com/" target="_blank" rel="noopener" style="color: #f7f6f5;">Manage Preferences</a> | <a title="http://www.example.com" href="http://www.example.com/" target="_blank" rel="noopener" style="color: #f7f6f5;">Unsubscribe</a></p><p style="margin: 0; font-size: 12px; text-align: center; mso-line-height-alt: 14.399999999999999px;"><span style="color:#c0c0c0;">&nbsp;</span></p></div></div></td></tr></table></td></tr></tbody></table></td></tr></tbody></table><table class="row row-8" align="center" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"><tbody><tr><td><table class="row-content stack" align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000000; width: 600.00px;" width="600.00"><tbody><tr><td class="column column-1" width="100%" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"><table class="icons_block block-1" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"><tr><td class="pad" style="vertical-align: middle; color: #9d9d9d; font-family: inherit; font-size: 15px; padding-bottom: 5px; padding-top: 5px; text-align: center;"><table width="100%" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"><tr><td class="alignment" style="vertical-align: middle; text-align: center;"><table class="icons-inner" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; display: inline-block; margin-right: -4px; padding-left: 0px; padding-right: 0px;" cellpadding="0" cellspacing="0" role="presentation"><tr><td style="vertical-align: middle; text-align: center; padding-top: 5px; padding-bottom: 5px; padding-left: 5px; padding-right: 6px;"><a href="https://www.designedwithbee.com/" target="_blank" style="text-decoration: none;"><img class="icon" alt="Designed with BEE" src="https://d15k2d11r6t6rl.cloudfront.net/public/users/Integrators/BeeProAgency/53601_510656/Signature/bee.png" height="32" width="34" align="center" style="display: block; height: auto; margin: 0 auto; border: 0;"></a></td><td style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif; font-size: 15px; color: #9d9d9d; vertical-align: middle; letter-spacing: undefined; text-align: center;"><a href="https://www.designedwithbee.com/" target="_blank" style="color: #9d9d9d; text-decoration: none;">Designed with BEE</a></td></tr></table></td></tr></table></td></tr></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></body></html>')
INSERT [dbo].[HtmlEmailPages] ([Id], [Name], [Page]) VALUES (2, N'RegisterCompanyEmail', N'<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"><head><!--[if gte mso 9]><xml> <o:OfficeDocumentSettings> <o:AllowPNG/> <o:PixelsPerInch>96</o:PixelsPerInch> </o:OfficeDocumentSettings></xml><![endif]--> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta name="x-apple-disable-message-reformatting"> <meta http-equiv="X-UA-Compatible" content="IE=edge"> <title></title> <style type="text/css"> @media only screen and (min-width: 620px){.u-row{width: 600px !important;}.u-row .u-col{vertical-align: top;}.u-row .u-col-18{width: 108px !important;}.u-row .u-col-18p34{width: 110.04px !important;}.u-row .u-col-63p66{width: 381.96px !important;}.u-row .u-col-100{width: 600px !important;}}@media (max-width: 620px){.u-row-container{max-width: 100% !important; padding-left: 0px !important; padding-right: 0px !important;}.u-row .u-col{min-width: 320px !important; max-width: 100% !important; display: block !important;}.u-row{width: 100% !important;}.u-col{width: 100% !important;}.u-col > div{margin: 0 auto;}}body{margin: 0; padding: 0;}table,tr,td{vertical-align: top; border-collapse: collapse;}p{margin: 0;}.ie-container table,.mso-container table{table-layout: fixed;}*{line-height: inherit;}a[x-apple-data-detectors=''true'']{color: inherit !important; text-decoration: none !important;}table, td{color: #000000;}#u_body a{color: #cca250; text-decoration: none;}@media (max-width: 480px){#u_content_image_4 .v-src-width{width: auto !important;}#u_content_image_4 .v-src-max-width{max-width: 57% !important;}#u_content_image_3 .v-container-padding-padding{padding: 46px 10px 10px !important;}#u_content_image_3 .v-src-width{width: auto !important;}#u_content_image_3 .v-src-max-width{max-width: 29% !important;}#u_content_heading_3 .v-container-padding-padding{padding: 10px 20px !important;}#u_content_heading_3 .v-font-size{font-size: 28px !important;}#u_content_text_3 .v-container-padding-padding{padding: 10px 22px 26px !important;}#u_content_heading_2 .v-container-padding-padding{padding: 22px 22px 10px !important;}#u_content_heading_2 .v-font-size{font-size: 24px !important;}}</style> <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet" type="text/css"></head><body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #f9f9f9;color: #000000"> <table id="u_body" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #f9f9f9;width:100%" cellpadding="0" cellspacing="0"> <tbody> <tr style="vertical-align: top"> <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top"> <div class="u-row-container" style="padding: 0px;background-color: transparent"> <div class="u-row" style="Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #111114;"> <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;"> <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;"> <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <table id="u_content_image_4" style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:20px 10px;font-family:''Montserrat'',sans-serif;" align="left"> <table width="100%" cellpadding="0" cellspacing="0" border="0"> <tr> <td style="padding-right: 0px;padding-left: 0px;" align="center"> <img align="center" border="0" src="https://wixmp-fe53c9ff592a4da924211f23.wixmp.com/users/15dfc534-4331-4163-8b8e-5d50886c9943/design-previews/69886356-296a-42c8-af54-372dbc4a952f/1678727069555-thumbnail.jpeg" alt="Logo" title="Logo" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 145px;" width="145" class="v-src-width v-src-max-width"/> </td></tr></table> </td></tr></tbody></table> </div></div></div></div></div></div><div class="u-row-container" style="padding: 0px;background-color: transparent"> <div class="u-row" style="Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;"> <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;"> <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;"> <div style="background-color: #fffefe;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <table id="u_content_image_3" style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:55px 10px 10px;font-family:''Montserrat'',sans-serif;" align="left"> <table width="100%" cellpadding="0" cellspacing="0" border="0"> <tr> <td style="padding-right: 0px;padding-left: 0px;" align="center"> <img align="center" border="0" src="https://cdn.templates.unlayer.com/assets/1637739231457-ccc.png" alt="Tick Icon" title="Tick Icon" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 14%;max-width: 81.2px;" width="81.2" class="v-src-width v-src-max-width"/> </td></tr></table> </td></tr></tbody></table><table id="u_content_heading_3" style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px 55px;font-family:''Montserrat'',sans-serif;" align="left"> <h1 class="v-font-size" style="margin: 0px; line-height: 160%; text-align: center; word-wrap: break-word; font-family: ''Montserrat'',sans-serif; font-size: 33px; "><strong>Dükkanınız Başarıyla Oluşturulmuştur</strong></h1> </td></tr></tbody></table><table id="u_content_text_3" style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px 60px 50px;font-family:''Montserrat'',sans-serif;" align="left"> <div class="v-font-size" style="color: #444444; line-height: 170%; text-align: center; word-wrap: break-word;"> <p style="font-size: 14px; line-height: 170%;"><span style="font-size: 16px; line-height: 27.2px;">Bizi Tercih Ettiğiniz İçin Teşekkürler</span></p></div></td></tr></tbody></table> </div></div></div></div></div></div><div class="u-row-container" style="padding: 0px;background-color: transparent"> <div class="u-row" style="Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;"> <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;"> <div class="u-col u-col-18" style="max-width: 320px;min-width: 108px;display: table-cell;vertical-align: top;"> <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <table style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:''Montserrat'',sans-serif;" align="left"> <table height="0px" align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 0px solid #ffffff;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%"> <tbody> <tr style="vertical-align: top"> <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%"> <span>&#160;</span> </td></tr></tbody> </table> </td></tr></tbody></table> </div></div></div><div class="u-col u-col-63p66" style="max-width: 320px;min-width: 381.96px;display: table-cell;vertical-align: top;"> <div style="background-color: #cca250;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <div style="box-sizing: border-box; height: 100%; padding: 20px;border-top: 1px solid #CCC;border-left: 1px solid #CCC;border-right: 1px solid #CCC;border-bottom: 1px solid #CCC;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <table style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:0px;font-family:''Montserrat'',sans-serif;" align="left"> <h1 class="v-font-size" style="margin: 0px; color: #ffffff; line-height: 160%; text-align: center; word-wrap: break-word; font-family: ''Montserrat'',sans-serif; font-size: 20px; "><strong>Size Sunduklarınmız.</strong></h1> </td></tr></tbody></table><table style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:''Montserrat'',sans-serif;" align="left"> <div class="v-font-size" style="color: #f1f8f5; line-height: 200%; text-align: left; word-wrap: break-word;"> <p style="font-size: 14px; line-height: 200%;"><span style="color: #f7e1b5; font-size: 14px; line-height: 28px;"><strong><span style="font-size: 14px; line-height: 28px;">?</span></strong> </span> Hızlı Satış &amp; Alış</p><p style="font-size: 14px; line-height: 200%;"><span style="color: #f7e1b5; font-size: 14px; line-height: 28px;"><strong>?</strong></span>  Güvenilir AltYapı</p><p style="font-size: 14px; line-height: 200%;"><span style="color: #f7e1b5; font-size: 14px; line-height: 28px;">?</span>  Geniş Ürün Yelpazesi</p><p style="font-size: 14px; line-height: 200%;"><span style="color: #f7e1b5; font-size: 14px; line-height: 28px;">?</span>  Dilediğiniz Herşeyi Satabilirsiniz</p></div></td></tr></tbody></table> </div></div></div><div class="u-col u-col-18p34" style="max-width: 320px;min-width: 110.04px;display: table-cell;vertical-align: top;"> <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <table style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:''Montserrat'',sans-serif;" align="left"> <table height="0px" align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 0px solid #ffffff;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%"> <tbody> <tr style="vertical-align: top"> <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%"> <span>&#160;</span> </td></tr></tbody> </table> </td></tr></tbody></table> </div></div></div></div></div></div><div class="u-row-container" style="padding: 0px;background-color: transparent"> <div class="u-row" style="Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;"> <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;"> <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;"> <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <table id="u_content_heading_2" style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:40px 55px 10px;font-family:''Montserrat'',sans-serif;" align="left"> <h1 class="v-font-size" style="margin: 0px; line-height: 160%; text-align: center; word-wrap: break-word; font-family: ''Montserrat'',sans-serif; font-size: 26px; "><strong>Başka Bişeye İhtiyacınız var mı?</strong></h1> </td></tr></tbody></table><table style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:0px 60px 20px;font-family:''Montserrat'',sans-serif;" align="left"> <div class="v-font-size" style="color: #444444; line-height: 170%; text-align: center; word-wrap: break-word;"> <p style="font-size: 14px; line-height: 170%;"><span style="font-size: 16px; line-height: 27.2px;">Lütfen Bizimle İletişime Geçmekten Çekinmeyin</span></p></div></td></tr></tbody></table><table style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px 10px 50px;font-family:''Montserrat'',sans-serif;" align="left"> <div align="center"> <a href="https://unlayer.com/" target="_blank" class="v-button v-font-size" style="box-sizing: border-box;display: inline-block;font-family:''Montserrat'',sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #cca250; border-radius: 4px;-webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;font-size: 14px;"> <span style="display:block;padding:14px 33px;line-height:120%;"><strong><span style="line-height: 16.8px;">Buraya Tıkla ›</span></strong></span> </a> </div></td></tr></tbody></table> </div></div></div></div></div></div><div class="u-row-container" style="padding: 0px;background-color: transparent"> <div class="u-row" style="Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #111114;"> <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;"> <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;"> <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"> <table style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:32px 10px 0px;font-family:''Montserrat'',sans-serif;" align="left"> <div class="v-font-size" style="color: #ffffff; line-height: 140%; text-align: center; word-wrap: break-word;"> <p style="font-size: 14px; line-height: 140%;"><span style="font-size: 18px; line-height: 25.2px;"><strong>{CompanyName}</strong></span></p></div></td></tr></tbody></table><table style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:''Montserrat'',sans-serif;" align="left"> <div class="v-font-size" style="color: #b0b1b4; line-height: 180%; text-align: center; word-wrap: break-word;"> <p style="font-size: 14px; line-height: 180%;">Turkey</p><p style="font-size: 14px; line-height: 180%;"></p></div></td></tr></tbody></table><table style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:''Montserrat'',sans-serif;" align="left"> <div align="center"> <div style="display: table; max-width:211px;"> </div></div></td></tr></tbody></table><table style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:''Montserrat'',sans-serif;" align="left"> <table height="0px" align="center" border="0" cellpadding="0" cellspacing="0" width="82%" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 1px solid #9495a7;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%"> <tbody> <tr style="vertical-align: top"> <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%"> <span>&#160;</span> </td></tr></tbody> </table> </td></tr></tbody></table><table style="font-family:''Montserrat'',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"> <tbody> <tr> <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:0px 10px 13px;font-family:''Montserrat'',sans-serif;" align="left"> <div class="v-font-size" style="color: #b0b1b4; line-height: 180%; text-align: center; word-wrap: break-word;"> <p style="font-size: 14px; line-height: 180%;">&copy; 20XX All Rights Reserved</p></div></td></tr></tbody></table> </div></div></div></div></div></div></td></tr></tbody> </table> </body></html>')
INSERT [dbo].[HtmlEmailPages] ([Id], [Name], [Page]) VALUES (3, N'SendPurchaseEmail', N'<!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"><head><!--[if gte mso 9]><xml>    <o:OfficeDocumentSettings>      <o:AllowPNG/>      <o:PixelsPerInch>96</o:PixelsPerInch>    </o:OfficeDocumentSettings>  </xml><![endif]--><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"><meta name="x-apple-disable-message-reformatting"><!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]--><title></title><style type="text/css">@media only screen and (min-width:620px){.u-row{width:600px!important}.u-row .u-col{vertical-align:top}.u-row .u-col-18{width:108px!important}.u-row .u-col-18p34{width:110.04px!important}.u-row .u-col-63p66{width:381.96px!important}.u-row .u-col-100{width:600px!important}}@media (max-width:620px){.u-row-container{max-width:100%!important;padding-left:0!important;padding-right:0!important}.u-row .u-col{min-width:320px!important;max-width:100%!important;display:block!important}.u-row{width:100%!important}.u-col{width:100%!important}.u-col>div{margin:0 auto}}body{margin:0;padding:0}table,td,tr{vertical-align:top;border-collapse:collapse}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}table,td{color:#000}#u_body a{color:#cca250;text-decoration:none}@media (max-width:480px){#u_content_image_4 .v-src-width{width:auto!important}#u_content_image_4 .v-src-max-width{max-width:57%!important}#u_content_image_3 .v-container-padding-padding{padding:46px 10px 10px!important}#u_content_image_3 .v-src-width{width:auto!important}#u_content_image_3 .v-src-max-width{max-width:29%!important}#u_content_heading_3 .v-container-padding-padding{padding:10px 20px!important}#u_content_heading_3 .v-font-size{font-size:28px!important}#u_content_text_3 .v-container-padding-padding{padding:10px 22px 26px!important}#u_content_heading_2 .v-container-padding-padding{padding:22px 22px 10px!important}#u_content_heading_2 .v-font-size{font-size:24px!important}}</style><!--[if !mso]><!--><link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet" type="text/css"><!--<![endif]--></head><body class="clean-body u_body" style="margin:0;padding:0;-webkit-text-size-adjust:100%;background-color:#f9f9f9;color:#000"><!--[if IE]><div class="ie-container"><![endif]--><!--[if mso]><div class="mso-container"><![endif]--><table id="u_body" style="border-collapse:collapse;table-layout:fixed;border-spacing:0;mso-table-lspace:0;mso-table-rspace:0;vertical-align:top;min-width:320px;Margin:0 auto;background-color:#f9f9f9;width:100%" cellpadding="0" cellspacing="0"><tbody><tr style="vertical-align:top"><td style="word-break:break-word;border-collapse:collapse!important;vertical-align:top"><!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #f9f9f9;"><![endif]--><div class="u-row-container" style="padding:0;background-color:transparent"><div class="u-row" style="Margin:0 auto;min-width:320px;max-width:600px;overflow-wrap:break-word;word-wrap:break-word;word-break:break-word;background-color:#111114"><div style="border-collapse:collapse;display:table;width:100%;height:100%;background-color:transparent"><!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:600px;"><tr style="background-color: #111114;"><![endif]--><!--[if (mso)|(IE)]><td align="center" width="600" style="width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]--><div class="u-col u-col-100" style="max-width:320px;min-width:600px;display:table-cell;vertical-align:top"><div style="height:100%;width:100%!important;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--[if (!mso)&(!IE)]><!--><div style="box-sizing:border-box;height:100%;padding:0;border-top:0 solid transparent;border-left:0 solid transparent;border-right:0 solid transparent;border-bottom:0 solid transparent;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--<![endif]--><table id="u_content_image_4" style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:20px 10px;font-family:Montserrat,sans-serif" align="left"><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding-right:0;padding-left:0" align="center"><img align="center" border="0" src="https://wixmp-fe53c9ff592a4da924211f23.wixmp.com/users/15dfc534-4331-4163-8b8e-5d50886c9943/design-previews/69886356-296a-42c8-af54-372dbc4a952f/1678727069555-thumbnail.jpeg" alt="Logo" title="Logo" style="outline:0;text-decoration:none;-ms-interpolation-mode:bicubic;clear:both;display:inline-block!important;border:none;height:auto;float:none;width:25%;max-width:145px" width="145" class="v-src-width v-src-max-width"></td></tr></table></td></tr></tbody></table><!--[if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!--[if (mso)|(IE)]></td><![endif]--><!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]--></div></div></div><div class="u-row-container" style="padding:0;background-color:transparent"><div class="u-row" style="Margin:0 auto;min-width:320px;max-width:600px;overflow-wrap:break-word;word-wrap:break-word;word-break:break-word;background-color:transparent"><div style="border-collapse:collapse;display:table;width:100%;height:100%;background-color:transparent"><!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:600px;"><tr style="background-color: transparent;"><![endif]--><!--[if (mso)|(IE)]><td align="center" width="600" style="background-color: #fffefe;width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]--><div class="u-col u-col-100" style="max-width:320px;min-width:600px;display:table-cell;vertical-align:top"><div style="background-color:#fffefe;height:100%;width:100%!important;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--[if (!mso)&(!IE)]><!--><div style="box-sizing:border-box;height:100%;padding:0;border-top:0 solid transparent;border-left:0 solid transparent;border-right:0 solid transparent;border-bottom:0 solid transparent;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--<![endif]--><table id="u_content_image_3" style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:55px 10px 10px;font-family:Montserrat,sans-serif" align="left"><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding-right:0;padding-left:0" align="center"><img align="center" border="0" src="https://cdn.templates.unlayer.com/assets/1637739231457-ccc.png" alt="Tick Icon" title="Tick Icon" style="outline:0;text-decoration:none;-ms-interpolation-mode:bicubic;clear:both;display:inline-block!important;border:none;height:auto;float:none;width:14%;max-width:81.2px" width="81.2" class="v-src-width v-src-max-width"></td></tr></table></td></tr></tbody></table><table id="u_content_heading_3" style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px 55px;font-family:Montserrat,sans-serif" align="left"><h1 class="v-font-size" style="margin:0;line-height:160%;text-align:center;word-wrap:break-word;font-family:Montserrat,sans-serif;font-size:33px"><strong>{ProductName} : {ProductPrice}</strong></h1></td></tr></tbody></table><table id="u_content_text_3" style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px 60px 50px;font-family:Montserrat,sans-serif" align="left"><div class="v-font-size" style="color:#444;line-height:170%;text-align:center;word-wrap:break-word"><p style="font-size:14px;line-height:170%"><span style="font-size:16px;line-height:27.2px">Bizi Tercih Ettiğiniz İçin Teşekkürler</span></p></div></td></tr></tbody></table><!--[if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!--[if (mso)|(IE)]></td><![endif]--><!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]--></div></div></div><div class="u-row-container" style="padding:0;background-color:transparent"><div class="u-row" style="Margin:0 auto;min-width:320px;max-width:600px;overflow-wrap:break-word;word-wrap:break-word;word-break:break-word;background-color:#fff"><div style="border-collapse:collapse;display:table;width:100%;height:100%;background-color:transparent"><!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:600px;"><tr style="background-color: #ffffff;"><![endif]--><!--[if (mso)|(IE)]><td align="center" width="108" style="width: 108px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]--><div class="u-col u-col-18" style="max-width:320px;min-width:108px;display:table-cell;vertical-align:top"><div style="height:100%;width:100%!important;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--[if (!mso)&(!IE)]><!--><div style="box-sizing:border-box;height:100%;padding:0;border-top:0 solid transparent;border-left:0 solid transparent;border-right:0 solid transparent;border-bottom:0 solid transparent;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--<![endif]--><table style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:Montserrat,sans-serif" align="left"><table height="0px" align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse;table-layout:fixed;border-spacing:0;mso-table-lspace:0;mso-table-rspace:0;vertical-align:top;border-top:0 solid #fff;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%"><tbody><tr style="vertical-align:top"><td style="word-break:break-word;border-collapse:collapse!important;vertical-align:top;font-size:0;line-height:0;mso-line-height-rule:exactly;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%"><span>&#160;</span></td></tr></tbody></table></td></tr></tbody></table><!--[if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!--[if (mso)|(IE)]></td><![endif]--><!--[if (mso)|(IE)]><td align="center" width="379" style="background-color: #cca250;width: 379px;padding: 20px;border-top: 1px solid #CCC;border-left: 1px solid #CCC;border-right: 1px solid #CCC;border-bottom: 1px solid #CCC;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]--><div class="u-col u-col-63p66" style="max-width:320px;min-width:381.96px;display:table-cell;vertical-align:top"><div style="background-color:#cca250;height:100%;width:100%!important;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--[if (!mso)&(!IE)]><!--><div style="box-sizing:border-box;height:100%;padding:20px;border-top:1px solid #CCC;border-left:1px solid #CCC;border-right:1px solid #CCC;border-bottom:1px solid #CCC;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--<![endif]--><table style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:0;font-family:Montserrat,sans-serif" align="left"><h1 class="v-font-size" style="margin:0;color:#fff;line-height:160%;text-align:center;word-wrap:break-word;font-family:Montserrat,sans-serif;font-size:20px"><strong>Size Sunduklarınmız.</strong></h1></td></tr></tbody></table><table style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:Montserrat,sans-serif" align="left"><div class="v-font-size" style="color:#f1f8f5;line-height:200%;text-align:left;word-wrap:break-word"><p style="font-size:14px;line-height:200%"><span style="color:#f7e1b5;font-size:14px;line-height:28px"><strong><span style="font-size:14px;line-height:28px">?</span></strong></span> Hızlı Satış &amp; Alış</p><p style="font-size:14px;line-height:200%"><span style="color:#f7e1b5;font-size:14px;line-height:28px"><strong>?</strong></span>  Güvenilir AltYapı</p><p style="font-size:14px;line-height:200%"><span style="color:#f7e1b5;font-size:14px;line-height:28px">?</span>  Geniş Ürün Yelpazesi</p><p style="font-size:14px;line-height:200%"><span style="color:#f7e1b5;font-size:14px;line-height:28px">?</span>  Dilediğiniz Herşeyi Satabilirsiniz</p></div></td></tr></tbody></table><!--[if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!--[if (mso)|(IE)]></td><![endif]--><!--[if (mso)|(IE)]><td align="center" width="110" style="width: 110px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]--><div class="u-col u-col-18p34" style="max-width:320px;min-width:110.04px;display:table-cell;vertical-align:top"><div style="height:100%;width:100%!important;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--[if (!mso)&(!IE)]><!--><div style="box-sizing:border-box;height:100%;padding:0;border-top:0 solid transparent;border-left:0 solid transparent;border-right:0 solid transparent;border-bottom:0 solid transparent;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--<![endif]--><table style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:Montserrat,sans-serif" align="left"><table height="0px" align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse;table-layout:fixed;border-spacing:0;mso-table-lspace:0;mso-table-rspace:0;vertical-align:top;border-top:0 solid #fff;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%"><tbody><tr style="vertical-align:top"><td style="word-break:break-word;border-collapse:collapse!important;vertical-align:top;font-size:0;line-height:0;mso-line-height-rule:exactly;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%"><span>&#160;</span></td></tr></tbody></table></td></tr></tbody></table><!--[if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!--[if (mso)|(IE)]></td><![endif]--><!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]--></div></div></div><div class="u-row-container" style="padding:0;background-color:transparent"><div class="u-row" style="Margin:0 auto;min-width:320px;max-width:600px;overflow-wrap:break-word;word-wrap:break-word;word-break:break-word;background-color:#fff"><div style="border-collapse:collapse;display:table;width:100%;height:100%;background-color:transparent"><!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:600px;"><tr style="background-color: #ffffff;"><![endif]--><!--[if (mso)|(IE)]><td align="center" width="600" style="width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]--><div class="u-col u-col-100" style="max-width:320px;min-width:600px;display:table-cell;vertical-align:top"><div style="height:100%;width:100%!important;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--[if (!mso)&(!IE)]><!--><div style="box-sizing:border-box;height:100%;padding:0;border-top:0 solid transparent;border-left:0 solid transparent;border-right:0 solid transparent;border-bottom:0 solid transparent;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--<![endif]--><table id="u_content_heading_2" style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:40px 55px 10px;font-family:Montserrat,sans-serif" align="left"><h1 class="v-font-size" style="margin:0;line-height:160%;text-align:center;word-wrap:break-word;font-family:Montserrat,sans-serif;font-size:26px"><strong>Başka Bişeye İhtiyacınız var mı?</strong></h1></td></tr></tbody></table><table style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:0 60px 20px;font-family:Montserrat,sans-serif" align="left"><div class="v-font-size" style="color:#444;line-height:170%;text-align:center;word-wrap:break-word"><p style="font-size:14px;line-height:170%"><span style="font-size:16px;line-height:27.2px">Lütfen Bizimle İletişime Geçmekten Çekinmeyin</span></p></div></td></tr></tbody></table><table style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px 10px 50px;font-family:Montserrat,sans-serif" align="left"><!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]--><div align="center"><!--[if mso]><v:roundrect xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w="urn:schemas-microsoft-com:office:word" href="https://unlayer.com/" style="height:45px; v-text-anchor:middle; width:174px;" arcsize="9%"  stroke="f" fillcolor="#cca250"><w:anchorlock/><center style="color:#FFFFFF;font-family:''Montserrat'',sans-serif;"><![endif]--><a href="https://unlayer.com/" target="_blank" class="v-button v-font-size" style="box-sizing:border-box;display:inline-block;font-family:Montserrat,sans-serif;text-decoration:none;-webkit-text-size-adjust:none;text-align:center;color:#FFF;background-color:#cca250;border-radius:4px;-webkit-border-radius:4px;-moz-border-radius:4px;width:auto;max-width:100%;overflow-wrap:break-word;word-break:break-word;word-wrap:break-word;mso-border-alt:none;font-size:14px"><span style="display:block;padding:14px 33px;line-height:120%"><strong><span style="line-height:16.8px">Buraya Tıkla ›</span></strong></span></a><!--[if mso]></center></v:roundrect><![endif]--></div></td></tr></tbody></table><!--[if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!--[if (mso)|(IE)]></td><![endif]--><!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]--></div></div></div><div class="u-row-container" style="padding:0;background-color:transparent"><div class="u-row" style="Margin:0 auto;min-width:320px;max-width:600px;overflow-wrap:break-word;word-wrap:break-word;word-break:break-word;background-color:#111114"><div style="border-collapse:collapse;display:table;width:100%;height:100%;background-color:transparent"><!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:600px;"><tr style="background-color: #111114;"><![endif]--><!--[if (mso)|(IE)]><td align="center" width="600" style="width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]--><div class="u-col u-col-100" style="max-width:320px;min-width:600px;display:table-cell;vertical-align:top"><div style="height:100%;width:100%!important;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--[if (!mso)&(!IE)]><!--><div style="box-sizing:border-box;height:100%;padding:0;border-top:0 solid transparent;border-left:0 solid transparent;border-right:0 solid transparent;border-bottom:0 solid transparent;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0"><!--<![endif]--><table style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:32px 10px 0;font-family:Montserrat,sans-serif" align="left"><div class="v-font-size" style="color:#fff;line-height:140%;text-align:center;word-wrap:break-word"><p style="font-size:14px;line-height:140%"><span style="font-size:18px;line-height:25.2px"><strong></strong></span></p></div></td></tr></tbody></table><table style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:Montserrat,sans-serif" align="left"><div class="v-font-size" style="color:#b0b1b4;line-height:180%;text-align:center;word-wrap:break-word"><p style="font-size:14px;line-height:180%">Turkey</p><p style="font-size:14px;line-height:180%"></p></div></td></tr></tbody></table><table style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:Montserrat,sans-serif" align="left"><div align="center"><div style="display:table;max-width:211px"><!--[if (mso)|(IE)]><table width="211" cellpadding="0" cellspacing="0" border="0"><tr><td style="border-collapse:collapse;" align="center"><table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-collapse:collapse; mso-table-lspace: 0pt;mso-table-rspace: 0pt; width:211px;"><tr><![endif]--><!--[if (mso)|(IE)]></td><![endif]--><!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]--></div></div></td></tr></tbody></table><table style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:Montserrat,sans-serif" align="left"><table height="0px" align="center" border="0" cellpadding="0" cellspacing="0" width="82%" style="border-collapse:collapse;table-layout:fixed;border-spacing:0;mso-table-lspace:0;mso-table-rspace:0;vertical-align:top;border-top:1px solid #9495a7;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%"><tbody><tr style="vertical-align:top"><td style="word-break:break-word;border-collapse:collapse!important;vertical-align:top;font-size:0;line-height:0;mso-line-height-rule:exactly;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%"><span>&#160;</span></td></tr></tbody></table></td></tr></tbody></table><table style="font-family:Montserrat,sans-serif" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr><td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:0 10px 13px;font-family:Montserrat,sans-serif" align="left"><div class="v-font-size" style="color:#b0b1b4;line-height:180%;text-align:center;word-wrap:break-word"><p style="font-size:14px;line-height:180%">&copy; 20XX All Rights Reserved</p></div></td></tr></tbody></table><!--[if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!--[if (mso)|(IE)]></td><![endif]--><!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]--></div></div></div><!--[if (mso)|(IE)]></td></tr></table><![endif]--></td></tr></tbody></table><!--[if mso]></div><![endif]--><!--[if IE]></div><![endif]--></body></html>')
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (1, 1, 1003, CAST(N'2023-03-30T12:51:07.353' AS DateTime), CAST(800.00 AS Decimal(18, 2)), CAST(144.00 AS Decimal(18, 2)), CAST(944.00 AS Decimal(18, 2)), 0, 1, CAST(N'2023-03-30T12:51:07.353' AS DateTime), 1, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (2, 1, 1003, CAST(N'2023-04-03T15:47:42.293' AS DateTime), CAST(200.00 AS Decimal(18, 2)), CAST(36.00 AS Decimal(18, 2)), CAST(236.00 AS Decimal(18, 2)), 0, 5, CAST(N'2023-04-03T15:47:42.293' AS DateTime), 1, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (3, 1, 1003, CAST(N'2023-04-17T11:44:11.793' AS DateTime), CAST(400.00 AS Decimal(18, 2)), CAST(72.00 AS Decimal(18, 2)), CAST(472.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-17T11:44:11.793' AS DateTime), 1, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (4, 2, 1003, CAST(N'2023-04-17T11:47:26.943' AS DateTime), CAST(500.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), CAST(590.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-17T11:47:26.943' AS DateTime), 2, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (5, 1, 1003, CAST(N'2023-04-17T12:01:24.773' AS DateTime), CAST(700.00 AS Decimal(18, 2)), CAST(126.00 AS Decimal(18, 2)), CAST(826.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-17T12:01:24.773' AS DateTime), 1, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (6, 2, 1003, CAST(N'2023-04-17T12:02:56.083' AS DateTime), CAST(600.00 AS Decimal(18, 2)), CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-17T12:02:56.083' AS DateTime), 2, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (7, 1003, 1003, CAST(N'2023-04-17T12:43:48.897' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-17T12:43:48.897' AS DateTime), 1003, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (8, 1003, 1003, CAST(N'2023-04-17T12:46:16.737' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-17T12:46:16.737' AS DateTime), 1003, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (9, 1011, 1003, CAST(N'2023-04-17T12:51:12.900' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-17T12:51:12.900' AS DateTime), 1011, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (10, 1011, 1003, CAST(N'2023-04-17T12:57:46.980' AS DateTime), CAST(300.00 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)), CAST(354.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-17T12:57:46.980' AS DateTime), 1011, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (11, 1, 1003, CAST(N'2023-04-18T16:23:40.623' AS DateTime), CAST(1200.00 AS Decimal(18, 2)), CAST(216.00 AS Decimal(18, 2)), CAST(1416.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-18T16:23:40.623' AS DateTime), 1, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (12, 1, 1003, CAST(N'2023-04-18T16:23:59.383' AS DateTime), CAST(1200.00 AS Decimal(18, 2)), CAST(216.00 AS Decimal(18, 2)), CAST(1416.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-18T16:23:59.383' AS DateTime), 1, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (13, 1011, 1003, CAST(N'2023-04-18T16:28:50.713' AS DateTime), CAST(600.00 AS Decimal(18, 2)), CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-18T16:28:50.713' AS DateTime), 1011, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (14, 1, 1003, CAST(N'2023-04-18T16:38:30.273' AS DateTime), CAST(1200.00 AS Decimal(18, 2)), CAST(216.00 AS Decimal(18, 2)), CAST(1416.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-18T16:38:30.273' AS DateTime), 1, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (15, 1011, 1003, CAST(N'2023-04-18T16:50:28.610' AS DateTime), CAST(600.00 AS Decimal(18, 2)), CAST(108.00 AS Decimal(18, 2)), CAST(708.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-18T16:50:28.610' AS DateTime), 1011, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (16, 1, 1003, CAST(N'2023-04-18T16:53:20.497' AS DateTime), CAST(400.00 AS Decimal(18, 2)), CAST(72.00 AS Decimal(18, 2)), CAST(472.00 AS Decimal(18, 2)), 0, 0, CAST(N'2023-04-18T16:53:20.497' AS DateTime), 1, NULL)
INSERT [dbo].[Invoice] ([Id], [BuyerUserId], [SellerCompanyId], [TransactionDateTime], [Total], [VatTotal], [GrandTotal], [IsCancelled], [StatusId], [CreateDate], [CreateUserId], [CancelDate]) VALUES (17, 1, 1003, CAST(N'2023-10-22T11:07:21.137' AS DateTime), CAST(1500.00 AS Decimal(18, 2)), CAST(270.00 AS Decimal(18, 2)), CAST(1770.00 AS Decimal(18, 2)), 0, 1, CAST(N'2023-10-22T11:07:21.137' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceProduct] ON 

INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3062, 1, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 4, CAST(72.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(472.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3063, 1, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 4, CAST(72.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(472.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3064, 2, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 2, CAST(36.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(236.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3065, 4, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 2, CAST(36.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(236.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3066, 4, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 3, CAST(54.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(354.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3067, 5, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 2, CAST(36.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(236.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3068, 5, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 5, CAST(90.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(590.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3069, 6, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 3, CAST(54.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(354.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3070, 6, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 3, CAST(54.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(354.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3071, 7, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 1, CAST(18.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3072, 7, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 1, CAST(18.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3073, 8, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 1, CAST(18.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3074, 8, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 1, CAST(18.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3075, 9, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 2, CAST(36.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(236.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3076, 9, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 1, CAST(18.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3077, 10, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 2, CAST(36.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(236.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3078, 10, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 1, CAST(18.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3079, 11, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 1, CAST(18.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3080, 11, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 11, CAST(198.00 AS Decimal(18, 2)), CAST(1100.00 AS Decimal(18, 2)), CAST(1298.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3081, 12, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 1, CAST(18.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3082, 12, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 11, CAST(198.00 AS Decimal(18, 2)), CAST(1100.00 AS Decimal(18, 2)), CAST(1298.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3083, 13, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 4, CAST(72.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(472.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3084, 13, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 2, CAST(36.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(236.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3085, 14, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 1, CAST(18.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3086, 14, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 11, CAST(198.00 AS Decimal(18, 2)), CAST(1100.00 AS Decimal(18, 2)), CAST(1298.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3087, 15, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 4, CAST(72.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(472.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3088, 15, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 2, CAST(36.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(236.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3089, 16, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 2, CAST(36.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(236.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3090, 16, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 2, CAST(36.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(236.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3091, 17, 7, N'karpuz', CAST(100.00 AS Decimal(18, 2)), 18, 4, CAST(72.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(472.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceProduct] ([Id], [InvoiceId], [ProductId], [ProductName], [ProductPrice], [ProductVat], [Qty], [Tax], [Total], [LineTotal]) VALUES (3092, 17, 4, N'portakal', CAST(100.00 AS Decimal(18, 2)), 18, 11, CAST(198.00 AS Decimal(18, 2)), CAST(1100.00 AS Decimal(18, 2)), CAST(1298.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[InvoiceProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceStatusLog] ON 

INSERT [dbo].[InvoiceStatusLog] ([Id], [InvoiceId], [Status], [CreateDate], [CreateUserId]) VALUES (1, 2, 1, CAST(N'2023-04-03T15:48:13.707' AS DateTime), 1003)
INSERT [dbo].[InvoiceStatusLog] ([Id], [InvoiceId], [Status], [CreateDate], [CreateUserId]) VALUES (2, 2, 2, CAST(N'2023-04-03T15:48:17.203' AS DateTime), 1003)
INSERT [dbo].[InvoiceStatusLog] ([Id], [InvoiceId], [Status], [CreateDate], [CreateUserId]) VALUES (13, 2, 3, CAST(N'2023-04-03T17:43:01.160' AS DateTime), 1003)
INSERT [dbo].[InvoiceStatusLog] ([Id], [InvoiceId], [Status], [CreateDate], [CreateUserId]) VALUES (14, 2, 4, CAST(N'2023-04-03T17:43:03.900' AS DateTime), 1003)
INSERT [dbo].[InvoiceStatusLog] ([Id], [InvoiceId], [Status], [CreateDate], [CreateUserId]) VALUES (15, 2, 5, CAST(N'2023-04-03T17:43:05.913' AS DateTime), 1003)
INSERT [dbo].[InvoiceStatusLog] ([Id], [InvoiceId], [Status], [CreateDate], [CreateUserId]) VALUES (16, 17, 1, CAST(N'2023-10-22T11:31:52.100' AS DateTime), 1003)
SET IDENTITY_INSERT [dbo].[InvoiceStatusLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [CategoryId], [CompanyId], [Name], [Price], [Image], [Description], [Stock], [Tax], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4, 1, 1003, N'portakal', CAST(100.00 AS Decimal(18, 2)), N'portakal.jpg', N'taze', 83, 18, 1, CAST(N'2023-03-22T10:07:54.213' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [CategoryId], [CompanyId], [Name], [Price], [Image], [Description], [Stock], [Tax], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (6, 1, 1003, N'portakall', CAST(100.00 AS Decimal(18, 2)), N'portakal.jpg', N'taze', 0, 18, 0, CAST(N'2023-03-22T10:27:10.793' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [CategoryId], [CompanyId], [Name], [Price], [Image], [Description], [Stock], [Tax], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (7, 1, 1003, N'karpuz', CAST(100.00 AS Decimal(18, 2)), N'jpg', N'taze', 6, 18, 1, CAST(N'2023-03-22T10:34:07.953' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [CategoryId], [CompanyId], [Name], [Price], [Image], [Description], [Stock], [Tax], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (1002, 2, 1003, N'asd', CAST(10.00 AS Decimal(18, 2)), N'asd.jpg', N'sd', 100, 18, 1, CAST(N'2023-04-05T15:17:02.843' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [CategoryId], [CompanyId], [Name], [Price], [Image], [Description], [Stock], [Tax], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (1003, 2, 1003, N'asd', CAST(10.00 AS Decimal(18, 2)), N'asd.jpg', N'sd', 100, 18, 1, CAST(N'2023-04-05T15:18:10.177' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [CategoryId], [CompanyId], [Name], [Price], [Image], [Description], [Stock], [Tax], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (1005, 10, 2, N'TestingDto', CAST(5.00 AS Decimal(18, 2)), N'TestingDto', N'TestingDto', 5, 18, 1, CAST(N'2023-10-05T18:52:56.613' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (1, N'Moda', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (2, N'Elektronik', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (3, N'Ev & Yaşam', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (4, N'Anne & Bebek', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (5, N'Kozmetik & Kişisel Bakım', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (6, N'Mücevher & Saat', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (7, N'Spor & Outdoor', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (8, N'Kitap,Müzik,Film,Oyun', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (9, N'Ayakkabı & çanta', 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (10, N'Kadın Giyim & Aksesuar', 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (11, N'Erkek Giyim & Aksesuar', 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (12, N'Çocuk Giyim & Aksesuar', 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (13, N'Telefon & Aksesuarlar', 2)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (14, N'Bilgisayar', 2)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (15, N'Televizyon & Ses Sistemleri', 2)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (16, N'Elektirikli Ev Aletleri', 2)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (17, N'Beyaz Eşya', 2)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (18, N'Fotoğraf & Kamera', 2)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (19, N'Video Oyun & Konsol', 2)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (20, N'Mobilya', 3)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (21, N'Dekorasyon & Aydınlatma', 3)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (22, N'Ev Tekstili', 3)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (23, N'Mutfak Gereçleri', 3)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (24, N'Banyo & Ev Gereçleri', 3)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (25, N'Yapı Market & Bahçe ', 3)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (26, N'Evcil Hayvan Ürünleri', 3)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (27, N'Kırtasiye & Ofis', 3)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (28, N'Süpermarket', 3)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (29, N'Bebek Bezi & Islak Mendil', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (30, N'Bebek Giyim', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (31, N'Hamile Giyim', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (32, N'Bebek Arabaları', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (33, N'Oto Koltuğu & Ana Kucağı', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (34, N'Beslenme & Mama Sandalyesi', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (35, N'Biberon & Aksesuarlar', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (36, N'Emzirme Ürünleri', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (37, N'Yürüteç & Yürütme Yardımcılar', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (38, N'Bebek Odası & Park Yatak', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (39, N'Bebek Bakım & Sağlık', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (40, N'Bebek Güvenlik', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (41, N'Bebek Oyuncakları', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (42, N'Banyo & Tuvalet', 4)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (43, N'Parfüm & Deodorant', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (44, N'Saç Bakım & Şekillendirme', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (45, N'Cilt Bakımı', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (46, N'Makyaj', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (47, N'Sağlık & Medikal Ürünler', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (48, N'Kadın Bakım Ürünleri', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (49, N'Erkek Bakım Ürünleri', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (50, N'Ağız, Diş & Banyo Ürünleri', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (51, N'El, Ayak, Tırnak Bakımı', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (52, N'Güneş & Bronzluk Ürünleri', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (53, N'Güzellik Salonu & Kuaför Ürünleri', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (54, N'Cinsel Ürünler', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (55, N'Ev Kozmetiği', 5)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (56, N'Yatrımlık Altın & Gümüş', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (57, N'Saat', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (58, N'Güneş Gözlüğü', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (59, N'Altın Takılar', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (60, N'Pırlanta Takılar', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (61, N'Gümüş Takılar', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (62, N'Çelik Takılar', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (63, N'Bijuteri Takılar', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (64, N'Aksesuar', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (65, N'Takı Aksesuarları', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (66, N'2.El Antika & Koleksiyonluk', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (67, N'Fitness & Kondisyon', 7)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (68, N'Spor Giyim & Ayakkabı', 7)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (69, N'Outdoor & Kamp', 7)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (70, N'Bireysel & Takım Sporları', 7)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (71, N'Avcılık & Balıkçılık', 7)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (72, N'Kış Sporları', 7)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (73, N'Bisiklet & Scooter', 7)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (74, N'Tekne & Yat Malzemeleri', 7)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (75, N'Su Sporları', 7)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (76, N'Kitap', 8)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (77, N'Film', 8)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (78, N'Müzik', 8)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (79, N'Çocuk Oyuncakları & Parti', 8)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (80, N'Yetişkin Hobi & Oyun', 8)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (81, N'Dijital Kodlar & Ürünler', 8)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (82, N'Düğün, Davet, Organizasyon', 8)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (83, N'El İşi Ürünleri', 8)
INSERT [dbo].[ProductCategory] ([Id], [Name], [ParentId]) VALUES (84, N'Yaşam & Etkinlik', 8)
GO
SET IDENTITY_INSERT [dbo].[ProductStockLog] ON 

INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (1, 4, 10, 1, CAST(N'2023-03-28T12:20:14.040' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (2, 4, 10, 0, CAST(N'2023-03-28T12:20:22.870' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (3, 4, 10, 1, CAST(N'2023-03-29T13:27:23.950' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (4, 4, 10, 1, CAST(N'2023-03-29T13:27:38.163' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (5, 4, 10, 0, CAST(N'2023-03-29T13:27:43.407' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (6, 4, 10, 0, CAST(N'2023-03-29T13:27:50.030' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (7, 4, 10, 0, CAST(N'2023-03-29T13:27:58.890' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (8, 4, 15, 1, CAST(N'2023-03-29T13:28:58.373' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (9, 4, 15, 0, CAST(N'2023-03-29T13:29:01.550' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (10, 4, 20, 1, CAST(N'2023-03-29T13:30:13.287' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (11, 4, 20, 0, CAST(N'2023-03-29T13:30:17.373' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (12, 7, 10, 1, CAST(N'2023-04-18T16:27:47.793' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (13, 7, 10, 1, CAST(N'2023-04-18T16:27:50.063' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (14, 4, 2, 0, CAST(N'2023-10-05T19:08:29.400' AS DateTime), 1003)
INSERT [dbo].[ProductStockLog] ([Id], [ProductId], [Qty], [IsInput], [CreateDate], [CreateUserId]) VALUES (15, 4, 4, 1, CAST(N'2023-10-18T19:06:33.990' AS DateTime), 1003)
SET IDENTITY_INSERT [dbo].[ProductStockLog] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (1, 0, N'ismsrky@gmail.com', N'1234', N'erdem', N'çopur', 1, CAST(N'2023-02-16T17:15:14.570' AS DateTime), 1, CAST(N'2023-02-24T16:05:59.960' AS DateTime), 1)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (2, 0, N'ferya@gmail.com', N'1234', N'feryaasdfas', N'Sarıkaya', 1, CAST(N'2023-02-16T17:20:07.307' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (3, 2, N'iacar8800@gmail.com', N'1234', N'ibrahim', N'acar', 1, CAST(N'2023-02-16T17:21:29.207' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (4, 1, N'serhatoptik@gmail.com', N'1234', N'serhatoptik', N'srht', 1, CAST(N'2023-02-16T18:12:42.403' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (1011, 1, N'elmasium@gmail.com', N'1234', N'ismail', N'sarıkaya', 1, CAST(N'2023-02-20T14:50:23.730' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (1012, 1, N'halil@gmail.com', N'1234', N'halil', N'shelby', 1, CAST(N'2023-02-21T15:16:55.547' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (2009, 1, N'imperrio', N'1234', N'erdem', N'çopur', 1, CAST(N'2023-02-24T16:08:27.427' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (2010, 0, N'ww', N'www', N'www', N'ww', 1, CAST(N'2023-02-24T17:23:25.307' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (3009, 0, N'miraç', N'1234', N'miraç', N'shelby', 1, CAST(N'2023-02-25T00:58:30.840' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (3010, 0, N'miraçshelby', N'1234', N'miraçç', N'shelbyy', 1, CAST(N'2023-02-25T01:05:12.260' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (5009, 1, N'ibrahim@gmail.com', N'password', N'ibrahim', N'acar', 1, CAST(N'2023-03-04T16:02:09.690' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (5010, 1, N'regex@gmail.com', N'hello1Haa', N'regex', N'regex', 1, CAST(N'2023-03-04T16:15:02.533' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (5011, 1, N'asdafsa@hotmail.com', N'Aaaaaaaaaaaaa7', N'asd', N'asds', 1, CAST(N'2023-03-04T16:29:49.063' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (6010, 0, N'iacar880098@gmail.com', N'Aasfa1234', N'ibrahim', N'acar', 1, CAST(N'2023-03-07T13:22:00.767' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (6011, 1, N'ÇiftlikBank@gmail.com', N'ÇiftLikBank1', N'çiftlik', N'bank', 1, CAST(N'2023-03-08T10:25:33.457' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (7015, 0, N'av_filizbulak@hotmail.com', N'asddsa1A231', N'filiz', N'acar', 1, CAST(N'2023-03-13T17:42:13.037' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (7031, 2, N'feryasarikaya@gmail.com', N'aslfşA1312Aasdf', N'Ferya', N'sarıkaya', 1, CAST(N'2023-03-14T16:06:59.213' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (7032, 0, N'roscopb3@gmail.com', N'aslfşA1312Aasdf', N'Miraç Shelby', N'shelby', 1, CAST(N'2023-03-14T16:13:24.663' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (7033, 0, N'mogolthalil06@gmail.com', N'aslfşA1312Aasdf', N'Halil Shelby', N'shelby', 1, CAST(N'2023-03-14T16:14:23.113' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (7034, 2, N'ogzzclk@gmail.com', N'asgfsgaA32', N'Roys', N'Royss', 1, CAST(N'2023-03-14T16:18:30.717' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (7036, 0, N'BlkGuc@gmail.com', N'fasfasA12A', N'Murat1234', N'asfkşl', 1, CAST(N'2023-03-17T23:54:47.263' AS DateTime), 1, CAST(N'2023-05-01T16:21:23.130' AS DateTime), 1)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (7038, 1, N'motobotlar@gmail.com', N'asflkşaA1232', N'büfeasfa', N'bufeafs', 1, CAST(N'2023-03-23T11:19:32.063' AS DateTime), 1, CAST(N'2023-05-01T16:44:07.357' AS DateTime), 1)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (8052, 1, N'motobotldar@gmail.com', N'asflkşdaA1232', N'bdüfeasfaaa', N'budfeafs', 1, CAST(N'2023-05-01T16:22:05.040' AS DateTime), 1, CAST(N'2023-05-01T16:46:05.727' AS DateTime), 1)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (8055, 1, N'motobotlaar@gmail.com', N'asflkşaA1232', N'trying', N'asd', 1, CAST(N'2023-05-01T16:45:55.320' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (8056, 1, N'motoaabotlaar@gmail.com', N'asflkşaA1232', N'asşfkliasdglşfksgli', N'asd', 1, CAST(N'2023-05-01T16:46:17.493' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (8057, 1, N'bearerasd@gmail.com', N'testbeaBaer1', N'testbearer', N'testbearer', 1, CAST(N'2023-05-02T10:33:25.747' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (8059, 1, N'bearaserasd@gmail.com', N'testbeasaBaer1', N'as', N'testbeaasrer', 1, CAST(N'2023-05-02T11:11:22.633' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (8062, 1, N'asfasfiacar@gmail.com', N'asşfiaAdsa131', N'asflşasfa', N'aslfşsf', 1, CAST(N'2023-05-02T12:14:55.067' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (8063, 0, N'strinasfg@gmail.com', N'stringFAL132', N'strinasdg', N'strinasfg', 1, CAST(N'2023-05-08T12:47:21.377' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (8064, 1, N'caAtestwebapi@gmail.com', N'asagAKFA124ass', N'testc#api', N'testc#api', 1, CAST(N'2023-05-23T18:35:29.903' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (9064, 1, N'ömer21231@gmail.com', N'asdasdfSADF312', N'asdsadsfa', N'strasfasfing', 1, CAST(N'2023-06-19T23:58:01.987' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (10064, 0, N'rinshinu@gmail.com', N'Adafkl12341a', N'taha', N'asdasd', 1, CAST(N'2023-10-15T20:56:34.010' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserType], [UserName], [Password], [FirtsName], [LastName], [IsActive], [CreateDate], [CreateUserId], [UpdateDate], [UpdateUserId]) VALUES (10066, 0, N'iacar880a0@gmail.com', N'asfagsdkşjA123', N'asd', N'asf', 1, CAST(N'2023-10-16T21:12:20.610' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Company]    Script Date: 5.11.2023 13:03:59 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Company] ON [dbo].[Company]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User]    Script Date: 5.11.2023 13:03:59 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_User] ON [dbo].[User]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF_Company_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductComment] ADD  CONSTRAINT [DF_ProductComment_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_Product]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_User]
GO
ALTER TABLE [dbo].[InvoiceProduct]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceProduct_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([Id])
GO
ALTER TABLE [dbo].[InvoiceProduct] CHECK CONSTRAINT [FK_InvoiceProduct_Invoice]
GO
ALTER TABLE [dbo].[InvoiceProduct]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceProduct_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[InvoiceProduct] CHECK CONSTRAINT [FK_InvoiceProduct_Product]
GO
ALTER TABLE [dbo].[InvoiceStatusLog]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceStatusLog_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([Id])
GO
ALTER TABLE [dbo].[InvoiceStatusLog] CHECK CONSTRAINT [FK_InvoiceStatusLog_Invoice]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Company]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ProductCategory] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[ProductComment]  WITH CHECK ADD  CONSTRAINT [FK_ProductComment_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_Product]
GO
ALTER TABLE [dbo].[ProductComment]  WITH CHECK ADD  CONSTRAINT [FK_ProductComment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_EnumUserType] FOREIGN KEY([UserType])
REFERENCES [dbo].[EnumUserType] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_EnumUserType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total * 100 / Product.Vat (Second)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InvoiceProduct', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product.Price * Qty (Firts)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InvoiceProduct', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tax+Total (Last)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InvoiceProduct', @level2type=N'COLUMN',@level2name=N'LineTotal'
GO
USE [master]
GO
ALTER DATABASE [evsellDb] SET  READ_WRITE 
GO
