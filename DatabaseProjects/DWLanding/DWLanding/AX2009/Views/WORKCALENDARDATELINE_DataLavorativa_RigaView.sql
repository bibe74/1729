
CREATE VIEW AX2009.WORKCALENDARDATELINE_DataLavorativa_RigaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	TRANSDATE,		-- DataCalendario
	CALENDARID,		-- IDCalendario
	FROMTIME,		-- InizioTurno
	RECID,		-- PKDataCalendario_Riga

	-- Dimensioni
	TOTIME,		-- FineTurno
	NPOWORKCALENDARDATELINEID		-- PKDataCalendario_Turno

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.WORKCALENDARDATELINE;
GO

