
CREATE VIEW AX2009.CUSTPACKINGSLIPTRANS_DDTCliente_RigaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	DELIVERYDATE,		-- DataDDT
	PACKINGSLIPID,		-- NumeroDDT
	SALESID,		-- OrdineCliente_Testata
	NPOLINENUM,		-- NumeroRiga
	RECID,		-- PKDDTCliente_Riga

	-- Dimensioni
	INVENTTRANSID,		-- IDGruppoTransazioni
	ITEMID,		-- IDArticoloConfigurato
	ORIGSALESID,		-- OrdineCliente
	NPOCONTRACTWORKTRANSID,		-- IDGruppoTransazioniContoTrasformazione

	-- Misure
	SALESUNIT,		-- IDUnitaDiMisura
	QTY,		-- QtaConsegnata
	INVENTQTY,		-- Qta (in caso di consegna parziale)
	ORDERED,		-- QtaOrdinata
	REMAIN,		-- QtaRimanenteConsegna
	NPOCONTRACTWORKQTY,		-- QtaContoTrasformazione
	NPOQTYSHIPPED,		-- QtaSpedita
	NPOCONTRACTWORKSECQTY,		-- QtaKgContoTrasformazione
	VALUEMST		-- ImportoEuro

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTPACKINGSLIPTRANS;
GO

