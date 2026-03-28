
CREATE PROCEDURE IMETPQ.usp_Merge_Segnalazioniecontestazioni_SegnalazioniContestazioni
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'IMETPQ.Segnalazioniecontestazioni_SegnalazioniContestazioni', N'U') IS NULL
BEGIN
    EXEC IMETPQ.usp_Create_Segnalazioniecontestazioni_SegnalazioniContestazioni;
    EXEC IMETPQ.usp_AddIndexes_Segnalazioniecontestazioni_SegnalazioniContestazioni;
END;

TRUNCATE TABLE IMETPQ.Segnalazioniecontestazioni_SegnalazioniContestazioni;

MERGE INTO IMETPQ.Segnalazioniecontestazioni_SegnalazioniContestazioni AS TGT
USING IMETPQ.Segnalazioniecontestazioni_SegnalazioniContestazioniView (nolock) AS SRC
ON SRC.Numero = TGT.Numero
WHEN MATCHED AND (TGT.Data <> SRC.Data OR TGT.codiceCliente <> SRC.codiceCliente OR TGT.[Codice Metra] <> SRC.[Codice Metra] OR TGT.FinituraCodice <> SRC.FinituraCodice OR TGT.LunghezzaBarra <> SRC.LunghezzaBarra OR TGT.CodiceConfigurato <> SRC.CodiceConfigurato OR TGT.[DDT/Fattura n°] <> SRC.[DDT/Fattura n°] OR TGT.del <> SRC.del OR TGT.[Conferma d'ordine] <> SRC.[Conferma d'ordine] OR TGT.[Segnalazione/contestazione] <> SRC.[Segnalazione/contestazione] OR TGT.[Data indagine] <> SRC.[Data indagine] OR TGT.[Data chiusura] <> SRC.[Data chiusura])
  THEN UPDATE SET TGT.Data = SRC.Data, TGT.codiceCliente = SRC.codiceCliente, TGT.[Codice Metra] = SRC.[Codice Metra], TGT.FinituraCodice = SRC.FinituraCodice, TGT.LunghezzaBarra = SRC.LunghezzaBarra, TGT.CodiceConfigurato = SRC.CodiceConfigurato, TGT.[DDT/Fattura n°] = SRC.[DDT/Fattura n°], TGT.del = SRC.del, TGT.[Conferma d'ordine] = SRC.[Conferma d'ordine], TGT.[Segnalazione/contestazione] = SRC.[Segnalazione/contestazione], TGT.[Data indagine] = SRC.[Data indagine], TGT.[Data chiusura] = SRC.[Data chiusura]
WHEN NOT MATCHED
  THEN INSERT VALUES (Numero, Data, codiceCliente, [Codice Metra], FinituraCodice, LunghezzaBarra, CodiceConfigurato, [DDT/Fattura n°], del, [Conferma d'ordine], [Segnalazione/contestazione], [Data indagine], [Data chiusura])
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'IMETPQ.Segnalazioniecontestazioni_SegnalazioniContestazioni' AS full_olap_table_name,
    'Numero = ' + CAST(COALESCE(inserted.Numero, deleted.Numero) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

