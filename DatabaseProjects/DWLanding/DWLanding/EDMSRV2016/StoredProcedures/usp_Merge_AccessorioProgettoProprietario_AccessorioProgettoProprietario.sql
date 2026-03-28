
CREATE PROCEDURE EDMSRV2016.usp_Merge_AccessorioProgettoProprietario_AccessorioProgettoProprietario
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'EDMSRV2016.AccessorioProgettoProprietario_AccessorioProgettoProprietario', N'U') IS NULL
BEGIN
	EXEC EDMSRV2016.usp_Create_AccessorioProgettoProprietario_AccessorioProgettoProprietario;
	EXEC EDMSRV2016.usp_AddIndexes_AccessorioProgettoProprietario_AccessorioProgettoProprietario;
END;

MERGE INTO EDMSRV2016.AccessorioProgettoProprietario_AccessorioProgettoProprietario AS TGT
USING EDMSRV2016.AccessorioProgettoProprietario_AccessorioProgettoProprietarioView (nolock) AS SRC
ON SRC.Accessorio_Codice = TGT.Accessorio_Codice
WHEN MATCHED AND (TGT.Accessorio_ProgettoProprietario <> SRC.Accessorio_ProgettoProprietario)
  THEN UPDATE SET TGT.Accessorio_ProgettoProprietario = SRC.Accessorio_ProgettoProprietario
WHEN NOT MATCHED
  THEN INSERT VALUES (SRC.Accessorio_Codice, SRC.Accessorio_ProgettoProprietario)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'EDMSRV2016.AccessorioProgettoProprietario_AccessorioProgettoProprietario' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.Accessorio_Codice, deleted.Accessorio_Codice) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

