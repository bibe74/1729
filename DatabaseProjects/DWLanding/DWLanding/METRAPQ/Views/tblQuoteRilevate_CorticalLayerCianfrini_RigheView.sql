
/**
 * @table METRAPQ.tblQuoteRilevate_CorticalLayerCianfrini_Righe
 * @description 

 * @depends [dbo].tblQuoteRilevate_CorticalLayerCianfrini_Righe

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].tblQuoteRilevate_CorticalLayerCianfrini_Righe
*/

CREATE   VIEW METRAPQ.tblQuoteRilevate_CorticalLayerCianfrini_RigheView
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
        T.IDTestata,
        T.IDQuoteRilevate,
        T.Posizione,
        T.UrlImmagineMacrografiaTesta,
        T.UrlImmagineMacrografiaCoda,
        T.MisuraTesta,
        T.MisuraCoda,
        T.Tolleranza,
        T.IDUtente,
        T.DataOraInserimento,
		' '
	))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Attributi
    T.IDTestata,
    T.IDQuoteRilevate,
    T.Posizione,
    T.UrlImmagineMacrografiaTesta,
    T.UrlImmagineMacrografiaCoda,
    T.MisuraTesta,
    T.MisuraCoda,
    T.Tolleranza,
    T.IDUtente,
    T.DataOraInserimento

FROM (
    SELECT
        ID,
        IDTestata,
        IDQuoteRilevate,
        Posizione,
        UrlImmagineMacrografiaTesta,
        UrlImmagineMacrografiaCoda,
        MisuraTesta,
        MisuraCoda,
        Tolleranza,
        IDUtente,
        DataOraInserimento

    FROM [SQL2014\DB2014].MetraPQ.[dbo].tblQuoteRilevate_CorticalLayerCianfrini_Righe
) T;
GO

