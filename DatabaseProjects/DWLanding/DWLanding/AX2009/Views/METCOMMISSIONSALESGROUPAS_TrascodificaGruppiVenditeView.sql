
CREATE VIEW AX2009.METCOMMISSIONSALESGROUPAS_TrascodificaGruppiVenditeView
AS
SELECT
	-- Chiavi
	DATAAREAID,  -- IDAzienda
	GROUPIDAS,  -- IDGruppoVenditeAS400
	RECID,  -- PKTrascodificaGruppiVendite

	-- Dimensioni
	GROUPID,  -- IDGruppoVendite
	NAME  -- GruppoVenditeAS400

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METCOMMISSIONSALESGROUPAS;
GO

