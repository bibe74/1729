
CREATE VIEW AX2009.ADDRESSCOUNTY_ProvinciaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	COUNTRYREGIONID,		-- IDNazione
	STATEID,		-- IDRegione
	COUNTYID,		-- IDProvincia
	RECID,		-- PKProvincia

	-- Dimensioni
	NAME		-- Provincia

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.ADDRESSCOUNTY;
GO

