
CREATE PROCEDURE METRAPQ.usp_Merge_tblFoallFornitoriBillette_FornitoreBillette
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'METRAPQ.tblFoallFornitoriBillette_FornitoreBillette', N'U') IS NULL
BEGIN
	EXEC METRAPQ.usp_Create_tblFoallFornitoriBillette_FornitoreBillette;
	EXEC METRAPQ.usp_AddIndexes_tblFoallFornitoriBillette_FornitoreBillette;
END;

MERGE INTO METRAPQ.tblFoallFornitoriBillette_FornitoreBillette AS TGT
USING METRAPQ.tblFoallFornitoriBillette_FornitoreBilletteView (nolock) AS SRC
ON SRC.CodiceFornitore = TGT.CodiceFornitore
WHEN MATCHED AND (TGT.NomeFornitore <> SRC.NomeFornitore)
  THEN UPDATE SET TGT.NomeFornitore = SRC.NomeFornitore
WHEN NOT MATCHED
  THEN INSERT VALUES (CodiceFornitore, ID, NomeFornitore)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'METRAPQ.tblFoallFornitoriBillette_FornitoreBillette' AS full_olap_table_name,
	'CodiceFornitore = ' + CAST(COALESCE(inserted.CodiceFornitore, deleted.CodiceFornitore) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

