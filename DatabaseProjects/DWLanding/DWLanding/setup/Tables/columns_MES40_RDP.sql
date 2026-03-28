CREATE TABLE [setup].[columns_MES40_RDP] (
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
    [is_nullable]          BIT            NOT NULL,
    FOREIGN KEY ([full_table_name]) REFERENCES [setup].[tables_MES40_RDP] ([full_table_name])
);
GO

ALTER TABLE [setup].[columns_MES40_RDP]
    ADD CONSTRAINT [FK_setup_columns_MES40_RDP_full_table_name] FOREIGN KEY ([full_table_name]) REFERENCES [setup].[tables_MES40_RDP] ([full_table_name]);
GO

ALTER TABLE [setup].[columns_MES40_RDP]
    ADD CONSTRAINT [PK_setup_columns_MES40_RDP] PRIMARY KEY CLUSTERED ([full_table_name] ASC, [column_id] ASC);
GO

ALTER TABLE [setup].[columns_MES40_RDP]
    ADD CONSTRAINT [DFT_setup_columns_MES40_RDP_column_olap_enumname] DEFAULT (N'') FOR [column_olap_enumname];
GO

ALTER TABLE [setup].[columns_MES40_RDP]
    ADD CONSTRAINT [DFT_setup_columns_MES40_RDP_is_olap_column] DEFAULT ((0)) FOR [is_olap_column];
GO

ALTER TABLE [setup].[columns_MES40_RDP]
    ADD CONSTRAINT [DFT_setup_columns_MES40_RDP_is_nullable] DEFAULT ((0)) FOR [is_nullable];
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_setup_columns_MES40_RDP_column_name]
    ON [setup].[columns_MES40_RDP]([full_table_name] ASC, [column_name] ASC);
GO

