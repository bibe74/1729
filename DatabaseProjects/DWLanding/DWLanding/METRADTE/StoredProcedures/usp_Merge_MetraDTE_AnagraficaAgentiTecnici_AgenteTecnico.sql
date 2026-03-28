
CREATE PROCEDURE METRADTE.usp_Merge_MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'METRADTE.MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico', N'U') IS NULL
BEGIN
 EXEC METRADTE.usp_Create_MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico;
 EXEC METRADTE.usp_AddIndexes_MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico;
END;

MERGE INTO METRADTE.MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico AS TGT
USING METRADTE.MetraDTE_AnagraficaAgentiTecnici_AgenteTecnicoView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.nomeCognome <> SRC.nomeCognome)
  THEN UPDATE SET TGT.nomeCognome = SRC.nomeCognome
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, nomeCognome)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
 CURRENT_TIMESTAMP AS merge_datetime,
 $action AS merge_action,
 'METRADTE.MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico' AS full_olap_table_name,
 'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

