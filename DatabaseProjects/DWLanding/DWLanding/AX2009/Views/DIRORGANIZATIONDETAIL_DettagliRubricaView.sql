
CREATE VIEW AX2009.DIRORGANIZATIONDETAIL_DettagliRubricaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PARTYID,        -- IDRubrica
    RECID,        -- PKDettagliRubrica

    -- Dimensioni
    ABC        -- CodiceABC

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.DIRORGANIZATIONDETAIL;
GO

