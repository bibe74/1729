
CREATE VIEW RAGUSAPQ.Segnalazioniecontestazioni_SegnalazioniContestazioniView
AS
SELECT
    -- Chiavi
    Numero,        -- NumeroSegnalazione

    -- Dimensioni
    CONVERT(DATE, Data) AS Data,        -- DataSegnalazione
    codiceCliente,        -- IDCliente
    [Codice Metra],        -- IDArticolo
    FinituraCodice,        -- IDFinitura
    LunghezzaBarra,        -- LunghezzaBarra
    CodiceConfigurato,        -- IDArticoloConfigurato
    [DDT/Fattura n°],        -- NumeroDocumento
    CONVERT(DATE, del) AS del,        -- DataDocumento
    [Conferma d'ordine],        -- OrdineCliente
    [Segnalazione/contestazione],        -- TipoSegnalazione
    CONVERT(DATE, [Data indagine]) AS [Data indagine],        -- DataIndagine
    CONVERT(DATE, [Data chiusura]) AS [Data chiusura]        -- DataChiusura

FROM [SQL2014MRAG\DB2014].MetraPQ.[dbo].[Segnalazioni e contestazioni];
GO

