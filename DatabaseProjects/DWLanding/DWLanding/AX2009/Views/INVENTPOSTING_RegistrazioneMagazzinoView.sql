

CREATE VIEW AX2009.INVENTPOSTING_RegistrazioneMagazzinoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    INVENTACCOUNTTYPE,        -- IDTipoDiConto
    ITEMCODE,        -- CodiceArticolo
    ITEMRELATION,        -- RelazioneArticolo
    CUSTVENDCODE,        -- CodiceConto
    CUSTVENDRELATION,        -- RelazioneConto
    RECID,        -- PKRegistrazioneMagazzino

    -- Dimensioni
    TAXGROUPID,        -- TAXGROUPID
    LEDGERACCOUNTID,        -- IDContoCoGe
    COSTCODE,        -- COSTCODE
    COSTRELATION        -- COSTRELATION

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTPOSTING;
GO

