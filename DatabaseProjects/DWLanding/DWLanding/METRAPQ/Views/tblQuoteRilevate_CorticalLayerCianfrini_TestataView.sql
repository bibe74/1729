
/**
 * @table METRAPQ.tblQuoteRilevate_CorticalLayerCianfrini_Testata
 * @description 

 * @depends [dbo].tblQuoteRilevate_CorticalLayerCianfrini_Testata

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].tblQuoteRilevate_CorticalLayerCianfrini_Testata
*/

CREATE   VIEW METRAPQ.tblQuoteRilevate_CorticalLayerCianfrini_TestataView
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
        T.IDQuoteRilevate,
        T.urlDisegnoTecnicoPosizioni,
        T.CodiceArticolo,
        T.DataOraInserimento,
        T.IDUtente,
		' '
	))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Attributi
    T.IDQuoteRilevate,
    T.urlDisegnoTecnicoPosizioni,
    T.CodiceArticolo,
    T.DataOraInserimento,
    T.IDUtente

FROM (
    SELECT
        ID,
        IDQuoteRilevate,
        urlDisegnoTecnicoPosizioni,
        CodiceArticolo,
        DataOraInserimento,
        IDUtente

    FROM [SQL2014\DB2014].MetraPQ.[dbo].tblQuoteRilevate_CorticalLayerCianfrini_Testata
) T;
GO

