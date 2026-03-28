
CREATE   PROCEDURE AX2009.usp_Refresh_INVENTPOSTING_History
AS
BEGIN

    SET NOCOUNT ON;

    WITH ActiveRecords
    AS (
        SELECT
            IPH.DATAAREAID,
            IPH.INVENTACCOUNTTYPE,
            IPH.ITEMCODE,
            IPH.ITEMRELATION,
            IPH.CUSTVENDCODE,
            IPH.CUSTVENDRELATION,
            IPH.TAXGROUPID,
            IPH.COSTCODE,
            IPH.COSTRELATION,
            IPH.FROMDATE,
            IPH.TODATE,
            IPH.HistoricalHashKey,
            IPH.ChangeHashKey,
            IPH.LEDGERACCOUNTID,
            IPH.IsActive

        FROM AX2009.INVENTPOSTING_History IPH
        WHERE IPH.IsActive = CAST(1 AS BIT)
    )
    MERGE INTO ActiveRecords AS TGT
    USING AX2009.INVENTPOSTING_HistoryView AS SRC
    ON SRC.DATAAREAID = TGT.DATAAREAID
       AND SRC.INVENTACCOUNTTYPE = TGT.INVENTACCOUNTTYPE
       AND SRC.ITEMCODE = TGT.ITEMCODE
       AND SRC.ITEMRELATION = TGT.ITEMRELATION
       AND SRC.CUSTVENDCODE = TGT.CUSTVENDCODE
       AND SRC.CUSTVENDRELATION = TGT.CUSTVENDRELATION
       AND SRC.TAXGROUPID = TGT.TAXGROUPID
       AND SRC.COSTCODE = TGT.COSTCODE
       AND SRC.COSTRELATION = TGT.COSTRELATION

    WHEN NOT MATCHED THEN INSERT VALUES (
        SRC.DATAAREAID,
        SRC.INVENTACCOUNTTYPE,
        SRC.ITEMCODE,
        SRC.ITEMRELATION,
        SRC.CUSTVENDCODE,
        SRC.CUSTVENDRELATION,
        SRC.TAXGROUPID,
        SRC.COSTCODE,
        SRC.COSTRELATION,
        SRC.FROMDATE,
        SRC.TODATE,
        SRC.HistoricalHashKey,
        SRC.ChangeHashKey,
        SRC.LEDGERACCOUNTID,
        SRC.IsActive
    )
    
    WHEN MATCHED AND SRC.ChangeHashKey <> TGT.ChangeHashKey THEN UPDATE SET TGT.IsActive = CAST(0 AS BIT)

    WHEN NOT MATCHED BY SOURCE THEN UPDATE SET TGT.IsActive = CAST(0 AS BIT);

    UPDATE T
    SET T.TODATE = V.TODATE
    FROM AX2009.INVENTPOSTING_History T
    LEFT JOIN AX2009.INVENTPOSTING_HistoryView V ON V.DATAAREAID = T.DATAAREAID
        AND V.INVENTACCOUNTTYPE = T.INVENTACCOUNTTYPE
        AND V.ITEMCODE = T.ITEMCODE
        AND V.ITEMRELATION = T.ITEMRELATION
        AND V.CUSTVENDCODE = T.CUSTVENDCODE
        AND V.CUSTVENDRELATION = T.CUSTVENDRELATION
        AND V.TAXGROUPID = T.TAXGROUPID
        AND V.COSTCODE = T.COSTCODE
        AND V.COSTRELATION = T.COSTRELATION
    WHERE T.IsActive = CAST(1 AS BIT)
        AND T.ChangeHashKey = V.ChangeHashKey;

    WITH RecordsDetail
    AS (
        SELECT
            IPH.DATAAREAID,
            IPH.INVENTACCOUNTTYPE,
            IPH.ITEMCODE,
            IPH.ITEMRELATION,
            IPH.CUSTVENDCODE,
            IPH.CUSTVENDRELATION,
            IPH.TAXGROUPID,
            IPH.COSTCODE,
            IPH.COSTRELATION,
            IPH.FROMDATE,
            IPH.TODATE,
            IPH.HistoricalHashKey,
            IPH.ChangeHashKey,
            IPH.LEDGERACCOUNTID,
            IPH.IsActive,
            ROW_NUMBER() OVER (PARTITION BY IPH.DATAAREAID,
                                            IPH.INVENTACCOUNTTYPE,
                                            IPH.ITEMCODE,
                                            IPH.ITEMRELATION,
                                            IPH.CUSTVENDCODE,
                                            IPH.CUSTVENDRELATION,
                                            IPH.TAXGROUPID,
                                            IPH.COSTCODE,
                                            IPH.COSTRELATION
                                            ORDER BY IPH.TODATE DESC) AS rn

        FROM AX2009.INVENTPOSTING_History IPH
    )
    INSERT INTO AX2009.INVENTPOSTING_History (
        DATAAREAID,
        INVENTACCOUNTTYPE,
        ITEMCODE,
        ITEMRELATION,
        CUSTVENDCODE,
        CUSTVENDRELATION,
        TAXGROUPID,
        COSTCODE,
        COSTRELATION,
        FROMDATE,
        TODATE,
        HistoricalHashKey,
        ChangeHashKey,
        LEDGERACCOUNTID,
        IsActive
    )
    SELECT
        V.DATAAREAID,
        V.INVENTACCOUNTTYPE,
        V.ITEMCODE,
        V.ITEMRELATION,
        V.CUSTVENDCODE,
        V.CUSTVENDRELATION,
        V.TAXGROUPID,
        V.COSTCODE,
        V.COSTRELATION,
        DATEADD(DAY, 1, RD.TODATE),
        V.TODATE,
        V.HistoricalHashKey,
        V.ChangeHashKey,
        V.LEDGERACCOUNTID,
        V.IsActive

    FROM AX2009.INVENTPOSTING_HistoryView V
    LEFT JOIN RecordsDetail RD ON RD.DATAAREAID = V.DATAAREAID
        AND RD.INVENTACCOUNTTYPE = V.INVENTACCOUNTTYPE
        AND RD.ITEMCODE = V.ITEMCODE
        AND RD.ITEMRELATION = V.ITEMRELATION
        AND RD.CUSTVENDCODE = V.CUSTVENDCODE
        AND RD.CUSTVENDRELATION = V.CUSTVENDRELATION
        AND RD.TAXGROUPID = V.TAXGROUPID
        AND RD.COSTCODE = V.COSTCODE
        AND RD.COSTRELATION = V.COSTRELATION
        AND RD.rn = 1
    WHERE RD.ChangeHashKey <> V.ChangeHashKey;

END;
GO

