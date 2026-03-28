
CREATE VIEW AX2009.INVENTITEMINVENTSETUP_ArticoloImpostazioniScorteView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ITEMID,		-- IDArticoloConfigurato
	INVENTDIMID,		-- IDDimensioneInventariale
	RECID,		-- PKArticoloImpostazioniScorte

	-- Dimensioni
	INVENTDIMIDDEFAULT		-- IDDimensioneInventarialeDefault

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTITEMINVENTSETUP;
GO

