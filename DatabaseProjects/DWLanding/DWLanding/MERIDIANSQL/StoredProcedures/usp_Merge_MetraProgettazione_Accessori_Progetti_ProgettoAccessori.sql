CREATE PROCEDURE MERIDIANSQL.usp_Merge_MetraProgettazione_Accessori_Progetti_ProgettoAccessori
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MERIDIANSQL.MetraProgettazione_Accessori_Progetti_ProgettoAccessori', N'U') IS NULL
BEGIN
    EXEC MERIDIANSQL.usp_Create_MetraProgettazione_Accessori_Progetti_ProgettoAccessori;
    EXEC MERIDIANSQL.usp_AddIndexes_MetraProgettazione_Accessori_Progetti_ProgettoAccessori;
END;

MERGE INTO MERIDIANSQL.MetraProgettazione_Accessori_Progetti_ProgettoAccessori AS TGT
USING MERIDIANSQL.MetraProgettazione_Accessori_Progetti_ProgettoAccessoriView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Accessorio_Codice <> SRC.Accessorio_Codice OR TGT.Progetto_Numero <> SRC.Progetto_Numero OR TGT.Progetto_Sospeso <> SRC.Progetto_Sospeso OR TGT.REVISIONDATE <> SRC.REVISIONDATE OR TGT.REVISIONUSER <> SRC.REVISIONUSER OR TGT.Fornitore_Codice <> SRC.Fornitore_Codice OR TGT.Fornitore_RagioneSociale <> SRC.Fornitore_RagioneSociale OR TGT.Fornitore_Email <> SRC.Fornitore_Email OR TGT.Progetto_CodiceRiferimentoFornitore <> SRC.Progetto_CodiceRiferimentoFornitore OR TGT.Progetto_ProprietaStampo <> SRC.Progetto_ProprietaStampo OR TGT.Progetto_QtaRichiesta <> SRC.Progetto_QtaRichiesta OR TGT.Progetto_Scatola <> SRC.Progetto_Scatola OR TGT.Progetto_QtaMinimaVendita <> SRC.Progetto_QtaMinimaVendita OR TGT.Progetto_NPezziLottoMinimo <> SRC.Progetto_NPezziLottoMinimo OR TGT.Progetto_Costo <> SRC.Progetto_Costo OR TGT.Progetto_Ammortamenti <> SRC.Progetto_Ammortamenti OR TGT.Progetto_CostoUnitario <> SRC.Progetto_CostoUnitario OR TGT.Progetto_IndiceMaggiorazioneCosto <> SRC.Progetto_IndiceMaggiorazioneCosto OR TGT.Progetto_ParzialeCosto <> SRC.Progetto_ParzialeCosto OR TGT.Progetto_AmmortamentoUnitario <> SRC.Progetto_AmmortamentoUnitario OR TGT.Progetto_CostoAmmortamentoUnitario <> SRC.Progetto_CostoAmmortamentoUnitario OR TGT.Progetto_IndiceMaggiorazioneAmmortamento <> SRC.Progetto_IndiceMaggiorazioneAmmortamento OR TGT.Progetto_ParzialeAmmortamento <> SRC.Progetto_ParzialeAmmortamento)
  THEN UPDATE SET TGT.Accessorio_Codice = SRC.Accessorio_Codice, TGT.Progetto_Numero = SRC.Progetto_Numero, TGT.Progetto_Sospeso = SRC.Progetto_Sospeso, TGT.REVISIONDATE = SRC.REVISIONDATE, TGT.REVISIONUSER = SRC.REVISIONUSER, TGT.Fornitore_Codice = SRC.Fornitore_Codice, TGT.Fornitore_RagioneSociale = SRC.Fornitore_RagioneSociale, TGT.Fornitore_Email = SRC.Fornitore_Email, TGT.Progetto_CodiceRiferimentoFornitore = SRC.Progetto_CodiceRiferimentoFornitore, TGT.Progetto_ProprietaStampo = SRC.Progetto_ProprietaStampo, TGT.Progetto_QtaRichiesta = SRC.Progetto_QtaRichiesta, TGT.Progetto_Scatola = SRC.Progetto_Scatola, TGT.Progetto_QtaMinimaVendita = SRC.Progetto_QtaMinimaVendita, TGT.Progetto_NPezziLottoMinimo = SRC.Progetto_NPezziLottoMinimo, TGT.Progetto_Costo = SRC.Progetto_Costo, TGT.Progetto_Ammortamenti = SRC.Progetto_Ammortamenti, TGT.Progetto_CostoUnitario = SRC.Progetto_CostoUnitario, TGT.Progetto_IndiceMaggiorazioneCosto = SRC.Progetto_IndiceMaggiorazioneCosto, TGT.Progetto_ParzialeCosto = SRC.Progetto_ParzialeCosto, TGT.Progetto_AmmortamentoUnitario = SRC.Progetto_AmmortamentoUnitario, TGT.Progetto_CostoAmmortamentoUnitario = SRC.Progetto_CostoAmmortamentoUnitario, TGT.Progetto_IndiceMaggiorazioneAmmortamento = SRC.Progetto_IndiceMaggiorazioneAmmortamento, TGT.Progetto_ParzialeAmmortamento = SRC.Progetto_ParzialeAmmortamento
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Accessorio_Codice, Progetto_Numero, Progetto_Sospeso, REVISIONDATE, REVISIONUSER, Fornitore_Codice, Fornitore_RagioneSociale, Fornitore_Email, Progetto_CodiceRiferimentoFornitore, Progetto_ProprietaStampo, Progetto_QtaRichiesta, Progetto_Scatola, Progetto_QtaMinimaVendita, Progetto_NPezziLottoMinimo, Progetto_Costo, Progetto_Ammortamenti, Progetto_CostoUnitario, Progetto_IndiceMaggiorazioneCosto, Progetto_ParzialeCosto, Progetto_AmmortamentoUnitario, Progetto_CostoAmmortamentoUnitario, Progetto_IndiceMaggiorazioneAmmortamento, Progetto_ParzialeAmmortamento)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MERIDIANSQL.MetraProgettazione_Accessori_Progetti_ProgettoAccessori' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

