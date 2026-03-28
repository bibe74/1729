
CREATE PROCEDURE METRAPQ.usp_Merge_statoavanzamento_RevisioniMatrici
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'METRAPQ.statoavanzamento_RevisioniMatrici', N'U') IS NULL
BEGIN
	EXEC METRAPQ.usp_Create_statoavanzamento_RevisioniMatrici;
	EXEC METRAPQ.usp_AddIndexes_statoavanzamento_RevisioniMatrici;
END;

MERGE INTO METRAPQ.statoavanzamento_RevisioniMatrici AS TGT
USING METRAPQ.statoavanzamento_RevisioniMatriciView (nolock) AS SRC
ON SRC.[N°] = TGT.[N°]
WHEN MATCHED AND (TGT.[Codice Metra] <> SRC.[Codice Metra] OR TGT.[Barra matrice] <> SRC.[Barra matrice] OR TGT.CodiceBarraMatrice <> SRC.CodiceBarraMatrice OR TGT.Revisione <> SRC.Revisione OR TGT.DataRevisione <> SRC.DataRevisione OR TGT.TipoAzione <> SRC.TipoAzione OR TGT.[Arrivo previsto matrice] <> SRC.[Arrivo previsto matrice] OR TGT.[Arrivo effettivo matrice] <> SRC.[Arrivo effettivo matrice] OR TGT.[Ordine matrice] <> SRC.[Ordine matrice] OR TGT.NumeroOrdineFornitore <> SRC.NumeroOrdineFornitore)
  THEN UPDATE SET TGT.[Codice Metra] = SRC.[Codice Metra], TGT.[Barra matrice] = SRC.[Barra matrice], TGT.CodiceBarraMatrice = SRC.CodiceBarraMatrice, TGT.Revisione = SRC.Revisione, TGT.DataRevisione = SRC.DataRevisione, TGT.TipoAzione = SRC.TipoAzione, TGT.[Arrivo previsto matrice] = SRC.[Arrivo previsto matrice], TGT.[Arrivo effettivo matrice] = SRC.[Arrivo effettivo matrice], TGT.[Ordine matrice] = SRC.[Ordine matrice], TGT.NumeroOrdineFornitore = SRC.NumeroOrdineFornitore
WHEN NOT MATCHED
  THEN INSERT VALUES ([N°], [Codice Metra], [Barra matrice], CodiceBarraMatrice, Revisione, DataRevisione, TipoAzione, [Arrivo previsto matrice], [Arrivo effettivo matrice], [Ordine matrice], NumeroOrdineFornitore)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'METRAPQ.statoavanzamento_RevisioniMatrici' AS full_olap_table_name,
	'[N°] = ' + CAST(COALESCE(inserted.[N°], deleted.[N°]) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

