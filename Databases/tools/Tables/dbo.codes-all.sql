CREATE TABLE [dbo].[codes-all]
(
[Entity] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Currency] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AlphabeticCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumericCode] [int] NULL,
[MinorUnit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WithdrawalDate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
