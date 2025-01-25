CREATE TABLE [Updt].[UpdtCustomer]
(
[CustomerID] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NOT NULL,
[ChangeHashKey] [varbinary] (20) NOT NULL,
[CustomerName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DeliveryCityKey] [int] NOT NULL,
[InsertDttm] [datetime] NOT NULL
) ON [PRIMARY]
GO
