
CREATE VIEW AX2009.SYSCOMPANYUSERINFO_RelazioneUtenteView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	USERID,		-- IDUtente
	RECID,		-- PKRelazioneUtente

	-- Dimensioni
	EMPLID		-- IDDipendente

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.SYSCOMPANYUSERINFO;
GO

