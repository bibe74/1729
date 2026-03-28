
/**
 * @table METRAPQ.tblControlloProfilatiEstrusi_RugositaRilevate
 * @description 

 * @depends [dbo].tblControlloProfilatiEstrusi_RugositaRilevate

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_RugositaRilevate
*/

CREATE   VIEW METRAPQ.tblControlloProfilatiEstrusi_RugositaRilevateView
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
        T.dataRiferimento,
        T.QuotaNumero,
        T.CodiceMetra,
        T.Ra,
        T.Rt,
        T.Rz,
        T.Rmax,
		' '
	))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Attributi
    T.IDControlloProfilatiEstrusi,
    T.dataRiferimento,
    T.QuotaNumero,
    T.CodiceMetra,
    T.Ra,
    T.Rt,
    T.Rz,
    T.Rmax

FROM (
    SELECT
        ID,
        IDControlloProfilatiEstrusi,
        dataRiferimento,
        QuotaNumero,
        CodiceMetra,
        Ra,
        Rt,
        Rz,
        Rmax

    FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_RugositaRilevate
) T;
GO

