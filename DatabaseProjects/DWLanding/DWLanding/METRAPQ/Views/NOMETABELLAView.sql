/*

Configurazione prodotto:
- tabella [Quote richieste]

Controllo produzione:
- tabella [Quote rilevate]

Configurazione test Cortical Layer Cianfrini:
- tabella [tblQuoteRichieste_CorticalLayerCianfrini]
- campo chiave [IDQuoteRichieste] in join con [Quote Richieste].[Numero progressivo]

Controllo produzione test Cortical Layer Cianfrini (Testata):
- tabella [tblQuoteRilevate_CorticalLayerCianfrini_Testata]
- campi chiave [IDQuoteRilevate] in join con [Quote Rilevate].[N°]

Controllo produzione test Cortical Layer Cianfrini (Righe):
- tabella: [tblQuoteRilevate_CorticalLayerCianfrini_Righe]
- campi chiave [IDtestata] in join con [tblQuoteRilevate_CorticalLayerCianfrini_Testata].[ID]

Controllo Produzione (clienti):
- tabella: [tblControlloProfilatiEstrusi_Clienti]
- campi chiave: [IDControlloProfilatiEstrusi] in join con [Quote Rilevate].[N°]

Controllo Produzione (Colate):
- tabella: [tblControlloProfilatiEstrusi_Colate]
- campi chiave: [IDControlloProfilatiEstrusi] in join con [Quote Rilevate].[N°]

Controllo Produzione (Produzioni Eseguite):
- tabella: [tblControlloProfilatiEstrusi_ProduzioniEseguite]
- campi chiave: [IDControlloProfilatiEstrusi] in join con [Quote Rilevate].[N°]

Controllo Produzione (Quote Rilevate):
- tabella: [tblControlloProfilatiEstrusi_QuoteRilevate]
- campi chiave: [IDControlloProfilatiEstrusi] in join con [Quote Rilevate].[N°]

Controllo Produzione (Rugosità Rilevate):
- tabella: [tblControlloProfilatiEstrusi_RugositaRilevate]
- campi chiave: [IDControlloProfilatiEstrusi] in join con [Quote Rilevate].[N°]

Controllo Produzione (Test):
- tabella: [tblControlloProfilatiEstrusi_Test]
- campi chiave: [IDControlloProfilatiEstrusi] in join con [Quote Rilevate].[N°]

Controllo Produzione (Trattamento Termico):
- tabella: [tblControlloProfilatiEstrusi_TrattamentoTermico]
- campi chiave: [IDControlloProfilatiEstrusi] in join con [Quote Rilevate].[N°]

Controllo Produzione (Turni):
- tabella: [tblControlloProfilatiEstrusi_Turni]
- campi chiave: [IDControlloProfilatiEstrusi] in join con [Quote Rilevate].[N°]

*/

/**
 * @table METRAPQ.NOMETABELLA
 * @description 

 * @depends [dbo].[Quote Richieste]

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].[Quote Richieste]
*/

CREATE   VIEW METRAPQ.NOMETABELLAView
AS
SELECT
	-- Chiavi
    T.NumeroProgressivo,

    -- Campi per data warehouse
	CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        T.NumeroProgressivo,
		' '
	))) AS HistoricalHashKey,
	CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        T.CodiceMetra,
        T.Revisione,
        T.UltimaModifica,
        T.DataModificaArchivio,
        T.IDClassificazioneProdotto,
        T.Ascona,
        T.Strappo,
        T.Dima,
        T.numeroCassetto,
        T.CertificatiRichiesti,
        T.particolareDiSicurezza,
        T.prodottoStandard,
        T.rullatura,
        T.ControlloUltrasuoni,
        T.marcareBarre,
        T.AssegnareLotto,
        T.NoteRGQ,
        T.SegnalazioniContestazioni,
        T.ScorrimentoT,
        T.NormaTolleranze,
        T.LegaPredefinita,
        T.LegaPredefinita_IDClassificazioneCaratteristiche,
        T.StatoFisicoPredefinito,
        T.StatoFisicoPredefinito_IDClassificazioneCaratteristiche,
        T.DurezzaMaxRichiesta,
        T.DurezzaMaxRichiesta_IDClassificazioneCaratteristiche,
        T.DurezzaMinRichiesta,
        T.DurezzaMinRichiesta_IDClassificazioneCaratteristiche,
        T.RMRichiesto,
        T.RmRichiesto_IDClassificazioneCaratteristiche,
        T.RPRichiesto,
        T.RpRichiesto_IDClassificazioneCaratteristiche,
        T.ARichiesto,
        T.ARichiesto_IDClassificazioneCaratteristiche,
        T.ARichiestoTipo,
        T.RARichiesto,
        T.RaRichiesto_IDClassificazioneCaratteristiche,
        T.RTRichiesto,
        T.RtRichiesto_IDClassificazioneCaratteristiche,
        T.RZRichiesto,
        T.RzRichiesto_IDClassificazioneCaratteristiche,
        T.RMaxRichiesto,
        T.RmaxRichiesto_IDClassificazioneCaratteristiche,
        T.NormaCaratteristicheMeccaniche,
        T.NormaProveDurezza,
        T.NormaProveDiTrazione,
        T.NormaRugosita,
        T.TolleranzaCommercialeDelPesoSup,
        T.TolleranzaCommercialeDelPesoInf,
        T.Sistema,
        T.SistemaID,
        T.Serie,
        T.SerieID,
        T.Commessa,
        T.NumeroCommessa,
        T.NormaProprietaMeccaniche,
        T.OpportunitaNumero,
        T.OpportunitaDescrizione,
        T.OpportunitaIDSaleforce,
        T.TipoDurezza,
		' '
	))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Attributi
    T.CodiceMetra,
    T.Revisione,
    T.UltimaModifica,
    T.DataModificaArchivio,
    T.IDClassificazioneProdotto,
    T.Ascona,
    T.Strappo,
    T.Dima,
    T.numeroCassetto,
    T.CertificatiRichiesti,
    T.particolareDiSicurezza,
    T.prodottoStandard,
    T.rullatura,
    T.ControlloUltrasuoni,
    T.marcareBarre,
    T.AssegnareLotto,
    T.NoteRGQ,
    T.SegnalazioniContestazioni,
    T.ScorrimentoT,
    T.NormaTolleranze,
    T.LegaPredefinita,
    T.LegaPredefinita_IDClassificazioneCaratteristiche,
    T.StatoFisicoPredefinito,
    T.StatoFisicoPredefinito_IDClassificazioneCaratteristiche,
    T.DurezzaMaxRichiesta,
    T.DurezzaMaxRichiesta_IDClassificazioneCaratteristiche,
    T.DurezzaMinRichiesta,
    T.DurezzaMinRichiesta_IDClassificazioneCaratteristiche,
    T.RMRichiesto,
    T.RmRichiesto_IDClassificazioneCaratteristiche,
    T.RPRichiesto,
    T.RpRichiesto_IDClassificazioneCaratteristiche,
    T.ARichiesto,
    T.ARichiesto_IDClassificazioneCaratteristiche,
    T.ARichiestoTipo,
    T.RARichiesto,
    T.RaRichiesto_IDClassificazioneCaratteristiche,
    T.RTRichiesto,
    T.RtRichiesto_IDClassificazioneCaratteristiche,
    T.RZRichiesto,
    T.RzRichiesto_IDClassificazioneCaratteristiche,
    T.RMaxRichiesto,
    T.RmaxRichiesto_IDClassificazioneCaratteristiche,
    T.NormaCaratteristicheMeccaniche,
    T.NormaProveDurezza,
    T.NormaProveDiTrazione,
    T.NormaRugosita,
    T.TolleranzaCommercialeDelPesoSup,
    T.TolleranzaCommercialeDelPesoInf,
    T.Sistema,
    T.SistemaID,
    T.Serie,
    T.SerieID,
    T.Commessa,
    T.NumeroCommessa,
    T.NormaProprietaMeccaniche,
    T.OpportunitaNumero,
    T.OpportunitaDescrizione,
    T.OpportunitaIDSaleforce,
    T.TipoDurezza

FROM (
    SELECT
        [Numero progressivo] AS NumeroProgressivo,
        [Codice Metra] AS CodiceMetra,
        Revisione,
        [Ultima modifica] AS UltimaModifica,
        [Data modifica archivio] AS DataModificaArchivio,
        IDClassificazioneProdotto,
        Ascona,
        Strappo,
        Dima,
        numeroCassetto,
        [Certificati richiesti] AS CertificatiRichiesti,
        particolareDiSicurezza,
        prodottoStandard,
        rullatura,
        [Controllo ultrasuoni] AS ControlloUltrasuoni,
        marcareBarre,
        AssegnareLotto,
        [Note RGQ] AS NoteRGQ,
        [Segnalazioni-contestazioni] AS SegnalazioniContestazioni,
        [Scorrimento T] AS ScorrimentoT,
        [Norma tolleranze] AS NormaTolleranze,
        LegaPredefinita,
        LegaPredefinita_IDClassificazioneCaratteristiche,
        StatoFisicoPredefinito,
        StatoFisicoPredefinito_IDClassificazioneCaratteristiche,
        [Durezza Max richiesta] AS DurezzaMaxRichiesta,
        DurezzaMaxRichiesta_IDClassificazioneCaratteristiche,
        [Durezza min richiesta] AS DurezzaMinRichiesta,
        DurezzaMinRichiesta_IDClassificazioneCaratteristiche,
        [Rm richiesto] AS RMRichiesto,
        RmRichiesto_IDClassificazioneCaratteristiche,
        [Rp richiesto] AS RPRichiesto,
        RpRichiesto_IDClassificazioneCaratteristiche,
        [A richiesto] AS ARichiesto,
        ARichiesto_IDClassificazioneCaratteristiche,
        ARichiestoTipo,
        [Ra richiesto] AS RARichiesto,
        RaRichiesto_IDClassificazioneCaratteristiche,
        [Rt richiesto] AS RTRichiesto,
        RtRichiesto_IDClassificazioneCaratteristiche,
        [Rz richiesto] AS RZRichiesto,
        RzRichiesto_IDClassificazioneCaratteristiche,
        [Rmax richiesto] AS RMaxRichiesto,
        RmaxRichiesto_IDClassificazioneCaratteristiche,
        NormaCaratteristicheMeccaniche,
        NormaProveDurezza,
        NormaProveDiTrazione,
        NormaRugosita,
        TolleranzaCommercialeDelPesoSup,
        TolleranzaCommercialeDelPesoInf,
        Sistema,
        SistemaID,
        Serie,
        SerieID,
        Commessa,
        NumeroCommessa,
        NormaProprietaMeccaniche,
        OpportunitaNumero,
        OpportunitaDescrizione,
        OpportunitaIDSaleforce,
        TipoDurezza

    FROM [SQL2014\DB2014].MetraPQ.[dbo].[Quote Richieste]
) T;
GO

