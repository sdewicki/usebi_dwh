CREATE TABLE [audit].[etl_config] (
    [id]                 SMALLINT       IDENTITY (1, 1) NOT NULL,
    [source_schema_name] NVARCHAR (255) NOT NULL,
    [source_table_name]  NVARCHAR (255) NOT NULL,
    [target_schema_name] NVARCHAR (255) NOT NULL,
    [target_table_name]  NVARCHAR (255) NOT NULL,
    [watermak_column]    NVARCHAR (255) NOT NULL,
    [watermark_value]    DATETIME       NOT NULL,
    [active]             BIT            NOT NULL,
    [column_list]        NVARCHAR (255) NULL
);

