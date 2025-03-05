SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/**
 * @table Dim.Date
 * @description Date dimension

 * @depends Import.Date

SELECT TOP (100) * FROM Import.Date;
*/

CREATE   VIEW [Dim].[DateView]
AS
WITH TableData
AS (
    SELECT
        D.DateKey,
        D.Date,
        D.FullDateIT AS DateName,
        D.Year,
        D.Quarter,
        'Q' + D.Quarter AS QuarterName,
        CONVERT(TINYINT, D.Month) AS Month,
        D.MonthName,
        CONVERT(TINYINT, D.DayOfMonth) AS DayOfMonth,
        CONVERT(TINYINT, D.WeekOfYear) AS WeekOfYear,
        CONVERT(SMALLINT, D.Year) * 100 + CONVERT(SMALLINT, D.Month) AS YearMonth,
        D.MonthName + ' ' + D.Year AS YearMonthName,
        CONVERT(SMALLINT, D.Year) * 100 + CONVERT(SMALLINT, D.Quarter) AS YearQuarter,
        'Q' + D.Quarter + ' ' + D.Year AS YearQuarterName,
        CONVERT(SMALLINT, D.Year) * 100 + CONVERT(SMALLINT, D.WeekOfYear) AS YearWeek,
        D.WeekOfYear + '/' + D.Year AS YearWeekName

    FROM Import.Date D

    UNION ALL

    SELECT
        -1,
        '1900-01-01',
        '',
        '',
        '',
        '',
        0,
        '',
        0,
        0,
        0,
        '',
        0,
        '',
        0,
        ''
)
SELECT
    -- Chiavi
    TD.DateKey,
    TD.Date,

    -- Campi per sincronizzazione
    CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        TD.DateKey,
        ' '
    ))) AS HistoricalHashKey,
    CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        TD.DateName,
        TD.Year,
        TD.Quarter,
        TD.QuarterName,
        TD.Month,
        TD.MonthName,
        TD.DayOfMonth,
        TD.WeekOfYear,
        TD.YearQuarter,
        TD.YearQuarterName,
        TD.YearMonth,
        TD.YearMonthName,
        TD.YearWeek,
        TD.YearWeekName,
        ' '
    ))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Altri campi
    TD.DateName,
    TD.Year,
    TD.Quarter,
    TD.QuarterName,
    TD.Month,
    TD.MonthName,
    TD.DayOfMonth,
    TD.WeekOfYear,
    TD.YearQuarter,
    TD.YearQuarterName,
    TD.YearMonth,
    TD.YearMonthName,
    TD.YearWeek,
    TD.YearWeekName

FROM TableData TD;
GO
