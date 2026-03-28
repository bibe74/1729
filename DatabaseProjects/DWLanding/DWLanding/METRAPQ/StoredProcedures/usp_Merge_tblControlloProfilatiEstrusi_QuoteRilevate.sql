
CREATE   PROCEDURE METRAPQ.usp_Merge_tblControlloProfilatiEstrusi_QuoteRilevate
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO METRAPQ.tblControlloProfilatiEstrusi_QuoteRilevate AS TGT
    USING METRAPQ.tblControlloProfilatiEstrusi_QuoteRilevateView AS SRC ON (
         SRC.ID = TGT.ID 
    )

    WHEN MATCHED AND SRC.ChangeHashKey <> TGT.ChangeHashKey
      THEN UPDATE SET TGT.ChangeHashKey = SRC.ChangeHashKey, TGT.UpdateDatetime = SRC.UpdateDatetime, TGT.IsDeleted = SRC.IsDeleted, 
        TGT.IDControlloProfilatiEstrusi = SRC.IDControlloProfilatiEstrusi, TGT.dataRiferimento = SRC.dataRiferimento, TGT.QuotaNumero = SRC.QuotaNumero, TGT.CodiceMetra = SRC.CodiceMetra, TGT.Revisione = SRC.Revisione, TGT.Descrizione = SRC.Descrizione, TGT.QuotaNominale = SRC.QuotaNominale, TGT.TolleranzaLow = SRC.TolleranzaLow, TGT.TolleranzaHigh = SRC.TolleranzaHigh, TGT.uscita1 = SRC.uscita1, TGT.uscita2 = SRC.uscita2, TGT.uscita3 = SRC.uscita3, TGT.uscita4 = SRC.uscita4, TGT.uscita5 = SRC.uscita5, TGT.uscita6 = SRC.uscita6, TGT.uscita7 = SRC.uscita7, TGT.uscita8 = SRC.uscita8, TGT.uscita9 = SRC.uscita9, TGT.uscita10 = SRC.uscita10, TGT.uscita11 = SRC.uscita11, TGT.uscita12 = SRC.uscita12, TGT.condizione = SRC.condizione, TGT.sequenza = SRC.sequenza, TGT.IDClassificazioneQuota = SRC.IDClassificazioneQuota, TGT.tipo = SRC.tipo

    WHEN NOT MATCHED BY TARGET
      THEN INSERT (ID, HistoricalHashKey, ChangeHashKey, InsertDatetime, UpdateDatetime, IsDeleted, IDControlloProfilatiEstrusi, dataRiferimento, QuotaNumero, CodiceMetra, Revisione, Descrizione, QuotaNominale, TolleranzaLow, TolleranzaHigh, uscita1, uscita2, uscita3, uscita4, uscita5, uscita6, uscita7, uscita8, uscita9, uscita10, uscita11, uscita12, condizione, sequenza, IDClassificazioneQuota, tipo)
        VALUES (ID, HistoricalHashKey, ChangeHashKey, InsertDatetime, UpdateDatetime, IsDeleted, IDControlloProfilatiEstrusi, dataRiferimento, QuotaNumero, CodiceMetra, Revisione, Descrizione, QuotaNominale, TolleranzaLow, TolleranzaHigh, uscita1, uscita2, uscita3, uscita4, uscita5, uscita6, uscita7, uscita8, uscita9, uscita10, uscita11, uscita12, condizione, sequenza, IDClassificazioneQuota, tipo)

    WHEN NOT MATCHED BY SOURCE AND TGT.IsDeleted = CAST(0 AS BIT)
      THEN UPDATE SET TGT.ChangeHashKey = CONVERT(VARBINARY(32), 0),
        TGT.UpdateDatetime = CURRENT_TIMESTAMP,
        TGT.IsDeleted = CAST(1 AS BIT)
    
    OUTPUT
        CURRENT_TIMESTAMP AS merge_datetime,
        CASE WHEN Inserted.IsDeleted = CAST(1 AS BIT) THEN N'DELETE' ELSE $action END AS merge_action,
        'METRAPQ.tblControlloProfilatiEstrusi_QuoteRilevate' AS full_olap_table_name,
         'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
    INTO audit.merge_log_details;

END
GO

