
/**
 * @table METRAPQ.tblControlloProfilatiEstrusi_Colate
 * @description 

 * @depends [dbo].tblControlloProfilatiEstrusi_Colate

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_Colate
*/

CREATE   VIEW METRAPQ.tblControlloProfilatiEstrusi_ColateView
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
        T.Colata,
        T.Lega,
		' '
	))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Attributi
    T.IDControlloProfilatiEstrusi,
    T.Colata,
    T.Lega

FROM (
    SELECT
        ID,
        IDControlloProfilatiEstrusi,
        Colata,
        Lega

    FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_Colate
) T;
GO

