
CREATE VIEW AX2009.VENDINVOICEJOUR_FattureFornitoreView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	PURCHID,		-- OrdineFornitore_Testata
	INVOICEID,		-- NumeroFattura
	INVOICEDATE,		-- DataFattura
	NUMBERSEQUENCEGROUP,		-- GruppoSequenzaNumerica
	INTERNALINVOICEID,		-- NumeroFatturaInterna
	RECID,		-- PKFattureFornitore

	-- Dimensioni
	ORDERACCOUNT,		-- IDFornitoreOrdine
	INVOICEACCOUNT,		-- IDFornitore
	LEDGERVOUCHER,		-- Giustificativo

	-- Misure
	CURRENCYCODE,		-- IDValuta
	EXCHRATE,		-- TassoDiCambio
	INVOICEAMOUNT,		-- ImportoFattura
	INVOICEAMOUNTMST,		-- ImportoEuroFattura
	SALESBALANCE,		-- ImponibileAcquistiFattura
	SUMMARKUP,		-- ImponibileSpeseFattura
	SUMMARKUPMST,		-- ImponibileEuroSpeseFattura
	SUMTAX		-- ImportoEuroIVAFattura

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.VENDINVOICEJOUR;
GO

