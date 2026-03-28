
CREATE VIEW AX2009.NPOPACKINGTAG_Pacchi_EtichettaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PACKINGID,        -- NumeroPacco
    RECID,        -- PKPacchi_Etichetta

    -- Dimensioni
    CUSTNAME,        -- Cliente
    CUSTACCOUNT,        -- IDCliente
    REASON,        -- IDCausale
    CUSTADDRESS,        -- IndirizzoCliente
    FINISHING,        -- IDFinitura
    FINISHING2,        -- IDFinitura2
	CASE WHEN CUSTACCOUNT LIKE N'ALC001%' OR CUSTADDRESS LIKE N'METRA COLOR%' THEN 1 ELSE 0 END AS IsDaLavorareMetraColor

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOPACKINGTAG;
GO

