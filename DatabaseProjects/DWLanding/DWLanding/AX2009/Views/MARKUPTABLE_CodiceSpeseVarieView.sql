
CREATE VIEW AX2009.MARKUPTABLE_CodiceSpeseVarieView
AS
SELECT
	-- Chiavi
	DATAAREAID,  -- IDAzienda
	MODULETYPE,  -- IDModulo [enum ModuleInventCustVend]
	MARKUPCODE,  -- IDCodiceSpeseVarie
	RECID,  -- PKCodiceSpeseVarie

	-- Dimensioni
	TXT,  -- CodiceSpeseVarie
	CUSTPOSTING,  -- IDAddebito [enum LedgerPostingType]
	CUSTACCOUNT,  -- ContoDare
	VENDPOSTING,  -- IDAccredito [enum LedgerPostingType]
	VENDACCOUNT,  -- ContoAvere
	CUSTTYPE,  -- IDTipoAddebito [enum MarkupType]
	VENDTYPE  -- IDTipoAccredito [enum MarkupType]

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.MARKUPTABLE;
GO

