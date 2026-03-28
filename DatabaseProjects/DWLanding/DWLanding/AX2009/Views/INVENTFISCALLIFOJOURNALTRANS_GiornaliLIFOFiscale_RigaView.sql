
CREATE VIEW AX2009.INVENTFISCALLIFOJOURNALTRANS_GiornaliLIFOFiscale_RigaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	JOURNALID,		-- IDGiornaleLIFOFiscale
	ITEMGROUP,		-- IDArticoloGruppoArticolo
	LINENUM,		-- NumeroRiga
	RECID,		-- PKGiornaleLIFOFiscale_Riga

	-- Dimensioni
	ITEMID,		-- IDArticoloConfigurato
	FISCALLIFOGROUPID,		-- IDArticoloGruppoLIFO
	YR,		-- Anno

	-- Misure
	UNITID,		-- IDUnitaDiMisura
	REMAINQTY,		-- Qta
	UNITVALUE		-- ValoreUnitario

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTFISCALLIFOJOURNALTRANS;
GO

