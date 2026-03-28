
CREATE PROCEDURE METRAPQ.usp_Merge_FogliodiproduzionegiornalieraFoall_DatiColata
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'METRAPQ.FogliodiproduzionegiornalieraFoall_DatiColata', N'U') IS NULL
BEGIN
 EXEC METRAPQ.usp_Create_FogliodiproduzionegiornalieraFoall_DatiColata;
 EXEC METRAPQ.usp_AddIndexes_FogliodiproduzionegiornalieraFoall_DatiColata;
END;

MERGE INTO METRAPQ.FogliodiproduzionegiornalieraFoall_DatiColata AS TGT
USING METRAPQ.FogliodiproduzionegiornalieraFoall_DatiColataView (nolock) AS SRC
ON SRC.[N° progressivo] = TGT.[N° progressivo]
WHEN MATCHED AND (TGT.Colata <> SRC.Colata OR TGT.DiametroBilletta <> SRC.DiametroBilletta OR TGT.Lega <> SRC.Lega OR TGT.LunghezzaBilletta <> SRC.LunghezzaBilletta OR TGT.PesoTeoricoBilletta <> SRC.PesoTeoricoBilletta)
  THEN UPDATE SET TGT.Colata = SRC.Colata, TGT.DiametroBilletta = SRC.DiametroBilletta, TGT.Lega = SRC.Lega, TGT.LunghezzaBilletta = SRC.LunghezzaBilletta, TGT.PesoTeoricoBilletta = SRC.PesoTeoricoBilletta
WHEN NOT MATCHED
  THEN INSERT VALUES ([N° progressivo], Colata, DiametroBilletta, Lega, LunghezzaBilletta, PesoTeoricoBilletta)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
 CURRENT_TIMESTAMP AS merge_datetime,
 $action AS merge_action,
 'METRAPQ.FogliodiproduzionegiornalieraFoall_DatiColata' AS full_olap_table_name,
 '[N° progressivo] = ' + CAST(COALESCE(inserted.[N° progressivo], deleted.[N° progressivo]) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

