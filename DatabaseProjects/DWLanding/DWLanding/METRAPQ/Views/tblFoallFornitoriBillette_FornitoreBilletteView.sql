
/**
 * @table METRAPQ.tblFoallFornitoriBillette_FornitoreBillette
 * @description 

 * @depends dbo.tblFoallFornitoriBillette

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.dbo.tblFoallFornitoriBillette
*/

CREATE   VIEW METRAPQ.tblFoallFornitoriBillette_FornitoreBilletteView
AS
SELECT
	-- Chiavi
	CodiceFornitore,		-- IDFornitoreBillette
	ID,		-- PKFornitoreBillette

	-- Dimensioni
	NomeFornitore		-- FornitoreBillette

FROM [SQL2014\DB2014].MetraPQ.dbo.tblFoallFornitoriBillette;
GO

