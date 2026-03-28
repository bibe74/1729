
CREATE VIEW AX2009.NPOINTERCOMPANYINVENTTABLE_ArticoloGruppoFamigliaView
AS
SELECT
	-- Chiavi
	ITEMID,		-- IDArticoloConfigurato
	SUBFAMILYID,		-- IDSottofamiglia
	RECID,		-- PKArticoloGruppoFamiglia

	-- Dimensioni
	FAMILYID		-- IDFamiglia

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOINTERCOMPANYINVENTTABLE
WHERE ITEMID <> N'';
GO

