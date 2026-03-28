
/**
 * @table METRAPQ.tblControlloProfilatiEstrusi_QuoteRilevate
 * @description 

 * @depends [dbo].tblControlloProfilatiEstrusi_QuoteRilevate

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_QuoteRilevate
*/

CREATE   VIEW METRAPQ.tblControlloProfilatiEstrusi_QuoteRilevateView
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
        T.Revisione,
        T.Descrizione,
        T.QuotaNominale,
        T.TolleranzaLow,
        T.TolleranzaHigh,
        T.uscita1,
        T.uscita2,
        T.uscita3,
        T.uscita4,
        T.uscita5,
        T.uscita6,
        T.uscita7,
        T.uscita8,
        T.uscita9,
        T.uscita10,
        T.uscita11,
        T.uscita12,
        T.condizione,
        T.sequenza,
        T.IDClassificazioneQuota,
        T.tipo,
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
    T.Revisione,
    T.Descrizione,
    T.QuotaNominale,
    T.TolleranzaLow,
    T.TolleranzaHigh,
    T.uscita1,
    T.uscita2,
    T.uscita3,
    T.uscita4,
    T.uscita5,
    T.uscita6,
    T.uscita7,
    T.uscita8,
    T.uscita9,
    T.uscita10,
    T.uscita11,
    T.uscita12,
    T.condizione,
    T.sequenza,
    T.IDClassificazioneQuota,
    T.tipo

FROM (
    SELECT
        ID,
        IDControlloProfilatiEstrusi,
        dataRiferimento,
        QuotaNumero,
        CodiceMetra,
        Revisione,
        Descrizione,
        QuotaNominale,
        TolleranzaLow,
        TolleranzaHigh,
        uscita1,
        uscita2,
        uscita3,
        uscita4,
        uscita5,
        uscita6,
        uscita7,
        uscita8,
        uscita9,
        uscita10,
        uscita11,
        uscita12,
        condizione,
        sequenza,
        IDClassificazioneQuota,
        tipo

    FROM [SQL2014\DB2014].MetraPQ.[dbo].tblControlloProfilatiEstrusi_QuoteRilevate
) T;
GO

