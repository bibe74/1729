
CREATE VIEW AX2009.DATAAREA_AziendaView
AS
SELECT
	-- Chiavi
	ID,		-- IDAzienda
	RECID,		-- PKAzienda_old

	-- Dimensioni
	NAME,		-- Azienda
	ISVIRTUAL,		-- IsVirtuale
	TIMEZONE		-- IDFusoOrario

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.DATAAREA;
GO

