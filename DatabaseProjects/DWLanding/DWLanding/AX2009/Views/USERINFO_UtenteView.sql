
CREATE VIEW AX2009.USERINFO_UtenteView
AS
SELECT
	-- Chiavi
	ID,		-- IDUtente
	NAME,		-- Utente
	RECID,		-- PKUtente

	-- Dimensioni
	NETWORKALIAS		-- LoginAD

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.USERINFO;
GO

