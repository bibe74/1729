
CREATE VIEW AX2009.NPOBOETOTALTABLE_InsolutiView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	CUSTACCOUNT,		-- IDCliente
	MACROAREA,		-- IDMacroArea
	EMPLID,		-- IDDipendente
	TRANSTYPE,		-- IDTipoTransazioneInsoluti [enum NCEBOETransType]
	RECID,		-- PKInsoluti

	-- Dimensioni
	STARTYRMTHDATE,		-- Data

	-- Misure
	NUMBERPROTESTED,		-- NumeroProtestati
	NUMBERDRAWN,		-- NumeroEmessi
	AMOUNTDRAWN,		-- ImportoEmesso
	AMOUNTPROTESTED		-- ImportoProtestato

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOBOETOTALTABLE;
GO

