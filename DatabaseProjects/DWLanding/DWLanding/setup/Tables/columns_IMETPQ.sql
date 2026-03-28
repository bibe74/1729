CREATE TABLE [setup].[columns_IMETPQ] (
    [full_table_name]      NVARCHAR (261) NOT NULL,
    [column_id]            INT            NOT NULL,
    [column_real_id]       INT            NOT NULL,
    [column_name]          NVARCHAR (128) NOT NULL,
    [column_full_type]     NVARCHAR (128) NOT NULL,
    [is_olap_column]       BIT            NOT NULL,
    [column_olap_name]     NVARCHAR (128) NOT NULL,
    [column_olap_enumname] NVARCHAR (128) NOT NULL,
    [column_type]          NVARCHAR (128) NULL,
    [column_length]        INT            NULL,
    [column_precision]     VARCHAR (5)    NULL,
    [column_scale]         VARCHAR (5)    NULL,
    [is_nullable]          BIT            NOT NULL
);
GO

ALTER TABLE [setup].[columns_IMETPQ]
    ADD CONSTRAINT [FK_setup_columns_IMETPQ_full_table_name] FOREIGN KEY ([full_table_name]) REFERENCES [setup].[tables_IMETPQ] ([full_table_name]);
GO

ALTER TABLE [setup].[columns_IMETPQ]
    ADD CONSTRAINT [PK_setup_columns_IMETPQ] PRIMARY KEY CLUSTERED ([full_table_name] ASC, [column_id] ASC) WITH (FILLFACTOR = 100);
GO

