
CREATE VIEW AX2009.SHIPCARRIERCOMPANY_SocietaSpedizioniView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	CARRIERNAME,		-- Vettore
	RECID,		-- PKSocietaSpedizioni

	-- Dimensioni
	VENDACCOUNT		-- IDFornitore

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.SHIPCARRIERCOMPANY;
GO

