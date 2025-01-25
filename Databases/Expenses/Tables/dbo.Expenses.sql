CREATE TABLE [dbo].[Expenses]
(
[ExpenseDate] [datetime] NULL,
[ValueDate] [datetime] NULL,
[IncomeAmount] [money] NULL,
[ExpenseAmount] [money] NULL,
[ExpenseDescription] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExpenseSubdescription] [datetime] NULL,
[PaymentType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CategoryName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubCategoryName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SwitchAmount] [money] NULL
) ON [PRIMARY]
GO
