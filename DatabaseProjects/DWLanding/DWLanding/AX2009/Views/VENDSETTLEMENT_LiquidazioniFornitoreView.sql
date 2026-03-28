
CREATE VIEW AX2009.VENDSETTLEMENT_LiquidazioniFornitoreView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	TRANSDATE,		-- DataTransazione
	OFFSETTRANSVOUCHER,		-- Giustificativo
	ACCOUNTNUM,		-- IDFornitore
	RECID,		-- PKLiquidazioniFornitore

	-- Dimensioni
	TRANSRECID,		-- PKTransazioniFornitore
	DUEDATE,		-- DataScadenza
	TRANSCOMPANY,		-- IDAziendaTransazione

	-- Misure
	SETTLEAMOUNTCUR,		-- Importo
	SETTLEAMOUNTMST		-- ImportoEuro

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.VENDSETTLEMENT;
GO

