USE [master]
GO
/****** Object:  Database [GravityBooks_DWH]    Script Date: 1/15/2025 9:52:47 PM ******/
CREATE DATABASE [GravityBooks_DWH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GravityBooks_DWH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GravityBooks_DWH.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GravityBooks_DWH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GravityBooks_DWH_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GravityBooks_DWH] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GravityBooks_DWH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GravityBooks_DWH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET ARITHABORT OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GravityBooks_DWH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GravityBooks_DWH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GravityBooks_DWH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GravityBooks_DWH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GravityBooks_DWH] SET  MULTI_USER 
GO
ALTER DATABASE [GravityBooks_DWH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GravityBooks_DWH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GravityBooks_DWH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GravityBooks_DWH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GravityBooks_DWH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GravityBooks_DWH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GravityBooks_DWH] SET QUERY_STORE = ON
GO
ALTER DATABASE [GravityBooks_DWH] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GravityBooks_DWH]
GO
/****** Object:  Table [dbo].[Dim_Address]    Script Date: 1/15/2025 9:52:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Address](
	[Address_id_PK_SK] [int] IDENTITY(1,1) NOT NULL,
	[Address_PK_BK] [int] NULL,
	[street_number] [varchar](10) NULL,
	[street_name] [varchar](200) NULL,
	[city] [varchar](100) NULL,
	[country_id_BK] [int] NULL,
	[country_name] [varchar](200) NULL,
	[status_id_BK] [int] NULL,
	[address_status] [varchar](30) NULL,
	[St_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Is_Current] [bit] NULL,
	[ssc] [int] NULL,
 CONSTRAINT [PK__Dim_Addr__A45EB5F5E36A88AE] PRIMARY KEY CLUSTERED 
(
	[Address_id_PK_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Author]    Script Date: 1/15/2025 9:52:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Author](
	[Author_PK_SK] [int] IDENTITY(1,1) NOT NULL,
	[Author_PK_BK] [int] NULL,
	[Author_name] [varchar](400) NULL,
	[St_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Is_Current] [bit] NULL,
	[ssc] [int] NULL,
 CONSTRAINT [PK__Dim_Auth__84CC3B291FA41502] PRIMARY KEY CLUSTERED 
(
	[Author_PK_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Book]    Script Date: 1/15/2025 9:52:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Book](
	[Book_PK_SK] [int] IDENTITY(1,1) NOT NULL,
	[Book_PK_BK] [int] NULL,
	[title] [varchar](400) NULL,
	[isbn13] [varchar](13) NULL,
	[Language_id_PK_BK] [int] NULL,
	[num_pages] [int] NULL,
	[publication_date] [date] NULL,
	[publisher_id_PK_BK] [int] NULL,
	[publisher_name] [nvarchar](1000) NULL,
	[Language_code] [varchar](8) NULL,
	[Language_name] [varchar](50) NULL,
	[St_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Is_Current] [bit] NULL,
	[ssc] [int] NULL,
 CONSTRAINT [PK__Dim_Book__E444772C1E6FB117] PRIMARY KEY CLUSTERED 
(
	[Book_PK_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Book_Author]    Script Date: 1/15/2025 9:52:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Book_Author](
	[FK_Book_PK_SK] [int] NULL,
	[FK_Author_PK_SK] [int] NULL,
	[St_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Is_Current] [bit] NULL,
	[ssc] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Customer]    Script Date: 1/15/2025 9:52:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Customer](
	[Customer_PK_SK] [int] IDENTITY(1,1) NOT NULL,
	[Customer_PK_BK] [int] NULL,
	[first_name] [varchar](200) NULL,
	[last_name] [varchar](200) NULL,
	[email] [varchar](350) NULL,
	[St_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Is_Current] [bit] NULL,
	[ssc] [int] NULL,
 CONSTRAINT [PK__Dim_Cust__3CF8A4DF42F9ADF2] PRIMARY KEY CLUSTERED 
(
	[Customer_PK_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Customer_Address]    Script Date: 1/15/2025 9:52:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Customer_Address](
	[FK_Address_id_PK_SK] [int] NULL,
	[FK_Customer_PK_SK] [int] NULL,
	[St_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Is_Current] [bit] NULL,
	[ssc] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Customer_Order]    Script Date: 1/15/2025 9:52:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Customer_Order](
	[OrderID_PK_SK] [int] IDENTITY(1,1) NOT NULL,
	[OrderID_BK] [int] NULL,
	[order_date] [datetime] NULL,
	[method_id_PK_BK] [int] NULL,
	[method_name] [varchar](100) NULL,
	[St_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Is_Current] [bit] NULL,
	[ssc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID_PK_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Order_History]    Script Date: 1/15/2025 9:52:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Order_History](
	[History_PK_SK] [int] IDENTITY(1,1) NOT NULL,
	[History_PK_BK] [int] NULL,
	[Status_ID_PK_BK] [int] NULL,
	[Status_Value] [int] NULL,
	[status_date] [datetime] NULL,
	[St_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Is_Current] [bit] NULL,
	[ssc] [int] NULL,
 CONSTRAINT [PK__Dim_Orde__B0C692E7DB868CA8] PRIMARY KEY CLUSTERED 
(
	[History_PK_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 1/15/2025 9:52:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateSK] [int] NOT NULL,
	[FullDate] [date] NOT NULL,
	[Day] [tinyint] NULL,
	[Month] [tinyint] NULL,
	[Year] [int] NULL,
	[Quarter] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTime]    Script Date: 1/15/2025 9:52:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTime](
	[TimeSK] [int] IDENTITY(1,1) NOT NULL,
	[Time] [time](0) NOT NULL,
	[Hour] [char](2) NOT NULL,
	[MilitaryHour] [char](2) NOT NULL,
	[Minute] [char](2) NOT NULL,
	[Second] [char](2) NOT NULL,
	[AmPm] [char](2) NOT NULL,
	[StandardTime] [char](11) NULL,
 CONSTRAINT [PK_DimTime] PRIMARY KEY CLUSTERED 
(
	[TimeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Sales]    Script Date: 1/15/2025 9:52:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Sales](
	[Fact_Sales_PK_SK] [int] NOT NULL,
	[FK_Book_PK_SK] [int] NULL,
	[FK_History_PK_SK] [int] NULL,
	[FK_Customer_PK_SK] [int] NULL,
	[FK_order_id_PK_BK] [int] NULL,
	[FK_Time_SK] [int] NULL,
	[FK_Date_SK] [int] NULL,
	[LineID_PK_BK_DD] [int] NULL,
	[price] [decimal](5, 2) NULL,
	[cost_shipping] [decimal](6, 2) NULL,
 CONSTRAINT [PK__Fact_Sal__D2FD870476579F2D] PRIMARY KEY CLUSTERED 
(
	[Fact_Sales_PK_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimTime_AmPm]    Script Date: 1/15/2025 9:52:48 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimTime_AmPm] ON [dbo].[DimTime]
(
	[AmPm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimTime_Hour]    Script Date: 1/15/2025 9:52:48 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimTime_Hour] ON [dbo].[DimTime]
(
	[Hour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimTime_MilitaryHour]    Script Date: 1/15/2025 9:52:48 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimTime_MilitaryHour] ON [dbo].[DimTime]
(
	[MilitaryHour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimTime_Minute]    Script Date: 1/15/2025 9:52:48 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimTime_Minute] ON [dbo].[DimTime]
(
	[Minute] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimTime_Second]    Script Date: 1/15/2025 9:52:48 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimTime_Second] ON [dbo].[DimTime]
(
	[Second] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimTime_StandardTime]    Script Date: 1/15/2025 9:52:48 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimTime_StandardTime] ON [dbo].[DimTime]
(
	[StandardTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimTime_Time]    Script Date: 1/15/2025 9:52:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_DimTime_Time] ON [dbo].[DimTime]
(
	[Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Book_Author]  WITH CHECK ADD  CONSTRAINT [FK__Dim_Book___FK_Au__412EB0B6] FOREIGN KEY([FK_Author_PK_SK])
REFERENCES [dbo].[Dim_Author] ([Author_PK_SK])
GO
ALTER TABLE [dbo].[Dim_Book_Author] CHECK CONSTRAINT [FK__Dim_Book___FK_Au__412EB0B6]
GO
ALTER TABLE [dbo].[Dim_Book_Author]  WITH CHECK ADD  CONSTRAINT [FK__Dim_Book___FK_Bo__403A8C7D] FOREIGN KEY([FK_Book_PK_SK])
REFERENCES [dbo].[Dim_Book] ([Book_PK_SK])
GO
ALTER TABLE [dbo].[Dim_Book_Author] CHECK CONSTRAINT [FK__Dim_Book___FK_Bo__403A8C7D]
GO
ALTER TABLE [dbo].[Dim_Customer_Address]  WITH CHECK ADD  CONSTRAINT [FK__Dim_Custo__FK_Ad__47DBAE45] FOREIGN KEY([FK_Address_id_PK_SK])
REFERENCES [dbo].[Dim_Address] ([Address_id_PK_SK])
GO
ALTER TABLE [dbo].[Dim_Customer_Address] CHECK CONSTRAINT [FK__Dim_Custo__FK_Ad__47DBAE45]
GO
ALTER TABLE [dbo].[Dim_Customer_Address]  WITH CHECK ADD  CONSTRAINT [FK__Dim_Custo__FK_Cu__46E78A0C] FOREIGN KEY([FK_Customer_PK_SK])
REFERENCES [dbo].[Dim_Customer] ([Customer_PK_SK])
GO
ALTER TABLE [dbo].[Dim_Customer_Address] CHECK CONSTRAINT [FK__Dim_Custo__FK_Cu__46E78A0C]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK__Fact_Sale__FK_Bo__4CA06362] FOREIGN KEY([FK_Book_PK_SK])
REFERENCES [dbo].[Dim_Book] ([Book_PK_SK])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK__Fact_Sale__FK_Bo__4CA06362]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK__Fact_Sale__FK_Cu__4E88ABD4] FOREIGN KEY([FK_Customer_PK_SK])
REFERENCES [dbo].[Dim_Customer] ([Customer_PK_SK])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK__Fact_Sale__FK_Cu__4E88ABD4]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK__Fact_Sale__FK_Da__5165187F] FOREIGN KEY([FK_Date_SK])
REFERENCES [dbo].[DimDate] ([DateSK])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK__Fact_Sale__FK_Da__5165187F]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK__Fact_Sale__FK_Hi__4D94879B] FOREIGN KEY([FK_History_PK_SK])
REFERENCES [dbo].[Dim_Order_History] ([History_PK_SK])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK__Fact_Sale__FK_Hi__4D94879B]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Customer_Order] FOREIGN KEY([FK_order_id_PK_BK])
REFERENCES [dbo].[Dim_Customer_Order] ([OrderID_PK_SK])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_Dim_Customer_Order]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_DimTime] FOREIGN KEY([FK_Time_SK])
REFERENCES [dbo].[DimTime] ([TimeSK])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_DimTime]
GO
USE [master]
GO
ALTER DATABASE [GravityBooks_DWH] SET  READ_WRITE 
GO
