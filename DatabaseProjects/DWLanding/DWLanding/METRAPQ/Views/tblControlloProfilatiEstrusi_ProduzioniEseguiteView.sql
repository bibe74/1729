
/**
 * @table METRAPQ.tblControlloProfilatiEstrusi_ProduzioniEseguite
 * @description 

 * @depends [dbo].tblControlloProfilatiEstrusi_ProduzioniEseguite

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_ProduzioniEseguite
*/

CREATE   VIEW METRAPQ.tblControlloProfilatiEstrusi_ProduzioniEseguiteView
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
        T.NumeroOrdine,
        T.RigaOrdine,
        T.NBarreTagliate,
        T.LunghezzaBarre,
		' '
	))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Attributi
    T.IDControlloProfilatiEstrusi,
    T.NumeroOrdine,
    T.RigaOrdine,
    T.NBarreTagliate,
    T.LunghezzaBarre

FROM (
    SELECT
        ID,
        IDControlloProfilatiEstrusi,
        NumeroOrdine,
        RigaOrdine,
        NBarreTagliate,
        LunghezzaBarre

    FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_ProduzioniEseguite
) T;
GO

