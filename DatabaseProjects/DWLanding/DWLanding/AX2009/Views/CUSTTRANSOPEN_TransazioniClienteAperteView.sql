
CREATE VIEW AX2009.CUSTTRANSOPEN_TransazioniClienteAperteView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ACCOUNTNUM,		-- IDCliente
	DUEDATE,		-- DataScadenza
	RECID,		-- PKTransazioniClienteAperte

	-- Dimensioni
	REFRECID,		-- PKTransazioniCliente
	TRANSDATE,		-- DataTransazione

	-- Misure
	AMOUNTCUR,		-- Importo
	AMOUNTMST		-- ImportoEuro

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTTRANSOPEN;
GO

