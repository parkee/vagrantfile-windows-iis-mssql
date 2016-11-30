USE [master]
GO

/****** Object:  Database [Activiti]    Script Date: 10/30/2014 3:54:00 PM ******/
CREATE DATABASE [Activiti] 
GO
ALTER DATABASE Activiti MODIFY FILE 
( NAME = N'Activiti' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
GO
ALTER DATABASE Activiti MODIFY FILE 
( NAME = N'Activiti_log' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Activiti] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Activiti].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Activiti] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Activiti] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Activiti] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Activiti] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Activiti] SET ARITHABORT OFF 
GO

ALTER DATABASE [Activiti] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Activiti] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [Activiti] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Activiti] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Activiti] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Activiti] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Activiti] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Activiti] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Activiti] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Activiti] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Activiti] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Activiti] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Activiti] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Activiti] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Activiti] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Activiti] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Activiti] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Activiti] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Activiti] SET RECOVERY FULL 
GO

ALTER DATABASE [Activiti] SET  MULTI_USER 
GO

ALTER DATABASE [Activiti] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Activiti] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Activiti] SET  READ_WRITE 
GO

CREATE LOGIN activiti 
    WITH PASSWORD = 'activiti',
	CHECK_POLICY = ON;
GO

USE [Activiti]
GO

-- Creates a database user for the login created above.
CREATE USER activiti FOR LOGIN activiti;
GO

EXEC sp_addrolemember N'db_owner', N'activiti'
EXEC sp_addrolemember N'db_datareader', N'activiti'
EXEC sp_addrolemember N'db_datawriter', N'activiti'
