
CREATE VIEW AX2009.INVENTTRANSFERJOURLINE_OrdiniTrasferimento_RigaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	TRANSFERID,		-- OrdineTrasferimento
	VOUCHERID,		-- Giustificativo
	LINENUM,		-- NumeroRiga
	RECID,		-- PKOrdineTrasferimento_Riga

	-- Dimensioni
	INVENTTRANSID,		-- IDGruppoTransazioni
	ITEMID,		-- IDArticoloConfigurato
	INVENTDIMID,		-- IDDimensioneInventariale
	TRANSDATE,		-- DataTrasferimento
	NPOINVENTPACKINGSLIPID,		-- NumeroDDT

	-- Misure
	UNITID,		-- IDUnitaDiMisura
	QTYRECEIVED,		-- QtaRicevuta
	QTYSHIPPED,		-- QtaSpedita
	QTYSCRAPPED		-- QtaScartata

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTTRANSFERJOURLINE;
GO

