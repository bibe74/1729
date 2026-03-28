
CREATE VIEW AX2009.MARKUPTRANS_TransazioniSpeseAccessorieView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	TRANSTABLEID,		-- IDTabellaRiferimento
	TRANSRECID,		-- IDRecordRiferimento
	LINENUM,		-- NumeroRiga
	RECID,		-- PKSpeseAccessorie

	-- Dimensioni
	MARKUPCODE,		-- IDArticoloSpeseAccessorie
	TRANSDATE,		-- DataTransazione
	TXT,		-- ArticoloSpeseAccessorie

	-- Misure
	CURRENCYCODE,		-- IDValuta
	VALUE,		-- Importo
	CALCULATEDAMOUNT		-- ImportoCalcolato

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.MARKUPTRANS;
GO

