
CREATE VIEW AX2009.INVENTTXT_ArticoloTraduzioneView
AS
SELECT
	-- Chiavi
	DATAAREAID,	-- IDAzienda
	ITEMID,		-- IDArticoloConfigurato
	LANGUAGEID,	-- IDLingua
	RECID,		-- PKArticoloTraduzione

	-- Dimensioni
	TXT			-- ArticoloTraduzione

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTTXT
WHERE LANGUAGEID IN (N'it', N'en', N'fr');
GO

