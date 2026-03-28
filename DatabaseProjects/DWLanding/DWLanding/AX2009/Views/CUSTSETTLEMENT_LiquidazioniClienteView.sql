
CREATE VIEW AX2009.CUSTSETTLEMENT_LiquidazioniClienteView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	TRANSRECID,		-- PKTransazioniCliente
	TRANSDATE,		-- DataLiquidazione
	RECID,		-- PKLiquidazioniCliente

	-- Dimensioni
	OFFSETTRANSVOUCHER,		-- GiustificativoContropartita
	DUEDATE,		-- DataScadenza
	OFFSETCOMPANY,		-- IDAziendaContropartita
	OFFSETACCOUNTNUM,		-- IDClienteContropartita

	-- Misure
	SETTLEAMOUNTCUR,		-- ImportoLiquidato
	SETTLEAMOUNTMST,		-- ImportoEuroLiquidato
	EXCHADJUSTMENT		-- ImportoRettificaCambio

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTSETTLEMENT;
GO

