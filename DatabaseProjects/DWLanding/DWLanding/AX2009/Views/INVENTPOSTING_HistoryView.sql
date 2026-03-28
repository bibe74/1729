/**
 * @table AX2009.INVENTPOSTING_History
 * @description 

 * @depends AX2009.INVENTPOSTING_RegistrazioneMagazzino

SELECT TOP 1 * FROM AX2009.INVENTPOSTING_RegistrazioneMagazzino
*/

CREATE   VIEW AX2009.INVENTPOSTING_HistoryView
AS
SELECT
    -- Chiavi
    RM.DATAAREAID,
    RM.INVENTACCOUNTTYPE,
    RM.ITEMCODE,
    RM.ITEMRELATION,
    RM.CUSTVENDCODE,
    RM.CUSTVENDRELATION,
    RM.TAXGROUPID,
    RM.COSTCODE,
    RM.COSTRELATION,
    DATEADD(DAY, -1, CAST(CURRENT_TIMESTAMP AS DATE)) AS FROMDATE,
    DATEADD(DAY, -1, CAST(CURRENT_TIMESTAMP AS DATE)) AS TODATE,

    CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        RM.DATAAREAID,
        RM.INVENTACCOUNTTYPE,
        RM.ITEMCODE,
        RM.ITEMRELATION,
        RM.CUSTVENDCODE,
        RM.CUSTVENDRELATION,
        RM.TAXGROUPID,
        RM.COSTCODE,
        RM.COSTRELATION,
        ' '
    ))) AS HistoricalHashKey,
    CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        RM.LEDGERACCOUNTID,
        ' '
    ))) AS ChangeHashKey,

    -- Dimensioni
    RM.LEDGERACCOUNTID,
    CAST(1 AS BIT) AS IsActive

FROM (
    SELECT
        RM.DATAAREAID,
        RM.INVENTACCOUNTTYPE,
        RM.ITEMCODE,
        RM.ITEMRELATION,
        RM.CUSTVENDCODE,
        RM.CUSTVENDRELATION,
        RM.TAXGROUPID,
        RM.COSTCODE,
        RM.COSTRELATION,
        RM.LEDGERACCOUNTID

    FROM DWLanding.AX2009.INVENTPOSTING_RegistrazioneMagazzino RM
    WHERE RM.DATAAREAID IN (
        'mspa',
        'mfoa',
        'imet',
        'mser',
        'mrag',
        'malu',
        'mpct'
    )
) RM;
GO

