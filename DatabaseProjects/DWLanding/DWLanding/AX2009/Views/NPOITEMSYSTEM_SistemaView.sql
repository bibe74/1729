
CREATE VIEW AX2009.NPOITEMSYSTEM_SistemaView
AS
SELECT
	-- Chiavi
	SYSTEMID,		-- IDSistema
	RECID,		-- PKSistema

	-- Dimensioni
	NAME,		-- Sistema
	SECTORTYPE		-- IDTipoSettore [enum NPOSectorTypeId]

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOITEMSYSTEM;
GO

