CREATE TABLE [setup].[all_columns_MetraSegnalazioniEdilizia] (
    [schema_name]      NVARCHAR (128) NOT NULL,
    [table_name]       NVARCHAR (128) NOT NULL,
    [column_name]      NVARCHAR (128) NULL,
    [column_id]        INT            NOT NULL,
    [column_type]      NVARCHAR (128) NULL,
    [column_length]    INT            NULL,
    [column_precision] VARCHAR (5)    NULL,
    [column_scale]     VARCHAR (5)    NULL,
    [is_nullable]      BIT            NULL
);
GO

