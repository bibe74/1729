
/**
 * @table METRAPQ.tblControlloProfilatiEstrusi_Test
 * @description 

 * @depends [dbo].tblControlloProfilatiEstrusi_Test

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_Test
*/

CREATE   VIEW METRAPQ.tblControlloProfilatiEstrusi_TestView
AS
SELECT
	-- Chiavi
    T.ID,

    -- Campi per data warehouse
	CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        T.ID,
		' '
	))) AS HistoricalHashKey,
	CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        T.IDControlloProfilatiEstrusi,
        T.IDTest,
        T.IDClassificazioneTest,
        T.Metodo,
        T.FrequenzaCampionatura,
        T.FrequenzaProduzione,
        T.CriterioDiAccessibilita,
        T.Note,
        T.DateInsert,
		' '
	))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Attributi
    T.IDControlloProfilatiEstrusi,
    T.IDTest,
    T.IDClassificazioneTest,
    T.Metodo,
    T.FrequenzaCampionatura,
    T.FrequenzaProduzione,
    T.CriterioDiAccessibilita,
    T.Note,
    T.DateInsert

FROM (
    SELECT
        ID,
        IDControlloProfilatiEstrusi,
        IDTest,
        IDClassificazioneTest,
        Metodo,
        FrequenzaCampionatura,
        FrequenzaProduzione,
        CriterioDiAccessibilita,
        Note,
        DateInsert

    FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_Test
) T;
GO

