USE [master]
GO
/****** Object:  Database [status]    Script Date: 27/12/2021 01:15:13 ******/
CREATE DATABASE [status]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'status', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\status.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'status_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\status_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [status] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [status].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [status] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [status] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [status] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [status] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [status] SET ARITHABORT OFF 
GO
ALTER DATABASE [status] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [status] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [status] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [status] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [status] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [status] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [status] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [status] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [status] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [status] SET  DISABLE_BROKER 
GO
ALTER DATABASE [status] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [status] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [status] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [status] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [status] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [status] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [status] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [status] SET RECOVERY FULL 
GO
ALTER DATABASE [status] SET  MULTI_USER 
GO
ALTER DATABASE [status] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [status] SET DB_CHAINING OFF 
GO
ALTER DATABASE [status] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [status] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [status] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [status] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'status', N'ON'
GO
ALTER DATABASE [status] SET QUERY_STORE = OFF
GO
USE [status]
GO
/****** Object:  User [s]    Script Date: 27/12/2021 01:15:13 ******/
CREATE USER [s] FOR LOGIN [s] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Node]    Script Date: 27/12/2021 01:15:13 ******/
CREATE USER [Node] FOR LOGIN [Node] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ch]    Script Date: 27/12/2021 01:15:13 ******/
CREATE USER [ch] FOR LOGIN [ch] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [cc]    Script Date: 27/12/2021 01:15:13 ******/
CREATE USER [cc] FOR LOGIN [cc] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [c]    Script Date: 27/12/2021 01:15:13 ******/
CREATE USER [c] FOR LOGIN [c] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ab]    Script Date: 27/12/2021 01:15:13 ******/
CREATE USER [ab] FOR LOGIN [ab] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [Node]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [cc]
GO
ALTER ROLE [db_datareader] ADD MEMBER [cc]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [cc]
GO
ALTER ROLE [db_datareader] ADD MEMBER [c]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [c]
GO
/****** Object:  Table [dbo].[status1]    Script Date: 27/12/2021 01:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status1](
	[num] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[init] [nvarchar](20) NULL,
	[final] [nvarchar](20) NULL,
	[orphan] [nvarchar](20) NULL,
 CONSTRAINT [PK_status1] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transition]    Script Date: 27/12/2021 01:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transition](
	[name] [nvarchar](30) NULL,
	[fromStatus] [nvarchar](30) NULL,
	[toStatus] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddStatus]    Script Date: 27/12/2021 01:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddStatus]
	 @name nvarchar(30)

	AS
BEGIN	
	 declare @count nvarchar(30)
	 SELECT @count = Count(*)
	 FROM status1 
	 IF @count=0
	 BEGIN
	 INSERT INTO status1
	 VALUES(@name,'true','true',NULL)
	 END
	 ELSE
	 BEGIN
	 INSERT INTO status1
	 VALUES(@name,NULL,'true','true')
	 END


    -- Insert statements for procedure here
	
END
GO
/****** Object:  StoredProcedure [dbo].[addTransition]    Script Date: 27/12/2021 01:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addTransition]
    (@name nvarchar(30),
	@fromStatus nvarchar(30),
	@toStatus nvarchar(30))
AS
BEGIN
	INSERT INTO transition
	VALUES(@name,@fromStatus,@toStatus)
	UPDATE status1
	SET final = null
	WHERE name=@fromStatus

	UPDATE status1
	SET orphan = null
	WHERE name=@toStatus
END
GO
/****** Object:  StoredProcedure [dbo].[AddTransition1]    Script Date: 27/12/2021 01:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddTransition1]
    (@name nvarchar(30),
	@fromStatus nvarchar(30),
	@toStatus nvarchar(30))
AS
BEGIN
	INSERT INTO transition
	VALUES(@name,@fromStatus,@toStatus)
	UPDATE status1
	SET final=NULL WHERE name=@fromStatus

	UPDATE status1
	SET orphan=NULL WHERE name=@toStatus
END
GO
/****** Object:  StoredProcedure [dbo].[allTransitions]    Script Date: 27/12/2021 01:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[allTransitions]
	
	AS
BEGIN
	select * from transition
END
GO
/****** Object:  StoredProcedure [dbo].[GetStatuses]    Script Date: 27/12/2021 01:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetStatuses]
	-- Add the parameters for the stored procedure here
 AS
BEGIN
	select * from status1 ORDER BY num 
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveStatus]    Script Date: 27/12/2021 01:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveStatus] 
@name  nvarchar(30)
	AS
BEGIN
	DECLARE @init nvarchar(30)
	SELECT @init = init FROM status1
	WHERE name=@name
	print @init
	IF @init='true'
		BEGIN
	 
			DECLARE @statusName nvarchar(30)

			SELECT TOP 1 @statusName=name from status1
			WHERE init is null

			print @statusName

			UPDATE status1
			SET init='true' WHERE name=@statusName

			UPDATE status1
			SET orphan=null WHERE name=@statusName
		END
	DELETE FROM status1 WHERE name=@name
	DELETE FROM transition where fromStatus=@name OR toStatus=@name
	

    
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveTransition]    Script Date: 27/12/2021 01:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE   [dbo].[RemoveTransition]
	(@name nvarchar(30),
	@fromStatus nvarchar(30),
	@toStatus nvarchar(30))
AS
BEGIN
DECLARE @countFrom int
DECLARE @countTo int
	 SELECT @countFrom = count(*)
	 FROM transition
	 WHERE fromStatus =@fromStatus

	 SELECT @countTo = count(*)
	 FROM transition
	 WHERE toStatus = @toStatus

	 print @countFrom
	 print @countTo

	 if @countFrom=1
	 BEGIN
	 UPDATE Status1
	 SET final ='true'
	 WHERE name = @fromStatus

	 END

	  if @countTo=1
	 BEGIN
	 UPDATE Status1
	 SET orphan ='true'
	 WHERE name = @toStatus and init is null

	 END
	 delete from transition
	 where name = @name
	 And fromStatus =@fromStatus
	 AND toStatus = @toStatus
END
GO
/****** Object:  StoredProcedure [dbo].[RESET]    Script Date: 27/12/2021 01:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RESET] 
	 
AS
BEGIN
	 delete transition
	 delete status1
END
GO
/****** Object:  StoredProcedure [dbo].[SetInit]    Script Date: 27/12/2021 01:15:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetInit] 
	-- Add the parameters for the stored procedure here
	 @Name  nvarchar(30)
AS
BEGIN
     declare @initName nvarchar(30)
	 SELECT @initName = name FROM status1
	 WHERE init='true'

     update status1 
	 SET init = null
 
	 update status1 
	 SET init = 'true'
	 where name = @Name

	 update status1 
	 SET orphan = null
	 where name = @Name

	 declare @count nvarchar(30)
	 SELECT @count = Count(*)
	 FROM transition WHERE toStatus= @initName

	 IF @count= 0
	 BEGIN
	  UPDATE status1 
	  SET orphan = 'true'
	  WHERE name = @initName
	 END 
	 SELECT * FROM status1
END

--exec SetInit aa
GO
USE [master]
GO
ALTER DATABASE [status] SET  READ_WRITE 
GO
