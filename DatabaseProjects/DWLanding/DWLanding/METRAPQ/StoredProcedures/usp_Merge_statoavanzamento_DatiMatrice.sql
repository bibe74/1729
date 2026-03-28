
CREATE PROCEDURE METRAPQ.usp_Merge_statoavanzamento_DatiMatrice
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'METRAPQ.statoavanzamento_DatiMatrice', N'U') IS NULL
BEGIN
	EXEC METRAPQ.usp_Create_statoavanzamento_DatiMatrice;
	EXEC METRAPQ.usp_AddIndexes_statoavanzamento_DatiMatrice;
END;

MERGE INTO METRAPQ.statoavanzamento_DatiMatrice AS TGT
USING METRAPQ.statoavanzamento_DatiMatriceView (nolock) AS SRC
ON SRC.PKDatiMatrice = TGT.PKDatiMatrice
WHEN MATCHED AND (TGT.DataScheda <> SRC.DataScheda OR TGT.CodiceMatrice <> SRC.CodiceMatrice OR TGT.BarraMatrice <> SRC.BarraMatrice OR TGT.IsBenestareInternoMatrice <> SRC.IsBenestareInternoMatrice OR TGT.DataArrivoPrevistoMatrice <> SRC.DataArrivoPrevistoMatrice AND TGT.OrdineMatrice <> SRC.OrdineMatrice)
  THEN UPDATE SET TGT.DataScheda = SRC.DataScheda, TGT.CodiceMatrice = SRC.CodiceMatrice, TGT.BarraMatrice = SRC.BarraMatrice, TGT.CodiceBarraMatrice = SRC.CodiceBarraMatrice, TGT.IsBenestareInternoMatrice = SRC.IsBenestareInternoMatrice, TGT.DataArrivoPrevistoMatrice = SRC.DataArrivoPrevistoMatrice, TGT.OrdineMatrice = SRC.OrdineMatrice
WHEN NOT MATCHED
  THEN INSERT VALUES (PKDatiMatrice, DataScheda, CodiceMatrice, BarraMatrice, CodiceBarraMatrice, IsBenestareInternoMatrice, DataArrivoPrevistoMatrice, OrdineMatrice)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'METRAPQ.statoavanzamento_DatiMatrice' AS full_olap_table_name,
	'PKDatiMatrice = ' + CAST(COALESCE(inserted.PKDatiMatrice, deleted.PKDatiMatrice) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

