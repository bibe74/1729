CREATE TABLE [audit].[merge_log_details] (
    [merge_datetime]          DATETIME        NOT NULL,
    [merge_action]            NVARCHAR (10)   NOT NULL,
    [full_olap_table_name]    NVARCHAR (261)  NOT NULL,
    [primary_key_description] NVARCHAR (1000) NOT NULL
);
GO

ALTER TABLE [audit].[merge_log_details]
    ADD CONSTRAINT [DFT_audit_merge_log_details_merge_datetime] DEFAULT (getdate()) FOR [merge_datetime];
GO

CREATE NONCLUSTERED INDEX [IX_audit_merge_log_details]
    ON [audit].[merge_log_details]([merge_datetime] ASC, [merge_action] ASC, [full_olap_table_name] ASC) WITH (FILLFACTOR = 100);
GO

