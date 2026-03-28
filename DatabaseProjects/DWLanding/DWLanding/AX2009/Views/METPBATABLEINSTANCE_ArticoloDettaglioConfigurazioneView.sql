CREATE VIEW AX2009.METPBATABLEINSTANCE_ArticoloDettaglioConfigurazioneView
AS
SELECT
	-- Chiavi
	DATAAREAID,  -- IDAzienda
	ITEMID,  -- IDArticoloConfigurato
	INVENTTRANSID,  -- IDGruppoTransazioni
	VARIABLENUM,  -- IDVariabile
	VARIABLENAME,  -- Variabile
	RECID,  -- PKArticoloDettaglioConfigurazione

	-- Dimensioni
	VALUESTR,  -- ValoreString
	VALUEINT,  -- ValoreInt
	VALUEINT64,  -- ValoreBigint
	VALUEREAL,  -- ValoreNumeric
	BASETYPENAME  -- TipoVariabile

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METPBATABLEINSTANCE
WHERE VARIABLENAME IN (N'AnodizingClass', N'RefItemId', N'ProtectiveFilm', N'FinishingId_Final')
	AND INCLUDE = 1;
GO

