CREATE TABLE [setup].[all_columns_BCDL_EDMSRV64_MetraProgettazione2017] (
    [schema_name]      NVARCHAR (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [table_name]       NVARCHAR (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [column_name]      NVARCHAR (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [column_id]        INT            NOT NULL,
    [column_type]      NVARCHAR (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [column_length]    INT            NULL,
    [column_precision] VARCHAR (5)    COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [column_scale]     VARCHAR (5)    COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [is_nullable]      BIT            NULL
);
GO

CREATE STATISTICS [table_name]
    ON [setup].[all_columns_BCDL_EDMSRV64_MetraProgettazione2017]([table_name]);
GO

CREATE STATISTICS [column_id]
    ON [setup].[all_columns_BCDL_EDMSRV64_MetraProgettazione2017]([column_id]);
GO

ALTER TABLE [setup].[all_columns_BCDL_EDMSRV64_MetraProgettazione2017]
    ADD CONSTRAINT [PK_setup_all_columns_BCDL_EDMSRV64_MetraProgettazione2017] PRIMARY KEY CLUSTERED ([schema_name] ASC, [table_name] ASC, [column_id] ASC);
GO

