USE [master]
GO
/****** Object:  Database [Gamiverse]    Script Date: 10/2/2019 11:58:02 PM ******/
CREATE DATABASE [Gamiverse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gamiverse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Gamiverse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gamiverse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Gamiverse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Gamiverse] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gamiverse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gamiverse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gamiverse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gamiverse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gamiverse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gamiverse] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gamiverse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gamiverse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gamiverse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gamiverse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gamiverse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gamiverse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gamiverse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gamiverse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gamiverse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gamiverse] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Gamiverse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gamiverse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gamiverse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gamiverse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gamiverse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gamiverse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gamiverse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gamiverse] SET RECOVERY FULL 
GO
ALTER DATABASE [Gamiverse] SET  MULTI_USER 
GO
ALTER DATABASE [Gamiverse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gamiverse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gamiverse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gamiverse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gamiverse] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Gamiverse', N'ON'
GO
ALTER DATABASE [Gamiverse] SET QUERY_STORE = OFF
GO
USE [Gamiverse]
GO
/****** Object:  Table [dbo].[accessory_type]    Script Date: 10/2/2019 11:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accessory_type](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game]    Script Date: 10/2/2019 11:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game](
	[game_id] [int] IDENTITY(1,1) NOT NULL,
	[format_id] [int] NOT NULL,
	[game_name] [varchar](100) NULL,
	[game_description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game_accessory]    Script Date: 10/2/2019 11:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game_accessory](
	[accessory_id] [int] IDENTITY(1,1) NOT NULL,
	[edition_id] [int] NOT NULL,
	[publisher_id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
	[accessory_name] [varchar](150) NOT NULL,
	[accessory_description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game_edition]    Script Date: 10/2/2019 11:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game_edition](
	[edition_id] [int] IDENTITY(1,1) NOT NULL,
	[game_id] [int] NOT NULL,
	[edition_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[edition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game_format]    Script Date: 10/2/2019 11:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game_format](
	[format_id] [int] IDENTITY(1,1) NOT NULL,
	[format_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[format_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publisher]    Script Date: 10/2/2019 11:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publisher](
	[publisher_id] [int] IDENTITY(1,1) NOT NULL,
	[publisher_name] [varchar](100) NOT NULL,
	[address_1] [varchar](150) NULL,
	[address_2] [varchar](150) NULL,
	[zip_code] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publisher_contact]    Script Date: 10/2/2019 11:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publisher_contact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[publisher_id] [int] NOT NULL,
	[first_name] [varchar](100) NULL,
	[last_name] [varchar](100) NULL,
	[title] [varchar](100) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zipcode]    Script Date: 10/2/2019 11:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zipcode](
	[zip_code] [varchar](10) NOT NULL,
	[city] [varchar](100) NOT NULL,
	[state] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[zip_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idx_GameFormat]    Script Date: 10/2/2019 11:58:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_GameFormat] ON [dbo].[game]
(
	[format_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_GameAccessoryInfo]    Script Date: 10/2/2019 11:58:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_GameAccessoryInfo] ON [dbo].[game_accessory]
(
	[edition_id] ASC
)
INCLUDE ( 	[publisher_id],
	[type_id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_GameEdition]    Script Date: 10/2/2019 11:58:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_GameEdition] ON [dbo].[game_accessory]
(
	[edition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_GameType]    Script Date: 10/2/2019 11:58:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_GameType] ON [dbo].[game_accessory]
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_Publisher]    Script Date: 10/2/2019 11:58:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_Publisher] ON [dbo].[game_accessory]
(
	[publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_Game]    Script Date: 10/2/2019 11:58:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_Game] ON [dbo].[game_edition]
(
	[game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_ZipCode]    Script Date: 10/2/2019 11:58:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_ZipCode] ON [dbo].[publisher]
(
	[zip_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_Publisher]    Script Date: 10/2/2019 11:58:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_Publisher] ON [dbo].[publisher_contact]
(
	[publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[game]  WITH CHECK ADD FOREIGN KEY([format_id])
REFERENCES [dbo].[game_format] ([format_id])
GO
ALTER TABLE [dbo].[game_accessory]  WITH CHECK ADD FOREIGN KEY([edition_id])
REFERENCES [dbo].[game_edition] ([edition_id])
GO
ALTER TABLE [dbo].[game_accessory]  WITH CHECK ADD FOREIGN KEY([publisher_id])
REFERENCES [dbo].[publisher] ([publisher_id])
GO
ALTER TABLE [dbo].[game_accessory]  WITH CHECK ADD FOREIGN KEY([type_id])
REFERENCES [dbo].[accessory_type] ([type_id])
GO
ALTER TABLE [dbo].[game_edition]  WITH CHECK ADD FOREIGN KEY([game_id])
REFERENCES [dbo].[game] ([game_id])
GO
ALTER TABLE [dbo].[publisher]  WITH CHECK ADD FOREIGN KEY([zip_code])
REFERENCES [dbo].[zipcode] ([zip_code])
GO
ALTER TABLE [dbo].[publisher_contact]  WITH CHECK ADD FOREIGN KEY([publisher_id])
REFERENCES [dbo].[publisher] ([publisher_id])
GO
USE [master]
GO
ALTER DATABASE [Gamiverse] SET  READ_WRITE 
GO
