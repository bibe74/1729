
CREATE VIEW AX2009.WMSPICKINGROUTE_CicloPrelievoView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	PICKINGROUTEID,		-- IDCicloPrelievo
	RECID,		-- PKCicloPrelievo

	-- Dimensioni
	EXPEDITIONSTATUS,		-- IDStatoSpedizione [enum WMSExpeditionStatus]
	CURRENTPICKPALLETID,		-- IDPallet
	NPOWORKSPACE,		-- PosizioneKasto
	NPODLVSTATIONID,		-- StazioneKasto
	NPOCRSNUMID		-- NumeroCRS

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.WMSPICKINGROUTE;
GO

