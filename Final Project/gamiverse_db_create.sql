/****** Object:  Database [Gamiverse]    Script Date: 11/18/2018 1:07:50 PM ******/
DROP DATABASE [Gamiverse]
GO

/****** Object:  Database [Gamiverse]    Script Date: 11/18/2018 1:07:50 PM ******/
CREATE DATABASE [Gamiverse]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 500 MB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO

ALTER DATABASE [Gamiverse] SET COMPATIBILITY_LEVEL = 140
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

ALTER DATABASE [Gamiverse] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Gamiverse] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Gamiverse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Gamiverse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Gamiverse] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Gamiverse] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Gamiverse] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Gamiverse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Gamiverse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Gamiverse] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO

ALTER DATABASE [Gamiverse] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Gamiverse] SET READ_COMMITTED_SNAPSHOT ON 
GO

ALTER DATABASE [Gamiverse] SET  MULTI_USER 
GO

ALTER DATABASE [Gamiverse] SET ENCRYPTION ON
GO

ALTER DATABASE [Gamiverse] SET QUERY_STORE = ON
GO

ALTER DATABASE [Gamiverse] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO

ALTER DATABASE [Gamiverse] SET  READ_WRITE 
GO

