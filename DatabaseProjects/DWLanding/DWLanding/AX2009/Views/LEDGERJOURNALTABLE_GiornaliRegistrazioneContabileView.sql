
CREATE VIEW AX2009.LEDGERJOURNALTABLE_GiornaliRegistrazioneContabileView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	JOURNALNUM,		-- IDGiornaleRegistrazioneContabile
	RECID,		-- PKGiornaleRegistrazioneContabile

	-- Dimensioni
	NAME		-- GiornaleRegistrazioneContabile

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.LEDGERJOURNALTABLE;
GO

