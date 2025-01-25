CREATE TABLE [Audit].[Package_Control]
(
[Package_NM] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Package_ID] [uniqueidentifier] NOT NULL,
[Parent_Package_ID] [uniqueidentifier] NULL,
[Execution_ID] [bigint] NULL,
[Start_TS] [datetime] NOT NULL,
[Stop_TS] [datetime] NULL,
[Insert_Row_QT] [int] NULL,
[Update_Row_QT] [int] NULL,
[Unchanged_Row_QT] [int] NULL,
[Deleted_Row_QT] [int] NULL,
[Duration_s] AS (datediff(second,[Start_TS],[Stop_TS])),
[PackageLogID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
