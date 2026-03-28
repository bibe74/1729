
CREATE VIEW AX2009.NPOCRSTABLE_RiepilogoCRSView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	CRSNUM,		-- NumeroCRS
	RECID,		-- PKRiepilogoCRS

	-- Dimensioni
	EXPEDITIONSTATUS,		-- IDStatoSpedizione [enum WMSExpeditionStatus]
	CREATEDDATETIME,		-- DataOraCreazione
	COVERINGBASIS,		-- IDCriterioCopertura [enum NPOCoveringBasis]
	STATIONID,		-- IDStazionePrelievo
	AREAID		-- IDAreaPrelievo

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOCRSTABLE;
GO

