
CREATE VIEW AX2009.RETURNDISPOSITIONCODE_CodiceSmaltimentoView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	DISPOSITIONCODEID,		-- IDCodiceSmaltimento
	RECID,		-- PKCodiceSmaltimento

	-- Dimensioni
	DESCRIPTION,		-- CodiceSmaltimento
	DISPOSITIONACTION		-- IDAzioneSmaltimento [enum DispositionAction]

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.RETURNDISPOSITIONCODE;
GO

