
CREATE VIEW AX2009.NPOPACKINGSLIPPALLETINFO_DDTPalletView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	DELIVERYDATE,		-- DataDDT
	PACKINGSLIPID,		-- NumeroDDT
	INVENTTRANSID,		-- IDGruppoTransazioni
	WMSPALLETID,		-- IDPallet
	RECID,		-- PKDDTPallet

	-- Dimensioni
	TRANSREFID,		-- OrdineCliente
	REFTABLEID,		-- IDTabellaRiferimento
	INVOICERECID,		-- PKFatturaCliente

	-- Misure
	WEIGHT		-- QtaKg

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOPACKINGSLIPPALLETINFO;
GO

