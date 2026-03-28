CREATE TABLE [setup].[tables_EDMSRV64] (
    [full_table_name]          NVARCHAR (261) NOT NULL,
    [is_olap_table]            BIT            NOT NULL,
    [olap_schema_name]         NVARCHAR (128) NOT NULL,
    [olap_table_name]          NVARCHAR (128) NOT NULL,
    [use_recid_in_primary_key] BIT            NOT NULL,
    [olap_table_alias]         NVARCHAR (10)  NOT NULL
);
GO

ALTER TABLE [setup].[tables_EDMSRV64]
    ADD CONSTRAINT [PK_setup_tables_EDMSRV64] PRIMARY KEY CLUSTERED ([full_table_name] ASC);
GO

