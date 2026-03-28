
CREATE VIEW AX2009.ROUTEOPRTABLE_OperazioneView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	OPRID,		-- IDOperazione
	RECID,		-- PKOperazione

	-- Dimensioni
	NAME,		-- Operazione
	NPOREVENUEGROUP		-- IDGruppoRicavi

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.ROUTEOPRTABLE;
GO

