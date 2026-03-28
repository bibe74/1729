
CREATE VIEW AX2009.BANKACCOUNTTABLE_ContoBancarioView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    ACCOUNTID,        -- IDContoBancario
    RECID,        -- PKContoBancario

    -- Dimensioni
    NAME        -- ContoBancario

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.BANKACCOUNTTABLE;
GO

