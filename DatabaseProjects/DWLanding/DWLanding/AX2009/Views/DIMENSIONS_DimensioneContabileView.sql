
CREATE VIEW AX2009.DIMENSIONS_DimensioneContabileView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	DIMENSIONCODE,		-- CodiceDimensioneContabile
	NUM,		-- IDDimensioneContabile
	RECID,		-- PKDimensioneContabile

	-- Dimensioni
	DESCRIPTION		-- DimensioneContabile

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.DIMENSIONS;
GO

