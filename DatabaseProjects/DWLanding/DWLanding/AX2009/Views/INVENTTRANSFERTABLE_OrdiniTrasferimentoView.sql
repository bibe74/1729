
CREATE VIEW AX2009.INVENTTRANSFERTABLE_OrdiniTrasferimentoView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	TRANSFERID,		-- OrdineTrasferimento
	RECID,		-- PKOrdiniTrasferimento

	-- Dimensioni
	INVENTLOCATIONIDFROM,		-- IDMagazzinoOrigine
	INVENTLOCATIONIDTO,		-- IDMagazzinoDestinazione
	TRANSFERSTATUS,		-- IDStatoTrasferimento [enum InventTransferStatus]
	SHIPDATE,		-- DataSpedizione
	RECEIVEDATE		-- DataRicevimento

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTTRANSFERTABLE;
GO

