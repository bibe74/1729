
/**
 * @table METRAPQ.tblQuoteRichieste_CorticalLayerCianfrini
 * @description 

 * @depends [dbo].tblQuoteRichieste_CorticalLayerCianfrini

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].tblQuoteRichieste_CorticalLayerCianfrini
*/

CREATE   VIEW METRAPQ.tblQuoteRichieste_CorticalLayerCianfriniView
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
        T.IDQuoteRichieste,
        T.Posizione,
        T.Tolleranza,
        T.IDUtente,
        T.DataOraInserimento,
		' '
	))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Attributi
    T.IDQuoteRichieste,
    T.Posizione,
    T.Tolleranza,
    T.IDUtente,
    T.DataOraInserimento

FROM (
    SELECT
        ID,
        IDQuoteRichieste,
        Posizione,
        Tolleranza,
        IDUtente,
        DataOraInserimento

    FROM [SQL2014\DB2014].MetraPQ.[dbo].tblQuoteRichieste_CorticalLayerCianfrini
) T;
GO

