
CREATE VIEW AX2009.UNITCONVERT_ConversioneUnitaDiMisuraView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ITEMID,		-- IDArticoloConfigurato
	FROMUNIT,		-- IDUnitaDiMisuraOrigine
	TOUNIT,		-- IDUnitaDiMisuraDestinazione
	RECID,		-- PKConversioneUnitaDiMisura

	-- Dimensioni
	FACTOR,		-- FattoreDiConversione
	MARKUP,		-- MARKUP
	ROUNDOFF		-- IDTipoArrotondamento

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.UNITCONVERT;
GO

