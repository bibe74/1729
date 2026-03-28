
CREATE VIEW AX2009.NPOITEMFAMILIES_FamigliaArticoloView
AS
SELECT
	-- Chiavi
	FAMILYID,		-- IDFamigliaArticolo
	RECID,		-- PKFamigliaArticolo

	-- Dimensioni
	NAME		-- FamigliaArticolo

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOITEMFAMILIES;
GO

