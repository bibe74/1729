CREATE TABLE [setup].[providers] (
    [schema_name]             NVARCHAR (128) NOT NULL,
    [provider_name]           NVARCHAR (60)  NOT NULL,
    [database_server]         NVARCHAR (128) NOT NULL,
    [database_name]           NVARCHAR (128) NOT NULL,
    [tables_full_table_name]  NVARCHAR (261) NOT NULL,
    [columns_full_table_name] NVARCHAR (261) NOT NULL
);
GO

ALTER TABLE [setup].[providers]
    ADD CONSTRAINT [PK_setup_providers] PRIMARY KEY CLUSTERED ([schema_name] ASC);
GO

