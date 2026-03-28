
CREATE VIEW AX2009.ROUTEVERSION_CicloView
AS
SELECT
	-- Chiavi
	DATAAREAID,	-- IDAzienda
	ROUTEID,	-- IDCiclo
	RECID,		-- PKCiclo

	-- Dimensioni
	FROMDATE,	-- DataInizio
	ITEMID,		-- IDArticoloConfigurato
	TODATE		-- DataFine

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.ROUTEVERSION
WHERE ACTIVE = 1
	AND APPROVED = 1;
GO

