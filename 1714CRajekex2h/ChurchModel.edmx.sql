
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/03/2020 14:40:49
-- Generated from EDMX file: C:\Users\senio\OneDrive\Desktop\COMC1714\1714-Assignments\Projects\1714CRajek\1714CRajekex2h\ChurchModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ChurchApp];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[Locations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Locations];
GO
IF OBJECT_ID(N'[dbo].[TransactionTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TransactionTypes];
GO
IF OBJECT_ID(N'[dbo].[Churches]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Churches];
GO
IF OBJECT_ID(N'[dbo].[PotentialMembers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PotentialMembers];
GO
IF OBJECT_ID(N'[dbo].[Doners]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Doners];
GO
IF OBJECT_ID(N'[dbo].[Pastors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pastors];
GO
IF OBJECT_ID(N'[dbo].[Members]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Members];
GO
IF OBJECT_ID(N'[dbo].[BusinessTransactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BusinessTransactions];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [DescriptionOfRole] nvarchar(max)  NOT NULL,
    [DateOfBirth] nvarchar(max)  NOT NULL,
    [Location_Id] int  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [Zip] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Church_Id] int  NOT NULL
);
GO

-- Creating table 'TransactionTypes'
CREATE TABLE [dbo].[TransactionTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [TransactionCategory] nvarchar(max)  NOT NULL,
    [BusinessTransaction_Id] int  NOT NULL
);
GO

-- Creating table 'Churches'
CREATE TABLE [dbo].[Churches] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ChurchName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PotentialMembers'
CREATE TABLE [dbo].[PotentialMembers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DateOfContact] nvarchar(max)  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- Creating table 'Doners'
CREATE TABLE [dbo].[Doners] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DateOfDonation] nvarchar(max)  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- Creating table 'Pastors'
CREATE TABLE [dbo].[Pastors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DateOfOrdination] nvarchar(max)  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- Creating table 'Members'
CREATE TABLE [dbo].[Members] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DateJoined] nvarchar(max)  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- Creating table 'BusinessTransactions'
CREATE TABLE [dbo].[BusinessTransactions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [Amount] nvarchar(max)  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TransactionTypes'
ALTER TABLE [dbo].[TransactionTypes]
ADD CONSTRAINT [PK_TransactionTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Churches'
ALTER TABLE [dbo].[Churches]
ADD CONSTRAINT [PK_Churches]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PotentialMembers'
ALTER TABLE [dbo].[PotentialMembers]
ADD CONSTRAINT [PK_PotentialMembers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Doners'
ALTER TABLE [dbo].[Doners]
ADD CONSTRAINT [PK_Doners]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pastors'
ALTER TABLE [dbo].[Pastors]
ADD CONSTRAINT [PK_Pastors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [PK_Members]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BusinessTransactions'
ALTER TABLE [dbo].[BusinessTransactions]
ADD CONSTRAINT [PK_BusinessTransactions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Church_Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [FK_ChurchLocation]
    FOREIGN KEY ([Church_Id])
    REFERENCES [dbo].[Churches]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ChurchLocation'
CREATE INDEX [IX_FK_ChurchLocation]
ON [dbo].[Locations]
    ([Church_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'BusinessTransactions'
ALTER TABLE [dbo].[BusinessTransactions]
ADD CONSTRAINT [FK_PersonBusinessTransaction]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonBusinessTransaction'
CREATE INDEX [IX_FK_PersonBusinessTransaction]
ON [dbo].[BusinessTransactions]
    ([Person_Id]);
GO

-- Creating foreign key on [BusinessTransaction_Id] in table 'TransactionTypes'
ALTER TABLE [dbo].[TransactionTypes]
ADD CONSTRAINT [FK_BusinessTransactionTransactionType]
    FOREIGN KEY ([BusinessTransaction_Id])
    REFERENCES [dbo].[BusinessTransactions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BusinessTransactionTransactionType'
CREATE INDEX [IX_FK_BusinessTransactionTransactionType]
ON [dbo].[TransactionTypes]
    ([BusinessTransaction_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'Doners'
ALTER TABLE [dbo].[Doners]
ADD CONSTRAINT [FK_PersonDoner]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonDoner'
CREATE INDEX [IX_FK_PersonDoner]
ON [dbo].[Doners]
    ([Person_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [FK_PersonMember]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonMember'
CREATE INDEX [IX_FK_PersonMember]
ON [dbo].[Members]
    ([Person_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'PotentialMembers'
ALTER TABLE [dbo].[PotentialMembers]
ADD CONSTRAINT [FK_PersonPotentialMember]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonPotentialMember'
CREATE INDEX [IX_FK_PersonPotentialMember]
ON [dbo].[PotentialMembers]
    ([Person_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'Pastors'
ALTER TABLE [dbo].[Pastors]
ADD CONSTRAINT [FK_PersonPastor]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonPastor'
CREATE INDEX [IX_FK_PersonPastor]
ON [dbo].[Pastors]
    ([Person_Id]);
GO

-- Creating foreign key on [Location_Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_LocationPerson]
    FOREIGN KEY ([Location_Id])
    REFERENCES [dbo].[Locations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationPerson'
CREATE INDEX [IX_FK_LocationPerson]
ON [dbo].[People]
    ([Location_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------