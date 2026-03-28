
CREATE VIEW AX2009.INVENTTRANSFERJOUR_OrdiniTrasferimentoView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	TRANSFERID,		-- OrdineTrasferimento
	VOUCHERID,		-- Giustificativo
	RECID,		-- PKOrdiniTrasferimento

	-- Dimensioni
	TRANSDATE,		-- DataTrasferimento
	TOADDRESSCOUNTY,		-- IDProvinciaDestinazione
	TOADDRESSSTATE,		-- IDRegioneDestinazione
	TOADDRESSCOUNTRYREGIONID,		-- IDStatoDestinazione
	UPDATETYPE,		-- IDTipoTrasferimento [enum InventTransferUpdateType]
	NPOINVENTPACKINGSLIPID		-- NumeroDDT

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTTRANSFERJOUR;
GO

