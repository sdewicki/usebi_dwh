CREATE TABLE [SalesLT].[ProductModel_new_records] (
    [ProductModelID]     INT           IDENTITY (1, 1) NOT NULL,
    [Name]               [dbo].[Name]  NOT NULL,
    [CatalogDescription] VARCHAR (255) NULL,
    [rowguid]            VARCHAR (255) NULL,
    [ModifiedDate]       DATETIME      NOT NULL
);

