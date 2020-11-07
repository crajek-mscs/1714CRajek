USE [master]
GO
/****** Object:  Database [Church_App1714v2]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE DATABASE [Church_App1714v2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Church_App1714v2', FILENAME = N'C:\Users\senio\Church_App1714v2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Church_App1714v2_log', FILENAME = N'C:\Users\senio\Church_App1714v2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Church_App1714v2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Church_App1714v2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Church_App1714v2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Church_App1714v2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Church_App1714v2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Church_App1714v2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Church_App1714v2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Church_App1714v2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Church_App1714v2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Church_App1714v2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Church_App1714v2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Church_App1714v2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Church_App1714v2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Church_App1714v2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Church_App1714v2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Church_App1714v2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Church_App1714v2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Church_App1714v2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Church_App1714v2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Church_App1714v2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Church_App1714v2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Church_App1714v2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Church_App1714v2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Church_App1714v2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Church_App1714v2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Church_App1714v2] SET  MULTI_USER 
GO
ALTER DATABASE [Church_App1714v2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Church_App1714v2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Church_App1714v2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Church_App1714v2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Church_App1714v2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Church_App1714v2] SET QUERY_STORE = OFF
GO
USE [Church_App1714v2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Church_App1714v2]
GO
/****** Object:  Table [dbo].[BusinessTransactions]    Script Date: 11/7/2020 6:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessTransactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[Amount] [smallmoney] NOT NULL,
	[Person_Id] [int] NOT NULL,
 CONSTRAINT [PK_BusinessTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Churches]    Script Date: 11/7/2020 6:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Churches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChurchName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Churches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doners]    Script Date: 11/7/2020 6:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateOfDonation] [smalldatetime] NOT NULL,
	[Person_Id] [int] NOT NULL,
	[Church_Id] [int] NOT NULL,
 CONSTRAINT [PK_Doners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 11/7/2020 6:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[Zip] [nvarchar](max) NOT NULL,
	[Church_Id] [int] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 11/7/2020 6:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateJoined] [nvarchar](max) NOT NULL,
	[Person_Id] [int] NOT NULL,
	[Church_Id] [int] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pastors]    Script Date: 11/7/2020 6:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pastors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateOfOrdination] [nvarchar](max) NOT NULL,
	[Person_Id] [int] NOT NULL,
	[Church_Id] [int] NOT NULL,
 CONSTRAINT [PK_Pastors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 11/7/2020 6:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[DescriptionOfRole] [nvarchar](max) NOT NULL,
	[DateOfBirth] [nvarchar](max) NOT NULL,
	[Location_Id] [int] NOT NULL,
	[Church_Id] [int] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PotentialMembers]    Script Date: 11/7/2020 6:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PotentialMembers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateOfContact] [nvarchar](max) NOT NULL,
	[Person_Id] [int] NOT NULL,
 CONSTRAINT [PK_PotentialMembers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransationTypes]    Script Date: 11/7/2020 6:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[TransactionCategory] [nvarchar](max) NOT NULL,
	[BusinessTransaction_Id] [int] NOT NULL,
 CONSTRAINT [PK_TransationTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BusinessTransactions] ON 
GO
INSERT [dbo].[BusinessTransactions] ([Id], [Date], [Amount], [Person_Id]) VALUES (1, CAST(N'2019-07-13T00:00:00' AS SmallDateTime), 832.8400, 7)
GO
INSERT [dbo].[BusinessTransactions] ([Id], [Date], [Amount], [Person_Id]) VALUES (2, CAST(N'2017-12-31T00:00:00' AS SmallDateTime), 10000.0000, 4)
GO
SET IDENTITY_INSERT [dbo].[BusinessTransactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Churches] ON 
GO
INSERT [dbo].[Churches] ([Id], [ChurchName]) VALUES (1, N'People Of God')
GO
INSERT [dbo].[Churches] ([Id], [ChurchName]) VALUES (2, N'Living Waters')
GO
INSERT [dbo].[Churches] ([Id], [ChurchName]) VALUES (3, N'Redeemer')
GO
SET IDENTITY_INSERT [dbo].[Churches] OFF
GO
SET IDENTITY_INSERT [dbo].[Doners] ON 
GO
INSERT [dbo].[Doners] ([Id], [DateOfDonation], [Person_Id], [Church_Id]) VALUES (1, CAST(N'2020-09-21T00:00:00' AS SmallDateTime), 7, 2)
GO
INSERT [dbo].[Doners] ([Id], [DateOfDonation], [Person_Id], [Church_Id]) VALUES (2, CAST(N'2020-09-08T00:00:00' AS SmallDateTime), 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Doners] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 
GO
INSERT [dbo].[Locations] ([Id], [Address], [City], [State], [Zip], [Church_Id]) VALUES (1, N'123 NW 1st St', N'New York', N'NY', N'10003', 1)
GO
INSERT [dbo].[Locations] ([Id], [Address], [City], [State], [Zip], [Church_Id]) VALUES (2, N'124 N 2nd St', N'New York', N'NY', N'10003', 1)
GO
INSERT [dbo].[Locations] ([Id], [Address], [City], [State], [Zip], [Church_Id]) VALUES (3, N'125 NE 3rd St', N'New York', N'NY', N'10003', 1)
GO
INSERT [dbo].[Locations] ([Id], [Address], [City], [State], [Zip], [Church_Id]) VALUES (4, N'126 N 4th St', N'New York', N'NY', N'10003', 1)
GO
INSERT [dbo].[Locations] ([Id], [Address], [City], [State], [Zip], [Church_Id]) VALUES (5, N'127 NW 5th St', N'New York', N'NY', N'10003', 1)
GO
INSERT [dbo].[Locations] ([Id], [Address], [City], [State], [Zip], [Church_Id]) VALUES (6, N'324 SW A Ave', N'Chicago', N'IL', N'60003', 2)
GO
INSERT [dbo].[Locations] ([Id], [Address], [City], [State], [Zip], [Church_Id]) VALUES (7, N'433 E B Ave', N'Chicago ', N'IL', N'60003', 2)
GO
INSERT [dbo].[Locations] ([Id], [Address], [City], [State], [Zip], [Church_Id]) VALUES (8, N'525 W C Ave', N'Des Moines', N'IA', N'50302', 3)
GO
INSERT [dbo].[Locations] ([Id], [Address], [City], [State], [Zip], [Church_Id]) VALUES (9, N'624 NE D Ave', N'Des Moines', N'IA', N'50302', 3)
GO
INSERT [dbo].[Locations] ([Id], [Address], [City], [State], [Zip], [Church_Id]) VALUES (10, N'721 SE E Ave', N'Chicago', N'IL', N'60003', 2)
GO
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 
GO
INSERT [dbo].[Members] ([Id], [DateJoined], [Person_Id], [Church_Id]) VALUES (1, N'1974-10-12', 1, 1)
GO
INSERT [dbo].[Members] ([Id], [DateJoined], [Person_Id], [Church_Id]) VALUES (2, N'1963-11-01', 2, 1)
GO
INSERT [dbo].[Members] ([Id], [DateJoined], [Person_Id], [Church_Id]) VALUES (3, N'1984-04-15', 3, 1)
GO
INSERT [dbo].[Members] ([Id], [DateJoined], [Person_Id], [Church_Id]) VALUES (4, N'1992-05-15', 4, 1)
GO
INSERT [dbo].[Members] ([Id], [DateJoined], [Person_Id], [Church_Id]) VALUES (5, N'2002-03-23', 7, 2)
GO
INSERT [dbo].[Members] ([Id], [DateJoined], [Person_Id], [Church_Id]) VALUES (6, N'2003-07-21', 8, 3)
GO
INSERT [dbo].[Members] ([Id], [DateJoined], [Person_Id], [Church_Id]) VALUES (7, N'2014-09-16', 10, 2)
GO
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[Pastors] ON 
GO
INSERT [dbo].[Pastors] ([Id], [DateOfOrdination], [Person_Id], [Church_Id]) VALUES (1, N'1999-06-10', 5, 1)
GO
INSERT [dbo].[Pastors] ([Id], [DateOfOrdination], [Person_Id], [Church_Id]) VALUES (2, N'2003-07-08', 6, 2)
GO
INSERT [dbo].[Pastors] ([Id], [DateOfOrdination], [Person_Id], [Church_Id]) VALUES (3, N'2001-06-28', 9, 3)
GO
SET IDENTITY_INSERT [dbo].[Pastors] OFF
GO
SET IDENTITY_INSERT [dbo].[People] ON 
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [Location_Id], [Church_Id]) VALUES (1, N'George ', N'Cruz', N'518-555-1111', N'Member', N'1961-12-01', 1, 1)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [Location_Id], [Church_Id]) VALUES (2, N'Nancy', N'Stapleton', N'518-555-1112', N'Member', N'1950-08-20', 1, 1)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [Location_Id], [Church_Id]) VALUES (3, N'Helen', N'Lindblum', N'518-555-1113', N'Member', N'1972-03-03', 1, 1)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [Location_Id], [Church_Id]) VALUES (4, N'Rick', N'Spensor', N'518-555-1114', N'Member', N'1988-05-21', 1, 1)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [Location_Id], [Church_Id]) VALUES (5, N'Steve ', N'Savaske', N'518-555-1115', N'Pastor', N'1985-07-29', 1, 1)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [Location_Id], [Church_Id]) VALUES (6, N'Timothy', N'Halvorsen', N'312-555-1116', N'Pastor', N'1975-04-19', 2, 2)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [Location_Id], [Church_Id]) VALUES (7, N'Sheela', N'Timpleton', N'312-555-1117', N'Member', N'1962-06-23', 2, 2)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [Location_Id], [Church_Id]) VALUES (8, N'Esther', N'Kiepke', N'515-555-1118', N'Member', N'1958-11-23', 3, 3)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [Location_Id], [Church_Id]) VALUES (9, N'Mark', N'Kotch', N'515-555-1119', N'Pastor', N'1962-10-18', 3, 3)
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [DescriptionOfRole], [DateOfBirth], [Location_Id], [Church_Id]) VALUES (10, N'Cassandra', N'Hersch', N'312-555-1110', N'PotentialMember', N'1982-01-08', 2, 2)
GO
SET IDENTITY_INSERT [dbo].[People] OFF
GO
SET IDENTITY_INSERT [dbo].[PotentialMembers] ON 
GO
INSERT [dbo].[PotentialMembers] ([Id], [DateOfContact], [Person_Id]) VALUES (1, N'2020-10-25', 10)
GO
SET IDENTITY_INSERT [dbo].[PotentialMembers] OFF
GO
SET IDENTITY_INSERT [dbo].[TransationTypes] ON 
GO
INSERT [dbo].[TransationTypes] ([Id], [Description], [TransactionCategory], [BusinessTransaction_Id]) VALUES (1, N'Flat Screen TV', N'In-kind', 1)
GO
INSERT [dbo].[TransationTypes] ([Id], [Description], [TransactionCategory], [BusinessTransaction_Id]) VALUES (2, N'Cash', N'Monetary', 2)
GO
SET IDENTITY_INSERT [dbo].[TransationTypes] OFF
GO
/****** Object:  Index [IX_FK_PersonBusinessTransaction]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonBusinessTransaction] ON [dbo].[BusinessTransactions]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ChurchDoner]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ChurchDoner] ON [dbo].[Doners]
(
	[Church_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonDoner]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonDoner] ON [dbo].[Doners]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ChurchLocation]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ChurchLocation] ON [dbo].[Locations]
(
	[Church_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ChurchMember]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ChurchMember] ON [dbo].[Members]
(
	[Church_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonMember]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonMember] ON [dbo].[Members]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ChurchPastor]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ChurchPastor] ON [dbo].[Pastors]
(
	[Church_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonPastor]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonPastor] ON [dbo].[Pastors]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ChurchPerson]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ChurchPerson] ON [dbo].[People]
(
	[Church_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_LocationPerson]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_LocationPerson] ON [dbo].[People]
(
	[Location_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonPotentialMember]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonPotentialMember] ON [dbo].[PotentialMembers]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_BusinessTransactionTransationType]    Script Date: 11/7/2020 6:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_BusinessTransactionTransationType] ON [dbo].[TransationTypes]
(
	[BusinessTransaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BusinessTransactions]  WITH CHECK ADD  CONSTRAINT [FK_PersonBusinessTransaction] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[BusinessTransactions] CHECK CONSTRAINT [FK_PersonBusinessTransaction]
GO
ALTER TABLE [dbo].[Doners]  WITH CHECK ADD  CONSTRAINT [FK_ChurchDoner] FOREIGN KEY([Church_Id])
REFERENCES [dbo].[Churches] ([Id])
GO
ALTER TABLE [dbo].[Doners] CHECK CONSTRAINT [FK_ChurchDoner]
GO
ALTER TABLE [dbo].[Doners]  WITH CHECK ADD  CONSTRAINT [FK_PersonDoner] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Doners] CHECK CONSTRAINT [FK_PersonDoner]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_ChurchLocation] FOREIGN KEY([Church_Id])
REFERENCES [dbo].[Churches] ([Id])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_ChurchLocation]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_ChurchMember] FOREIGN KEY([Church_Id])
REFERENCES [dbo].[Churches] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_ChurchMember]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_PersonMember] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_PersonMember]
GO
ALTER TABLE [dbo].[Pastors]  WITH CHECK ADD  CONSTRAINT [FK_ChurchPastor] FOREIGN KEY([Church_Id])
REFERENCES [dbo].[Churches] ([Id])
GO
ALTER TABLE [dbo].[Pastors] CHECK CONSTRAINT [FK_ChurchPastor]
GO
ALTER TABLE [dbo].[Pastors]  WITH CHECK ADD  CONSTRAINT [FK_PersonPastor] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Pastors] CHECK CONSTRAINT [FK_PersonPastor]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_ChurchPerson] FOREIGN KEY([Church_Id])
REFERENCES [dbo].[Churches] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_ChurchPerson]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_LocationPerson] FOREIGN KEY([Location_Id])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_LocationPerson]
GO
ALTER TABLE [dbo].[PotentialMembers]  WITH CHECK ADD  CONSTRAINT [FK_PersonPotentialMember] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[PotentialMembers] CHECK CONSTRAINT [FK_PersonPotentialMember]
GO
ALTER TABLE [dbo].[TransationTypes]  WITH CHECK ADD  CONSTRAINT [FK_BusinessTransactionTransationType] FOREIGN KEY([BusinessTransaction_Id])
REFERENCES [dbo].[BusinessTransactions] ([Id])
GO
ALTER TABLE [dbo].[TransationTypes] CHECK CONSTRAINT [FK_BusinessTransactionTransationType]
GO
USE [master]
GO
ALTER DATABASE [Church_App1714v2] SET  READ_WRITE 
GO
