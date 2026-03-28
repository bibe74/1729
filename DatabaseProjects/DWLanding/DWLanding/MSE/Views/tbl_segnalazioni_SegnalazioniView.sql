

CREATE VIEW MSE.tbl_segnalazioni_SegnalazioniView
AS
SELECT
    -- Chiavi
    ID,        -- NumeroSegnalazione

    -- Dimensioni
    CONVERT(DATE, data) AS data,        -- DataSegnalazione
    sigla,        -- IDArticolo
    codiceCliente,        -- IDCliente
    bolla_n,        -- NumeroDDT
    CONVERT(DATE, bolla_del) AS bolla_del,        -- DataDDT
    finitura_altro,        -- IDFinitura
    Company,        -- IDAzienda
    CONVERT(DATE, DataChiusuraSegnalazione) AS DataChiusuraSegnalazione,        -- DataChiusura
    NumeroOrdineAX        -- OrdineCliente

FROM [SQL2014\DB2014].MetraSegnalazioniEdilizia.dbo.tbl_segnalazioni;
GO

