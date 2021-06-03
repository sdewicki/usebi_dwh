

CREATE    PROCEDURE [dwh].[LoadProductModel_SCD2] AS

DECLARE @Today [Datetime]=getdate()

--ADD RECORDS FROM SOURCE WHEN MATCHED - OUTPUT='UPDATE'
INSERT INTO [dwh].[ProductModel_SCD2] ([Name],[CatalogDescription],[rowguid],[ModifiedDate],start_date)
SELECT [Name],[CatalogDescription],[rowguid],[ModifiedDate], @Today
FROM
(
MERGE INTO [dwh].[ProductModel_SCD2] AS target
USING [SalesLT].[ProductModel_new_records] as source
ON (target.Name=source.Name)
-- NEW RECORDS
WHEN NOT MATCHED THEN
INSERT 
(	  [Name]
      ,[CatalogDescription]
      ,[rowguid]
      ,[ModifiedDate]
	  ,start_date
)
VALUES
(	  source.[Name]
      ,source.[CatalogDescription]
      ,source.[rowguid]
      ,source.[ModifiedDate]
	  ,@Today
)
--UPDATE END_DATE FOR OLD RECORDS
WHEN MATCHED 
and end_date is null
and (
isnull(target.[CatalogDescription],'')<>isnull(source.[CatalogDescription],'')
OR isnull(target.[rowguid],'')<>isnull(source.[rowguid],'')
) 
THEN UPDATE SET
end_date=@Today
--DEFINE OUTPUT TO INSERT MATCHED NEW RECORDS AT THE BEGINNING
OUTPUT source.[Name]
      ,source.[CatalogDescription]
      ,source.[rowguid]
      ,source.[ModifiedDate]
	  , $Action as MergeAction
) AS MRG
WHERE MRG.MergeAction='UPDATE'
;