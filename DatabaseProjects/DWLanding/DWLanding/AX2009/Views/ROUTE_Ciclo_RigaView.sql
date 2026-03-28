
CREATE VIEW AX2009.ROUTE_Ciclo_RigaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ROUTEID,		-- IDCiclo
	OPRNUM,		-- NumeroRiga
	RECID,		-- PKCiclo_Riga

	-- Dimensioni
	OPRID		-- IDOperazione

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.ROUTE;
GO

