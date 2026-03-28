
CREATE VIEW AX2009.CUSTBILLOFEXCHANGETRANS_EffettiAttivi_RigaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	BILLOFEXCHANGEID,		-- IDEffettiAttivi
	SEQNUM,		-- NumeroProgressivo
	RECID,		-- PKEffettiAttivi_Riga

	-- Dimensioni
	STATUS,		-- IDStato_Riga
	TRANSDATE,		-- DataTransazione
	DUEDATE,		-- DataScadenza

	-- Misure
	CURRENCYCODE,		-- IDValuta
	AMOUNTCUR		-- Importo

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTBILLOFEXCHANGETRANS;
GO

