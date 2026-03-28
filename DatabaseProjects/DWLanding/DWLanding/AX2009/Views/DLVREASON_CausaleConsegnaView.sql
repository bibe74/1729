
CREATE VIEW AX2009.DLVREASON_CausaleConsegnaView
AS
SELECT
	-- Chiavi
	DATAAREAID,  -- IDAzienda
	CODE,  -- IDCausaleConsegna
	RECID,  -- PKCausaleConsegna

	-- Dimensioni
	TXT,  -- CausaleConsegna
	FREE,  -- IsOmaggio
	NPODLVLINETYPE,  -- IDSpedibileFatturabile [enum NPOSIDlvLineType]
	NPOCONTRACTWORK  -- IsContoTrasformazione

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.DLVREASON;
GO

