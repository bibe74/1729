
CREATE VIEW AX2009.INVENTITEMSALESSETUP_ArticoloImpostazioniVenditaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ITEMID,		-- IDArticoloConfigurato
	RECID,		-- PKArticoloDatiVendita

	-- Dimensioni
	INVENTDIMID,		-- IDDimensioneInventariale
	INVENTDIMIDDEFAULT,		-- IDDimensioneInventariale_Default
	OVERRIDE,		-- IsSostituisci
	NPOSALESMTSQTYMAX,		-- QtaMaxOrdineDaMagazzino

	-- Misure
	LEADTIME		-- LeadTimeVendita

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTITEMSALESSETUP;
GO

