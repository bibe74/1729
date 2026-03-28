
CREATE VIEW AX2009.NPOITEMSUBFAMILIES_SottofamigliaArticoloView
AS
SELECT
	-- Chiavi
	SUBFAMILYID,		-- IDSottofamigliaArticolo
	RECID,		-- PKSottofamigliaArticolo

	-- Dimensioni
	NAME,		-- SottofamigliaArticolo
	FAMILYID		-- IDFamigliaArticolo

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOITEMSUBFAMILIES;
GO

