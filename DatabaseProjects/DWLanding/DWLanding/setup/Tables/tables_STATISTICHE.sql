CREATE TABLE [setup].[tables_STATISTICHE] (
    [full_table_name]          NVARCHAR (261) NOT NULL,
    [is_olap_table]            BIT            NOT NULL,
    [olap_schema_name]         NVARCHAR (128) NOT NULL,
    [olap_table_name]          NVARCHAR (128) NOT NULL,
    [use_recid_in_primary_key] BIT            NOT NULL,
    [olap_table_alias]         NVARCHAR (10)  NOT NULL
);
GO

ALTER TABLE [setup].[tables_STATISTICHE]
    ADD CONSTRAINT [DFT_setup_tables_STATISTICHE_olap_table_alias] DEFAULT (N'T') FOR [olap_table_alias];
GO

ALTER TABLE [setup].[tables_STATISTICHE]
    ADD CONSTRAINT [DFT_setup_tables_STATISTICHE_use_RECID_in_primary_key] DEFAULT ((0)) FOR [use_recid_in_primary_key];
GO

ALTER TABLE [setup].[tables_STATISTICHE]
    ADD CONSTRAINT [DFT_setup_tables_STATISTICHE_is_olap_table] DEFAULT ((0)) FOR [is_olap_table];
GO

ALTER TABLE [setup].[tables_STATISTICHE]
    ADD CONSTRAINT [PK_setup_tables_STATISTICHE] PRIMARY KEY CLUSTERED ([full_table_name] ASC) WITH (FILLFACTOR = 100);
GO

