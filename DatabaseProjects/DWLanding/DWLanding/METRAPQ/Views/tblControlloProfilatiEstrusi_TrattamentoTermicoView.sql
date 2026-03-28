
/**
 * @table METRAPQ.tblControlloProfilatiEstrusi_TrattamentoTermico
 * @description 

 * @depends [dbo].tblControlloProfilatiEstrusi_TrattamentoTermico

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_TrattamentoTermico
*/

CREATE   VIEW METRAPQ.tblControlloProfilatiEstrusi_TrattamentoTermicoView
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
        T.NumeroForno,
        T.DataTrattamento,
        T.NumeroInfornata,
        T.ProvaDiPiega,
        T.DurezzaMax,
        T.DurezzaMin,
        T.Durometro,
        T.Rm,
        T.Rp02,
        T.A,
        T.MacchinaTrazione,
        T.operatore,
		' '
	))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Attributi
    T.IDControlloProfilatiEstrusi,
    T.NumeroForno,
    T.DataTrattamento,
    T.NumeroInfornata,
    T.ProvaDiPiega,
    T.DurezzaMax,
    T.DurezzaMin,
    T.Durometro,
    T.Rm,
    T.Rp02,
    T.A,
    T.MacchinaTrazione,
    T.operatore

FROM (
    SELECT
        ID,
        IDControlloProfilatiEstrusi,
        NumeroForno,
        DataTrattamento,
        NumeroInfornata,
        ProvaDiPiega,
        DurezzaMax,
        DurezzaMin,
        Durometro,
        Rm,
        Rp02,
        A,
        MacchinaTrazione,
        operatore

    FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_TrattamentoTermico
) T;
GO

