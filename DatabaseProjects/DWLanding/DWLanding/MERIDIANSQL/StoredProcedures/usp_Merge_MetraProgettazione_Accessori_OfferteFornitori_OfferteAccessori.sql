
CREATE PROCEDURE MERIDIANSQL.usp_Merge_MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MERIDIANSQL.MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori', N'U') IS NULL
BEGIN
    EXEC MERIDIANSQL.usp_Create_MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori;
    EXEC MERIDIANSQL.usp_AddIndexes_MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori;
END;

MERGE INTO MERIDIANSQL.MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori AS TGT
USING MERIDIANSQL.MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessoriView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDFornitore <> SRC.IDFornitore OR TGT.CodiceAccessorio <> SRC.CodiceAccessorio OR TGT.DataOfferta <> SRC.DataOfferta OR TGT.Lotto <> SRC.Lotto OR TGT.ProprietaAttrezzatura <> SRC.ProprietaAttrezzatura OR TGT.Progetto <> SRC.Progetto OR TGT.Documento <> SRC.Documento OR TGT.Revisione <> SRC.Revisione OR TGT.RevisioneSuperata <> SRC.RevisioneSuperata OR TGT.UnitaMisura <> SRC.UnitaMisura OR TGT.Scatola <> SRC.Scatola OR TGT.QtaMinimaVendita <> SRC.QtaMinimaVendita OR TGT.Peso <> SRC.Peso OR TGT.Costo <> SRC.Costo OR TGT.CostoAttrezzatura <> SRC.CostoAttrezzatura)
  THEN UPDATE SET TGT.IDFornitore = SRC.IDFornitore, TGT.CodiceAccessorio = SRC.CodiceAccessorio, TGT.DataOfferta = SRC.DataOfferta, TGT.Lotto = SRC.Lotto, TGT.ProprietaAttrezzatura = SRC.ProprietaAttrezzatura, TGT.Progetto = SRC.Progetto, TGT.Documento = SRC.Documento, TGT.Revisione = SRC.Revisione, TGT.RevisioneSuperata = SRC.RevisioneSuperata, TGT.UnitaMisura = SRC.UnitaMisura, TGT.Scatola = SRC.Scatola, TGT.QtaMinimaVendita = SRC.QtaMinimaVendita, TGT.Peso = SRC.Peso, TGT.Costo = SRC.Costo, TGT.CostoAttrezzatura = SRC.CostoAttrezzatura
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDFornitore, CodiceAccessorio, DataOfferta, Lotto, ProprietaAttrezzatura, Progetto, Documento, Revisione, RevisioneSuperata, UnitaMisura, Scatola, QtaMinimaVendita, Peso, Costo, CostoAttrezzatura)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MERIDIANSQL.MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

