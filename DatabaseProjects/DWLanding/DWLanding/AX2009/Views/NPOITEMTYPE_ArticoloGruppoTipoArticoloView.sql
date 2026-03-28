
CREATE VIEW AX2009.NPOITEMTYPE_ArticoloGruppoTipoArticoloView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ITEMTYPE,		-- IDTipoArticolo
	RECID,		-- PKTipoArticolo

	-- Dimensioni
	NAME,		-- TipoArticolo
	STRUCTUALGROUP,		-- IDTipoStruttura [enum NPOIsStructuralType]
	ACCESSORYITEM		-- IsAccessorio

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOITEMTYPE;
GO

