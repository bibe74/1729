
CREATE   PROCEDURE METRAPQ.usp_Merge_tblControlloProfilatiEstrusi_Turni
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO METRAPQ.tblControlloProfilatiEstrusi_Turni AS TGT
    USING METRAPQ.tblControlloProfilatiEstrusi_TurniView AS SRC ON (
         SRC.ID = TGT.ID 
    )

    WHEN MATCHED AND SRC.ChangeHashKey <> TGT.ChangeHashKey
      THEN UPDATE SET TGT.ChangeHashKey = SRC.ChangeHashKey, TGT.UpdateDatetime = SRC.UpdateDatetime, TGT.IsDeleted = SRC.IsDeleted, 
        TGT.IDControlloProfilatiEstrusi = SRC.IDControlloProfilatiEstrusi, TGT.Turno = SRC.Turno, TGT.CodiceTurno = SRC.CodiceTurno, TGT.CapoPressa = SRC.CapoPressa, TGT.ResponsabileDiLinea = SRC.ResponsabileDiLinea

    WHEN NOT MATCHED BY TARGET
      THEN INSERT (ID, HistoricalHashKey, ChangeHashKey, InsertDatetime, UpdateDatetime, IsDeleted, IDControlloProfilatiEstrusi, Turno, CodiceTurno, CapoPressa, ResponsabileDiLinea)
        VALUES (ID, HistoricalHashKey, ChangeHashKey, InsertDatetime, UpdateDatetime, IsDeleted, IDControlloProfilatiEstrusi, Turno, CodiceTurno, CapoPressa, ResponsabileDiLinea)

    WHEN NOT MATCHED BY SOURCE AND TGT.IsDeleted = CAST(0 AS BIT)
      THEN UPDATE SET TGT.ChangeHashKey = CONVERT(VARBINARY(32), 0),
        TGT.UpdateDatetime = CURRENT_TIMESTAMP,
        TGT.IsDeleted = CAST(1 AS BIT)
    
    OUTPUT
        CURRENT_TIMESTAMP AS merge_datetime,
        CASE WHEN Inserted.IsDeleted = CAST(1 AS BIT) THEN N'DELETE' ELSE $action END AS merge_action,
        'METRAPQ.tblControlloProfilatiEstrusi_Turni' AS full_olap_table_name,
         'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
    INTO audit.merge_log_details;

END
GO

