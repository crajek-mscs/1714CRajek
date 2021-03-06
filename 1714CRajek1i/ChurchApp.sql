USE [master]
GO
/****** Object:  Database [ChurchApp]    Script Date: 9/24/2020 5:35:05 PM ******/
CREATE DATABASE [ChurchApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChurchApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChurchApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChurchApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChurchApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ChurchApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChurchApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChurchApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChurchApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChurchApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChurchApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChurchApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChurchApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChurchApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChurchApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChurchApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChurchApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChurchApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChurchApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChurchApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChurchApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChurchApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChurchApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChurchApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChurchApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChurchApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChurchApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChurchApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChurchApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChurchApp] SET RECOVERY FULL 
GO
ALTER DATABASE [ChurchApp] SET  MULTI_USER 
GO
ALTER DATABASE [ChurchApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChurchApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChurchApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChurchApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChurchApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChurchApp', N'ON'
GO
ALTER DATABASE [ChurchApp] SET QUERY_STORE = OFF
GO
USE [ChurchApp]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 9/24/2020 5:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[ChurchId] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusinessTransaction]    Script Date: 9/24/2020 5:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessTransaction](
	[BusinessTransactionId] [int] IDENTITY(101,1) NOT NULL,
	[PersonId] [nvarchar](50) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[Amount] [smallmoney] NOT NULL,
	[TransactionTypeId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[BusinessTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Church]    Script Date: 9/24/2020 5:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Church](
	[ChurchId] [int] IDENTITY(1,1) NOT NULL,
	[ChurchName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Church] PRIMARY KEY CLUSTERED 
(
	[ChurchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doner]    Script Date: 9/24/2020 5:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doner](
	[DonerId] [int] IDENTITY(1,1) NOT NULL,
	[DateOfDonation] [smalldatetime] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_Doner] PRIMARY KEY CLUSTERED 
(
	[DonerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 9/24/2020 5:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[DateJoined] [smalldatetime] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pastor]    Script Date: 9/24/2020 5:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pastor](
	[PastorId] [int] IDENTITY(1,1) NOT NULL,
	[DateOfOrdination] [smalldatetime] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_Pastor] PRIMARY KEY CLUSTERED 
(
	[PastorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/24/2020 5:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[DescriptionOfRole] [nvarchar](50) NOT NULL,
	[DateOfBirth] [smalldatetime] NOT NULL,
	[ChurchId] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 9/24/2020 5:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[TransactionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[TransactionCategory] [nvarchar](50) NOT NULL,
	[BusinessTransactionId] [int] NOT NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressId], [PersonId], [ChurchId], [Address], [City], [State], [Zip]) VALUES (1, 1, 1, N'123 NW 1st St.', N'New York', N'NY', 10003)
INSERT [dbo].[Address] ([AddressId], [PersonId], [ChurchId], [Address], [City], [State], [Zip]) VALUES (2, 2, 1, N'124 N 2nd St.', N'New York', N'NY', 10003)
INSERT [dbo].[Address] ([AddressId], [PersonId], [ChurchId], [Address], [City], [State], [Zip]) VALUES (3, 3, 1, N'125 NE 3rd St.', N'New York', N'NY', 10003)
INSERT [dbo].[Address] ([AddressId], [PersonId], [ChurchId], [Address], [City], [State], [Zip]) VALUES (4, 4, 1, N'126 N. 4th St.', N'New York', N'NY', 10003)
INSERT [dbo].[Address] ([AddressId], [PersonId], [ChurchId], [Address], [City], [State], [Zip]) VALUES (5, 5, 1, N'127 NW 5th St.', N'New York', N'NY', 10003)
INSERT [dbo].[Address] ([AddressId], [PersonId], [ChurchId], [Address], [City], [State], [Zip]) VALUES (6, 6, 2, N'324 SW A Ave.', N'Chicago', N'IL', 60003)
INSERT [dbo].[Address] ([AddressId], [PersonId], [ChurchId], [Address], [City], [State], [Zip]) VALUES (7, 7, 2, N'433 E. B Ave.', N'Chicago', N'IL', 60003)
INSERT [dbo].[Address] ([AddressId], [PersonId], [ChurchId], [Address], [City], [State], [Zip]) VALUES (8, 8, 3, N'525 W. C Ave.', N'Des Moines', N'IA', 50302)
INSERT [dbo].[Address] ([AddressId], [PersonId], [ChurchId], [Address], [City], [State], [Zip]) VALUES (9, 9, 3, N'624 NE. D Ave', N'Des Moines', N'IA', 50302)
INSERT [dbo].[Address] ([AddressId], [PersonId], [ChurchId], [Address], [City], [State], [Zip]) VALUES (10, 10, 2, N'721 SE. E Ave.', N'Chicago', N'IL', 60003)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[BusinessTransaction] ON 

INSERT [dbo].[BusinessTransaction] ([BusinessTransactionId], [PersonId], [Date], [Amount], [TransactionTypeId]) VALUES (101, N'7', CAST(N'2019-07-13T00:00:00' AS SmallDateTime), 832.8400, N'1')
INSERT [dbo].[BusinessTransaction] ([BusinessTransactionId], [PersonId], [Date], [Amount], [TransactionTypeId]) VALUES (102, N'4', CAST(N'2017-12-31T00:00:00' AS SmallDateTime), 10000.0000, N'2')
SET IDENTITY_INSERT [dbo].[BusinessTransaction] OFF
GO
SET IDENTITY_INSERT [dbo].[Church] ON 

INSERT [dbo].[Church] ([ChurchId], [ChurchName], [Address], [City], [State], [Zip], [Phone]) VALUES (1, N'PeopleOfGod', N'222 N. Church Ave.', N'New York', N'NY', N'10003', N'518-555-1212')
INSERT [dbo].[Church] ([ChurchId], [ChurchName], [Address], [City], [State], [Zip], [Phone]) VALUES (2, N'Living Waters', N'896 SE. Pathway St.', N'Chicago', N'IL', N'60007', N'312-555-3131')
INSERT [dbo].[Church] ([ChurchId], [ChurchName], [Address], [City], [State], [Zip], [Phone]) VALUES (3, N'Redeemer', N'522 W. Highland Ave.', N'Des Moines', N'IA', N'50302', N'515-555-4256')
SET IDENTITY_INSERT [dbo].[Church] OFF
GO
SET IDENTITY_INSERT [dbo].[Doner] ON 

INSERT [dbo].[Doner] ([DonerId], [DateOfDonation], [PersonId]) VALUES (1, CAST(N'2020-09-21T00:00:00' AS SmallDateTime), 7)
INSERT [dbo].[Doner] ([DonerId], [DateOfDonation], [PersonId]) VALUES (2, CAST(N'2020-09-08T00:00:00' AS SmallDateTime), 4)
SET IDENTITY_INSERT [dbo].[Doner] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberId], [DateJoined], [PersonId]) VALUES (1, CAST(N'1974-10-12T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[Member] ([MemberId], [DateJoined], [PersonId]) VALUES (2, CAST(N'1963-11-01T00:00:00' AS SmallDateTime), 2)
INSERT [dbo].[Member] ([MemberId], [DateJoined], [PersonId]) VALUES (3, CAST(N'1984-04-15T00:00:00' AS SmallDateTime), 3)
INSERT [dbo].[Member] ([MemberId], [DateJoined], [PersonId]) VALUES (4, CAST(N'1992-05-15T00:00:00' AS SmallDateTime), 4)
INSERT [dbo].[Member] ([MemberId], [DateJoined], [PersonId]) VALUES (5, CAST(N'2002-03-23T00:00:00' AS SmallDateTime), 7)
INSERT [dbo].[Member] ([MemberId], [DateJoined], [PersonId]) VALUES (6, CAST(N'2003-07-21T00:00:00' AS SmallDateTime), 8)
INSERT [dbo].[Member] ([MemberId], [DateJoined], [PersonId]) VALUES (7, CAST(N'2014-09-16T00:00:00' AS SmallDateTime), 10)
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Pastor] ON 

INSERT [dbo].[Pastor] ([PastorId], [DateOfOrdination], [PersonId]) VALUES (1, CAST(N'1999-06-10T00:00:00' AS SmallDateTime), 5)
INSERT [dbo].[Pastor] ([PastorId], [DateOfOrdination], [PersonId]) VALUES (2, CAST(N'2003-07-08T00:00:00' AS SmallDateTime), 6)
INSERT [dbo].[Pastor] ([PastorId], [DateOfOrdination], [PersonId]) VALUES (3, CAST(N'2001-06-28T00:00:00' AS SmallDateTime), 9)
SET IDENTITY_INSERT [dbo].[Pastor] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [ChurchId]) VALUES (1, N'George ', N'Cruz', N'518-555-1111', N'Member', CAST(N'1961-12-01T00:00:00' AS SmallDateTime), CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [ChurchId]) VALUES (2, N'Nancy', N'Stapleton', N'518-555-1112', N'Member', CAST(N'1950-08-20T00:00:00' AS SmallDateTime), CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [ChurchId]) VALUES (3, N'Helen', N'Lindblum', N'518-555-1113', N'Member', CAST(N'1972-03-03T00:00:00' AS SmallDateTime), CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [ChurchId]) VALUES (4, N'Rick', N'Spensor', N'518-555-1114', N'Member', CAST(N'1988-05-21T00:00:00' AS SmallDateTime), CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [ChurchId]) VALUES (5, N'Steve', N'Savaske', N'518-555-1115', N'Pastor', CAST(N'1985-07-29T00:00:00' AS SmallDateTime), CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [ChurchId]) VALUES (6, N'Timothy', N'Halvorsen', N'312-555-1116', N'Pastor', CAST(N'1975-04-19T00:00:00' AS SmallDateTime), CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [ChurchId]) VALUES (7, N'Sheela', N'Timpleton', N'312-555-1117', N'Member', CAST(N'1962-06-23T00:00:00' AS SmallDateTime), CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [ChurchId]) VALUES (8, N'Esther', N'Kiepke', N'515-555-1118', N'Member', CAST(N'1958-11-23T00:00:00' AS SmallDateTime), CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [ChurchId]) VALUES (9, N'Mark', N'Kotch', N'515-555-1119', N'Pastor', CAST(N'1962-10-18T00:00:00' AS SmallDateTime), CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [ChurchId]) VALUES (10, N'Cassandra', N'Hersch', N'312-555-1110', N'PotentialMember', CAST(N'1982-01-08T00:00:00' AS SmallDateTime), CAST(2 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionType] ON 

INSERT [dbo].[TransactionType] ([TransactionTypeId], [Description], [TransactionCategory], [BusinessTransactionId]) VALUES (1, N'Flat Screen TV', N'In-kind', 101)
INSERT [dbo].[TransactionType] ([TransactionTypeId], [Description], [TransactionCategory], [BusinessTransactionId]) VALUES (2, N'Cash', N'Monetary', 102)
SET IDENTITY_INSERT [dbo].[TransactionType] OFF
GO
USE [master]
GO
ALTER DATABASE [ChurchApp] SET  READ_WRITE 
GO
