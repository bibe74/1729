CREATE TABLE [setup].[olap_script] (
    [schema_name]          NVARCHAR (128)  NOT NULL,
    [full_olap_table_name] NVARCHAR (261)  NOT NULL,
    [line_id]              INT             NOT NULL,
    [statement_group]      NVARCHAR (20)   NOT NULL,
    [statement_line]       NVARCHAR (4000) NOT NULL
);
GO

CREATE STATISTICS [line_id]
    ON [setup].[olap_script]([line_id]);
GO

ALTER TABLE [setup].[olap_script]
    ADD CONSTRAINT [PK_setup_olap_script] PRIMARY KEY CLUSTERED ([schema_name] ASC, [full_olap_table_name] ASC, [line_id] ASC);
GO

