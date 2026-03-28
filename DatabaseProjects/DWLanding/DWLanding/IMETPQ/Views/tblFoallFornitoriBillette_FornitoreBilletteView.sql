
/**
 * @table IMETPQ.tblFoallFornitoriBillette_FornitoreBillette
 * @description 

 * @depends dbo.tblFoallFornitoriBillette

SELECT TOP 1 * FROM [SQL2012IMET\DB2012].MetraPQ.dbo.tblFoallFornitoriBillette
*/

CREATE   VIEW IMETPQ.tblFoallFornitoriBillette_FornitoreBilletteView
AS
SELECT
	-- Chiavi
	CodiceFornitore,		-- IDFornitoreBillette
	ID,		-- PKFornitoreBillette

	-- Dimensioni
	NomeFornitore		-- FornitoreBillette

FROM [SQL2012IMET\DB2012].MetraPQ.dbo.tblFoallFornitoriBillette;
GO

