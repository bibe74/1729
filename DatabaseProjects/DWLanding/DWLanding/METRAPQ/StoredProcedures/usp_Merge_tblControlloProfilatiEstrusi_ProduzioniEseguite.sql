
CREATE   PROCEDURE METRAPQ.usp_Merge_tblControlloProfilatiEstrusi_ProduzioniEseguite
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO METRAPQ.tblControlloProfilatiEstrusi_ProduzioniEseguite AS TGT
    USING METRAPQ.tblControlloProfilatiEstrusi_ProduzioniEseguiteView AS SRC ON (
         SRC.ID = TGT.ID 
    )

    WHEN MATCHED AND SRC.ChangeHashKey <> TGT.ChangeHashKey
      THEN UPDATE SET TGT.ChangeHashKey = SRC.ChangeHashKey, TGT.UpdateDatetime = SRC.UpdateDatetime, TGT.IsDeleted = SRC.IsDeleted, 
        TGT.IDControlloProfilatiEstrusi = SRC.IDControlloProfilatiEstrusi, TGT.NumeroOrdine = SRC.NumeroOrdine, TGT.RigaOrdine = SRC.RigaOrdine, TGT.NBarreTagliate = SRC.NBarreTagliate, TGT.LunghezzaBarre = SRC.LunghezzaBarre

    WHEN NOT MATCHED BY TARGET
      THEN INSERT (ID, HistoricalHashKey, ChangeHashKey, InsertDatetime, UpdateDatetime, IsDeleted, IDControlloProfilatiEstrusi, NumeroOrdine, RigaOrdine, NBarreTagliate, LunghezzaBarre)
        VALUES (ID, HistoricalHashKey, ChangeHashKey, InsertDatetime, UpdateDatetime, IsDeleted, IDControlloProfilatiEstrusi, NumeroOrdine, RigaOrdine, NBarreTagliate, LunghezzaBarre)

    WHEN NOT MATCHED BY SOURCE AND TGT.IsDeleted = CAST(0 AS BIT)
      THEN UPDATE SET TGT.ChangeHashKey = CONVERT(VARBINARY(32), 0),
        TGT.UpdateDatetime = CURRENT_TIMESTAMP,
        TGT.IsDeleted = CAST(1 AS BIT)
    
    OUTPUT
        CURRENT_TIMESTAMP AS merge_datetime,
        CASE WHEN Inserted.IsDeleted = CAST(1 AS BIT) THEN N'DELETE' ELSE $action END AS merge_action,
        'METRAPQ.tblControlloProfilatiEstrusi_ProduzioniEseguite' AS full_olap_table_name,
         'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
    INTO audit.merge_log_details;

END
GO

