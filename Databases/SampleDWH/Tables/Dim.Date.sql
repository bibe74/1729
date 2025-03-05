CREATE TABLE [Dim].[Date]
(
[DateKey] [int] NOT NULL,
[Date] [date] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[DateName] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Year] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Quarter] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[QuarterName] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Month] [tinyint] NOT NULL,
[MonthName] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DayOfMonth] [tinyint] NOT NULL,
[WeekOfYear] [tinyint] NOT NULL,
[YearQuarter] [int] NOT NULL,
[YearQuarterName] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[YearMonth] [int] NOT NULL,
[YearMonthName] [varchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[YearWeek] [int] NULL,
[YearWeekName] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Date] ADD CONSTRAINT [PK_Dim_Date] PRIMARY KEY CLUSTERED ([DateKey]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dim_Date_BusinessKey] ON [Dim].[Date] ([Date]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dim_Date_AlternateKey] ON [Dim].[Date] ([Year], [Month], [DayOfMonth]) ON [PRIMARY]
GO
