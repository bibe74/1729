CREATE TABLE [setup].[columns_MRDA] (
    [full_table_name]      NVARCHAR (257) NOT NULL,
    [column_id]            INT            NOT NULL,
    [column_real_id]       INT            NOT NULL,
    [column_name]          NVARCHAR (128) NULL,
    [column_full_type]     NVARCHAR (160) NULL,
    [is_olap_column]       INT            NOT NULL,
    [column_olap_name]     NVARCHAR (128) NULL,
    [column_olap_enumname] NVARCHAR (1)   NOT NULL,
    [column_type]          NVARCHAR (128) NULL,
    [column_length]        INT            NULL,
    [column_precision]     VARCHAR (5)    NULL,
    [column_scale]         VARCHAR (5)    NULL,
    [is_nullable]          BIT            NULL
);
GO

ALTER TABLE [setup].[columns_MRDA]
    ADD CONSTRAINT [PK_setup_columns_MRDA] PRIMARY KEY CLUSTERED ([full_table_name] ASC, [column_real_id] ASC) WITH (FILLFACTOR = 100);
GO

CREATE STATISTICS [column_real_id]
    ON [setup].[columns_MRDA]([column_real_id]);
GO

