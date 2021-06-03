CREATE TABLE [dwh].[ProductModel_SCD2] (
    [ProductModelID]     INT           IDENTITY (1, 1) NOT NULL,
    [Name]               [dbo].[Name]  NOT NULL,
    [CatalogDescription] VARCHAR (255) NULL,
    [rowguid]            VARCHAR (255) NULL,
    [ModifiedDate]       DATETIME      NOT NULL,
    [start_date]         DATETIME      NULL,
    [end_date]           DATETIME      NULL
);

