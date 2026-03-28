
CREATE VIEW AX2009.ROUTEOPR_RelazioneOperativaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ITEMCODE,		-- ITEMCODE
	ITEMRELATION,		-- IDArticoloConfigurato
	ROUTECODE,		-- ROUTECODE
	ROUTERELATION,		-- Ciclo
	RECID,		-- PKRelazioneOperativa

	-- Dimensioni
	OPRID,		-- IDOperazione
	WRKCTRID		-- IDCentroDiLavoro

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.ROUTEOPR;
GO

