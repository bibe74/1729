
CREATE VIEW AX2009.VENDTRANSOPEN_TransazioniFornitoreAperteView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	TRANSDATE,		-- DataTransazione
	ACCOUNTNUM,		-- IDFornitore
	RECID,		-- PKTransazioniFornitoreAperte

	-- Dimensioni
	REFRECID,		-- PKTransazioniFornitore
	DUEDATE,		-- DataScadenza

	-- Misure
	AMOUNTCUR,		-- Importo
	AMOUNTMST		-- ImportoEuro

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.VENDTRANSOPEN;
GO

