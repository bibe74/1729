
CREATE VIEW AX2009.WMSTRANSPORT_TrasportiPalletView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	TRANSPORTID,		-- IDTrasportoPallet
	WMSPALLETID,		-- IDPallet
	RECID,		-- PKTrasportiPallet

	-- Dimensioni
	FROMLOCATION,		-- IDUbicazioneOrigine
	TOLOCATION,		-- IDUbicazioneDestinazione
	OPERATOR,		-- IDDipendente
	EXPEDITIONSTATUS,		-- IDStatoSpedizione
	SHIPMENTID,		-- IDSpedizione
	FROMINVENTLOCATIONID,		-- IDMagazzinoOrigine
	TOINVENTLOCATIONID,		-- IDMagazzinoDestinazione

	-- Misure
	TOTALQTY		-- Qta

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.WMSTRANSPORT;
GO

