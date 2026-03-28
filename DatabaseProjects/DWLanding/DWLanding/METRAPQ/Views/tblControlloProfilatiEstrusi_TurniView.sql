
/**
 * @table METRAPQ.tblControlloProfilatiEstrusi_Turni
 * @description 

 * @depends [dbo].tblControlloProfilatiEstrusi_Turni

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_Turni
*/

CREATE   VIEW METRAPQ.tblControlloProfilatiEstrusi_TurniView
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
        T.Turno,
        T.CodiceTurno,
        T.CapoPressa,
        T.ResponsabileDiLinea,
		' '
	))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Attributi
    T.IDControlloProfilatiEstrusi,
    T.Turno,
    T.CodiceTurno,
    T.CapoPressa,
    T.ResponsabileDiLinea

FROM (
    SELECT
        ID,
        IDControlloProfilatiEstrusi,
        Turno,
        CodiceTurno,
        CapoPressa,
        ResponsabileDiLinea

    FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_Turni
) T;
GO

