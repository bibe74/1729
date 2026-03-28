
CREATE VIEW AX2009.NPOBOETOTALTABLEMONTH_Insoluti_MeseView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	YR,		-- Anno
	MONTH,		-- Mese
	CUSTACCOUNT,		-- IDCliente
	MACROAREA,		-- IDMacroArea
	EMPLID,		-- IDDipendente
	TRANSTYPE,		-- IDTipoTransazioneInsoluti [enum NCEBOETransType]
	RECID,		-- PKInsoluti

	-- Misure
	NUMBERDRAWN,		-- NumeroEmessi
	NUMBERPROTESTED,		-- NumeroProtestati
	AMOUNTDRAWN,		-- ImportoEmesso
	AMOUNTPROTESTED		-- ImportoProtestato

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOBOETOTALTABLEMONTH;
GO

