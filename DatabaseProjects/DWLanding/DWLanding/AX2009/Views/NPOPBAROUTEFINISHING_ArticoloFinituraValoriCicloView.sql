
CREATE VIEW AX2009.NPOPBAROUTEFINISHING_ArticoloFinituraValoriCicloView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ITEMID,		-- IDArticoloConfigurato
	FINISHINGID,		-- IDFinitura
	OPRNUM,		-- NumeroOperazione
	RECID,		-- PKArticoloFinituraValoriCiclo

	-- Dimensioni
	OPRID,		-- IDOperazione
	WRKCTRID		-- IDCentroDiLavoro

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOPBAROUTEFINISHING;
GO

