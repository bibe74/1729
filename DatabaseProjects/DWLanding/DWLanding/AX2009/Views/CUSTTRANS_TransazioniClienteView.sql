
CREATE VIEW AX2009.CUSTTRANS_TransazioniClienteView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ACCOUNTNUM,		-- IDCliente
	DUEDATE,		-- DataScadenza
	RECID,		-- PKTransazioniCliente

	-- Dimensioni
	TRANSDATE,		-- DataTransazione
	PAYMMODE,		-- IDMetodoPagamentoCliente
	BILLOFEXCHANGEID,		-- IDEffettoAttivo
	BILLOFEXCHANGESTATUS,		-- IDStato [enum CustVendNegInstStatus]
	BILLOFEXCHANGESEQNUM,		-- NumeroProgressivo
	BANKREMITTANCEFILEID,		-- NumeroRimessa

	-- Misure
	CURRENCYCODE,		-- IDValuta
	AMOUNTCUR,		-- Importo
	AMOUNTMST		-- ImportoEuro

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTTRANS;
GO

