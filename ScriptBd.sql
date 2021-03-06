USE [master]
GO
/****** Object:  Database [BankingSystem]    Script Date: 29.10.2021 2:40:44 ******/
CREATE DATABASE [BankingSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BankingSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BankingSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BankingSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BankingSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BankingSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BankingSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BankingSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BankingSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BankingSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BankingSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BankingSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [BankingSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BankingSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BankingSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BankingSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BankingSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BankingSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BankingSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BankingSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BankingSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BankingSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BankingSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BankingSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BankingSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BankingSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BankingSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BankingSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BankingSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BankingSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [BankingSystem] SET  MULTI_USER 
GO
ALTER DATABASE [BankingSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BankingSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BankingSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BankingSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BankingSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BankingSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BankingSystem', N'ON'
GO
ALTER DATABASE [BankingSystem] SET QUERY_STORE = OFF
GO
USE [BankingSystem]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 29.10.2021 2:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [int] NOT NULL,
	[Balance] [float] NULL,
	[ClientsId] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 29.10.2021 2:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banks](
	[BankId] [int] NOT NULL,
	[NameBank] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 29.10.2021 2:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[BranchesId] [int] NOT NULL,
	[СityId] [int] NOT NULL,
	[BankId] [int] NOT NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[BranchesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 29.10.2021 2:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[IdCard] [int] NOT NULL,
	[OwnerName] [varchar](20) NOT NULL,
	[Balance] [float] NOT NULL,
	[BankId] [int] NOT NULL,
	[AccountId] [int] NULL,
	[SocialStatusId] [int] NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[IdCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 29.10.2021 2:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[СityId] [int] NOT NULL,
	[NameСity] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[СityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 29.10.2021 2:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientId] [int] NOT NULL,
	[Name] [varchar](25) NOT NULL,
	[Surname] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialStatuses]    Script Date: 29.10.2021 2:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialStatuses](
	[SocialStatusId] [int] NOT NULL,
	[Name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_SocialStatuses] PRIMARY KEY CLUSTERED 
(
	[SocialStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 29.10.2021 2:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[StatusId] [int] NOT NULL,
	[SocialStatusId] [int] NOT NULL,
	[ClientsId] [int] NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([AccountId], [Balance], [ClientsId]) VALUES (1, 0, 1)
INSERT [dbo].[Accounts] ([AccountId], [Balance], [ClientsId]) VALUES (2, 200, 2)
INSERT [dbo].[Accounts] ([AccountId], [Balance], [ClientsId]) VALUES (3, 300, 3)
INSERT [dbo].[Accounts] ([AccountId], [Balance], [ClientsId]) VALUES (4, 100, 4)
INSERT [dbo].[Accounts] ([AccountId], [Balance], [ClientsId]) VALUES (5, 100, 5)
GO
INSERT [dbo].[Banks] ([BankId], [NameBank]) VALUES (1, N'Sberbank  ')
INSERT [dbo].[Banks] ([BankId], [NameBank]) VALUES (2, N'VTB')
INSERT [dbo].[Banks] ([BankId], [NameBank]) VALUES (3, N'Rosselkhozbank')
INSERT [dbo].[Banks] ([BankId], [NameBank]) VALUES (4, N'Gazprombank')
INSERT [dbo].[Banks] ([BankId], [NameBank]) VALUES (5, N'Premiumbank')
GO
INSERT [dbo].[Branches] ([BranchesId], [СityId], [BankId]) VALUES (1, 1, 1)
INSERT [dbo].[Branches] ([BranchesId], [СityId], [BankId]) VALUES (2, 1, 2)
INSERT [dbo].[Branches] ([BranchesId], [СityId], [BankId]) VALUES (3, 1, 3)
INSERT [dbo].[Branches] ([BranchesId], [СityId], [BankId]) VALUES (4, 1, 4)
INSERT [dbo].[Branches] ([BranchesId], [СityId], [BankId]) VALUES (5, 1, 5)
GO
INSERT [dbo].[Cards] ([IdCard], [OwnerName], [Balance], [BankId], [AccountId], [SocialStatusId]) VALUES (1, N'Jony', 24, 1, 1, 1)
INSERT [dbo].[Cards] ([IdCard], [OwnerName], [Balance], [BankId], [AccountId], [SocialStatusId]) VALUES (2, N'Valera', 100, 1, 2, 2)
INSERT [dbo].[Cards] ([IdCard], [OwnerName], [Balance], [BankId], [AccountId], [SocialStatusId]) VALUES (3, N'Kirill', 100, 1, 3, 3)
INSERT [dbo].[Cards] ([IdCard], [OwnerName], [Balance], [BankId], [AccountId], [SocialStatusId]) VALUES (4, N'Vasiliy', 100, 2, 4, 3)
INSERT [dbo].[Cards] ([IdCard], [OwnerName], [Balance], [BankId], [AccountId], [SocialStatusId]) VALUES (5, N'Ilya', 100, 2, 5, 2)
INSERT [dbo].[Cards] ([IdCard], [OwnerName], [Balance], [BankId], [AccountId], [SocialStatusId]) VALUES (6, N'Viktor', 100, 3, 2, 4)
GO
INSERT [dbo].[Cities] ([СityId], [NameСity]) VALUES (1, N'Minsk')
INSERT [dbo].[Cities] ([СityId], [NameСity]) VALUES (2, N'Vitebsk')
INSERT [dbo].[Cities] ([СityId], [NameСity]) VALUES (3, N'Gomel')
INSERT [dbo].[Cities] ([СityId], [NameСity]) VALUES (4, N'Grodno')
INSERT [dbo].[Cities] ([СityId], [NameСity]) VALUES (5, N'Mogelev')
GO
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname]) VALUES (1, N'Ilia', N'Adamob')
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname]) VALUES (2, N'Ivanko', N'Pitrov')
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname]) VALUES (3, N'Vad', N'Isamov')
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname]) VALUES (4, N'Petrov', N'Vadko')
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname]) VALUES (5, N'Ivan', N'Pastor')
GO
INSERT [dbo].[SocialStatuses] ([SocialStatusId], [Name]) VALUES (1, N'unemployed')
INSERT [dbo].[SocialStatuses] ([SocialStatusId], [Name]) VALUES (2, N'employed')
INSERT [dbo].[SocialStatuses] ([SocialStatusId], [Name]) VALUES (3, N'retiree')
INSERT [dbo].[SocialStatuses] ([SocialStatusId], [Name]) VALUES (4, N'cripple')
GO
INSERT [dbo].[Statuses] ([StatusId], [SocialStatusId], [ClientsId]) VALUES (1, 1, 1)
INSERT [dbo].[Statuses] ([StatusId], [SocialStatusId], [ClientsId]) VALUES (2, 1, 2)
INSERT [dbo].[Statuses] ([StatusId], [SocialStatusId], [ClientsId]) VALUES (3, 2, 3)
INSERT [dbo].[Statuses] ([StatusId], [SocialStatusId], [ClientsId]) VALUES (4, 2, 4)
INSERT [dbo].[Statuses] ([StatusId], [SocialStatusId], [ClientsId]) VALUES (5, 2, 2)
INSERT [dbo].[Statuses] ([StatusId], [SocialStatusId], [ClientsId]) VALUES (6, 3, 1)
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Clients] FOREIGN KEY([ClientsId])
REFERENCES [dbo].[Clients] ([ClientId])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Clients]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Banks] FOREIGN KEY([BankId])
REFERENCES [dbo].[Banks] ([BankId])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Banks]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Cities] FOREIGN KEY([СityId])
REFERENCES [dbo].[Cities] ([СityId])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Cities]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Accounts]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Banks] FOREIGN KEY([BankId])
REFERENCES [dbo].[Banks] ([BankId])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Banks]
GO
ALTER TABLE [dbo].[Statuses]  WITH CHECK ADD  CONSTRAINT [FK_Statuses_Clients] FOREIGN KEY([ClientsId])
REFERENCES [dbo].[Clients] ([ClientId])
GO
ALTER TABLE [dbo].[Statuses] CHECK CONSTRAINT [FK_Statuses_Clients]
GO
ALTER TABLE [dbo].[Statuses]  WITH CHECK ADD  CONSTRAINT [FK_Statuses_SocialStatuses] FOREIGN KEY([SocialStatusId])
REFERENCES [dbo].[SocialStatuses] ([SocialStatusId])
GO
ALTER TABLE [dbo].[Statuses] CHECK CONSTRAINT [FK_Statuses_SocialStatuses]
GO
/****** Object:  StoredProcedure [dbo].[sp_Accrual]    Script Date: 29.10.2021 2:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Accrual] AS
BEGIN
    UPDATE Accounts
	SET Balance += 10 * (SELECT COUNT(Statuses.SocialStatusId)
						 FROM Statuses
						 where Clients.ClientId = Statuses.ClientsId)
	FROM Accounts
	JOIN Clients on Clients.ClientId = Accounts.AccountId
	
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Balance]    Script Date: 29.10.2021 2:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Balance]
AS
BEGIN
   SELECT Clients.Surname, Accounts.Balance - SUM(Cards.Balance) AS Excess 
   FROM Clients
   JOIN Accounts on Accounts.ClientsId = Clients.ClientId
   JOIN Cards on Cards.AccountId = Accounts.AccountId
   GROUP BY  Clients.Surname,Accounts.Balance
   HAVING Accounts.Balance  - SUM(Cards.Balance) != 0
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_MoneyTransfer]    Script Date: 29.10.2021 2:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_MoneyTransfer]
@accountId int,  
@CardId int, 
@transferAmount float
as
declare @setAcc int  
declare @setCard int  
declare @maxerr int  
set @maxerr = 0 
BEGIN TRANSACTION 

	UPDATE Accounts
	SET Balance -= @transferAmount
	WHERE AccountId = @accountId
			

set @setAcc = @@error  
	if @setAcc > @maxerr  
set @maxerr = @setAcc

	UPDATE Cards
	SET Balance += @transferAmount
	WHERE IdCard = @CardId
		 AND  AccountId = @accountId

set @setCard = @@error  
	if @setCard > @maxerr  
set @maxerr = @setCard
	if @maxerr <> 0  
begin  
	ROLLBACK  
		print 'Transaction rolled back'  
end  
else  
begin  
	COMMIT  
		print 'Transaction committed'  
end  
print 'SETACCOUNT error number:' + cast(@setAcc as nvarchar(8))  
print 'SETCARD error number:' + cast(@setAcc as nvarchar(8))
return @maxerr
GO
USE [master]
GO
ALTER DATABASE [BankingSystem] SET  READ_WRITE 
GO
