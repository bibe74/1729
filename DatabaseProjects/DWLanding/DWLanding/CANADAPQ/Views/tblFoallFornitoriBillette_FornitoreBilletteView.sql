
/**
 * @table CANADAPQ.tblFoallFornitoriBillette_FornitoreBillette
 * @description 

 * @depends dbo.tblFoallFornitoriBillette

SELECT TOP 1 * FROM [192.168.216.247\DB2017].MetraPQ.dbo.tblFoallFornitoriBillette
*/

CREATE   VIEW CANADAPQ.tblFoallFornitoriBillette_FornitoreBilletteView
AS
SELECT
	-- Chiavi
	N'C' + RIGHT(REPLICATE(N'0', 2) + CONVERT(NVARCHAR(2), ID), 2) AS CodiceFornitore,		-- IDFornitoreBillette
	ID,		-- PKFornitoreBillette

	-- Dimensioni
	NomeFornitore		-- FornitoreBillette

FROM [192.168.216.247\DB2017].MetraPQ.dbo.tblFornitoriBillette;
GO

