
CREATE VIEW AX2009.VENDTRANS_TransazioniFornitoreView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	TRANSDATE,		-- DataTransazione
	VOUCHER,		-- Giustificativo
	ACCOUNTNUM,		-- IDFornitore
	INVOICE,		-- NumeroFattura
	RECID,		-- PKTransazioniFornitore

	-- Dimensioni
	DUEDATE,		-- DataScadenza
	CLOSED,		-- DataPagamento
	TRANSTYPE,		-- IDTipoTransazione
	DOCUMENTDATE,		-- DataDocumento
	PAYMMODE,		-- IDMetodoPagamento
	MODIFIEDTRANSACTIONID,		-- MODIFIEDTRANSACTIONID

	-- Misure
	CURRENCYCODE,		-- IDValuta
	AMOUNTCUR,		-- ImportoFattura
	AMOUNTMST		-- ImportoEuroFattura

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.VENDTRANS;
GO

