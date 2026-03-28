
CREATE VIEW AX2009.CUSTBILLOFEXCHANGEJOUR_EffettiAttiviView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	BILLOFEXCHANGEID,		-- IDEffettiAttivi
	RECID,		-- PKEffettiAttivi

	-- Dimensioni
	CUSTACCOUNT,		-- IDCliente
	BILLOFEXCHANGESEQNUM,		-- ProgressivoEffettiAttivi
	STATUS		-- IDStato_Testata

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTBILLOFEXCHANGEJOUR;
GO

