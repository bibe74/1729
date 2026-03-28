CREATE TABLE [audit].[merge_log] (
    [merge_datetime]       DATETIME       NOT NULL,
    [full_olap_table_name] NVARCHAR (261) NOT NULL,
    [inserted_rows]        INT            NOT NULL,
    [updated_rows]         INT            NOT NULL,
    [deleted_rows]         INT            NOT NULL
);
GO

ALTER TABLE [audit].[merge_log]
    ADD CONSTRAINT [DFT_audit_merge_log_deleted_rows] DEFAULT ((0)) FOR [deleted_rows];
GO

ALTER TABLE [audit].[merge_log]
    ADD CONSTRAINT [DFT_audit_merge_log_inserted_rows] DEFAULT ((0)) FOR [inserted_rows];
GO

ALTER TABLE [audit].[merge_log]
    ADD CONSTRAINT [DFT_audit_merge_log_updated_rows] DEFAULT ((0)) FOR [updated_rows];
GO

ALTER TABLE [audit].[merge_log]
    ADD CONSTRAINT [DFT_audit_merge_log_merge_datetime] DEFAULT (getdate()) FOR [merge_datetime];
GO

ALTER TABLE [audit].[merge_log]
    ADD CONSTRAINT [PK_audit_merge_log] PRIMARY KEY CLUSTERED ([merge_datetime] ASC, [full_olap_table_name] ASC);
GO

