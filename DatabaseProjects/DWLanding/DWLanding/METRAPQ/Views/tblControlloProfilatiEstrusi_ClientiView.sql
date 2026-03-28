
/**
 * @table METRAPQ.tblControlloProfilatiEstrusi_Clienti
 * @description 

 * @depends [dbo].tblControlloProfilatiEstrusi_Clienti

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_Clienti
*/

CREATE   VIEW METRAPQ.tblControlloProfilatiEstrusi_ClientiView
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
        T.CodiceCliente,
        T.Cliente,
        T.LegaTrattamento,
        T.Trattamento,
		' '
	))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Attributi
    T.IDControlloProfilatiEstrusi,
    T.CodiceCliente,
    T.Cliente,
    T.LegaTrattamento,
    T.Trattamento

FROM (
    SELECT
        ID,
        IDControlloProfilatiEstrusi,
        CodiceCliente,
        Cliente,
        LegaTrattamento,
        Trattamento

    FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_Clienti
) T;
GO

