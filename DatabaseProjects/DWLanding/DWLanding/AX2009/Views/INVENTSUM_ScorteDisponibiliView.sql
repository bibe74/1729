
CREATE VIEW AX2009.INVENTSUM_ScorteDisponibiliView
AS
SELECT
	-- Chiavi
	DATAAREAID,				-- IDAzienda
	INVENTDIMID,			-- IDDimensioneInventariale
	ITEMID,					-- IDArticoloConfigurato
	RECID,					-- PKScorteDisponibili

	-- Misure
	PHYSICALINVENT,			-- Qta
	NPOPHYSICALINVENT2UM,	-- QtaKg
	POSTEDQTY,				-- QtaRegistrata?
	RECEIVED,				-- QtaRicevuta
	DEDUCTED,				-- QtaDedotta
	REGISTERED,				-- QtaRegistrata?
	PICKED,					-- QtaPrelevata
	ONORDER,				-- QtaInOrdinazione
	RESERVORDERED,			-- QtaOrdinatoPrenotato
	RESERVPHYSICAL			-- QtaFisicoPrenotato

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTSUM
WHERE CLOSED = 0
	AND PHYSICALINVENT <> 0;
GO

