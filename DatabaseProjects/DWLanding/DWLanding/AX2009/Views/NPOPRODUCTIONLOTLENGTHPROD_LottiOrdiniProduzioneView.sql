
CREATE VIEW AX2009.NPOPRODUCTIONLOTLENGTHPROD_LottiOrdiniProduzioneView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	LOTID,		-- NumeroLotto
	PRODID,		-- OrdineProduzione
	RECID,		-- PKLottiOrdiniProduzione

	-- Dimensioni
	SALESID,		-- OrdineCliente
	LOTLENGTH,		-- LunghezzaBarra
	SALESNPOLINENUM,		-- NumeroRiga

	-- Misure
	ASSIGNEDQTY		-- Qta

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOPRODUCTIONLOTLENGTHPROD;
GO

