
CREATE VIEW AX2009.METANODIZINGCLASSDEFAULT_ArticoloClasseAnodizzazioneStandardView
AS
SELECT
	-- Chiavi
	DATAAREAID,  -- IDAzienda
	ITEMID,  -- IDArticoloConfigurato
	RECID,  -- PKArticoloClasseAnodizzazioneDefault

	-- Dimensioni
	ANODIZINGCLASS  -- IDClasseAnodizzazione [enum METPBAAnodizingClass]

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METANODIZINGCLASSDEFAULT;
GO

