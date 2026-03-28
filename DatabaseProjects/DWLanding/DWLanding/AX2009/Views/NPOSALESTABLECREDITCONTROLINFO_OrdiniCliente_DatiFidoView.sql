
CREATE VIEW AX2009.NPOSALESTABLECREDITCONTROLINFO_OrdiniCliente_DatiFidoView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	SALESID,		-- OrdineCliente
	RECID,		-- PKOrdiniCliente_DatiFido

	-- Dimensioni
	CONFIRMBLOCKED,		-- IsBloccoConferma
	UNLOCKCAUSAL,		-- IDCausaleAutorizzazioneFido
	PACKINGBLOCKED,		-- IsBloccoDDT
	PICKINGBLOCKED,		-- IsBloccoPrelievo
	INVOICEBLOCKED,		-- IsBloccoFattura
	CREATEDDATETIME		-- DataOraCreazione

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOSALESTABLECREDITCONTROLINFO;
GO

