SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Dim].[DateView]
AS
WITH TimeSpan
AS (
    SELECT
        MIN(Anno) AS Year_MIN,
        MAX(Anno) AS Year_MAX

    FROM dbo.[Fatture$]
)
SELECT
    DateKey,
    Date,
    FullDateUK,
    FullDateUSA,
    DayOfMonth,
    DaySuffix,
    DayName,
    DayOfWeekUSA,
    DayOfWeekUK,
    DayOfWeekInMonth,
    DayOfWeekInYear,
    DayOfQuarter,
    DayOfYear,
    WeekOfMonth,
    WeekOfQuarter,
    WeekOfYear,
    Month,
    MonthName,
    MonthOfQuarter,
    Quarter,
    QuarterName,
    Year,
    YearName,
    MonthYear,
    MMYYYY,
    FirstDayOfMonth,
    LastDayOfMonth,
    FirstDayOfQuarter,
    LastDayOfQuarter,
    FirstDayOfYear,
    LastDayOfYear,
    IsHolidayUSA,
    IsWeekday,
    HolidayUSA,
    IsHolidayUK,
    HolidayUK,
    DayNameIT,
    MonthNameIT,
    IsHolidayIT,
    HolidayIT,
    FullDateIT

FROM tools.dbo.DimDate D
INNER JOIN TimeSpan TS ON D.Year BETWEEN TS.Year_MIN AND TS.Year_MAX;
GO
