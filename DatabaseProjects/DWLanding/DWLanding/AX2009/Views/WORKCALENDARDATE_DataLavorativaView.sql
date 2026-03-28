
CREATE VIEW AX2009.WORKCALENDARDATE_DataLavorativaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	TRANSDATE,		-- DataCalendario
	CALENDARID,		-- IDCalendario
	RECID,		-- PKDataCalendario

	-- Dimensioni
	WORKTIMECONTROL		-- IDOrarioDiLavoro [enum WorkTimeControl]

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.WORKCALENDARDATE;
GO

