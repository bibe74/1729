
CREATE VIEW AX2009.NPOWRKCTRPRESET_CentroDiLavoroDatiEstrusioneView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	MASTERWRKCTRID,		-- IDPressa
	WRKCTRID,		-- CodiceMatrice
	BARLENGTH,		-- LunghezzaBarra
	RECID,		-- PKCentroDiLavoroDatiEstrusione

	-- Dimensioni
	ESTRBACKLENGTH,		-- AltezzaFondelloMatrice
	ISGROUP,		-- IsGruppo
	FIRSTBILLLENGTH		-- LunghezzaPrimaBilletta

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOWRKCTRPRESET;
GO

