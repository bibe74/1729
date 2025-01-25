USE FatturaXML;
GO

/*
SET NOEXEC OFF;
--*/ SET NOEXEC ON;
GO

--DELETE FROM XMLFatture.Landing_Fattura;
GO

DECLARE @NumeroFattura NVARCHAR(40) = N'01/2018';
DECLARE @PKLanding_Fattura BIGINT;
DECLARE @PKStaging_FatturaElettronicaHeader BIGINT;

SET @PKLanding_Fattura = NEXT VALUE FOR XMLFatture.seq_Landing_Fattura;
SET @PKStaging_FatturaElettronicaHeader = NEXT VALUE FOR XMLFatture.seq_Staging_FatturaElettronicaHeader;

INSERT INTO XMLFatture.Landing_Fattura
(
    PKLanding_Fattura,
    ChiaveGestionale_CodiceNumerico,
    ChiaveGestionale_CodiceAlfanumerico,
    IsUltimaRevisione
)
VALUES
(   @PKLanding_Fattura,   -- PKLanding_Fattura - bigint
    0,   -- ChiaveGestionale_CodiceNumerico - bigint
    @NumeroFattura, -- ChiaveGestionale_CodiceAlfanumerico - nvarchar(40)
    1 -- IsUltimaRevisione - bit
    );

INSERT INTO XMLFatture.Staging_FatturaElettronicaHeader
(
    PKStaging_FatturaElettronicaHeader,
    PKLanding_Fattura,
    DataInserimento,
    IsValida,
    DataUltimaValidazione,
    DatiTrasmissione_IdTrasmittente_IdPaese,
    DatiTrasmissione_IdTrasmittente_IdCodice,
    DatiTrasmissione_ProgressivoInvio,
    DatiTrasmissione_FormatoTrasmissione,
    DatiTrasmissione_CodiceDestinatario,
    DatiTrasmissione_ContattiTrasmittente_Telefono,
    DatiTrasmissione_ContattiTrasmittente_Email,
    DatiTrasmissione_PECDestinatario,
    CedentePrestatore_DatiAnagrafici_IdFiscaleIVA_IdPaese,
    CedentePrestatore_DatiAnagrafici_IdFiscaleIVA_IdCodice,
    CedentePrestatore_DatiAnagrafici_CodiceFiscale,
    CedentePrestatore_DatiAnagrafici_Anagrafica_Denominazione,
    CedentePrestatore_DatiAnagrafici_Anagrafica_Nome,
    CedentePrestatore_DatiAnagrafici_Anagrafica_Cognome,
    CedentePrestatore_DatiAnagrafici_Anagrafica_Titolo,
    CedentePrestatore_DatiAnagrafici_Anagrafica_CodEORI,
    CedentePrestatore_DatiAnagrafici_AlboProfessionale,
    CedentePrestatore_DatiAnagrafici_ProvinciaAlbo,
    CedentePrestatore_DatiAnagrafici_NumeroIscrizioneAlbo,
    CedentePrestatore_DatiAnagrafici_DataIscrizioneAlbo,
    CedentePrestatore_DatiAnagrafici_RegimeFiscale,
    CedentePrestatore_Sede_Indirizzo,
    CedentePrestatore_Sede_NumeroCivico,
    CedentePrestatore_Sede_CAP,
    CedentePrestatore_Sede_Comune,
    CedentePrestatore_Sede_Provincia,
    CedentePrestatore_Sede_Nazione,
    CedentePrestatore_StabileOrganizzazione_Indirizzo,
    CedentePrestatore_StabileOrganizzazione_NumeroCivico,
    CedentePrestatore_StabileOrganizzazione_CAP,
    CedentePrestatore_StabileOrganizzazione_Comune,
    CedentePrestatore_StabileOrganizzazione_Provincia,
    CedentePrestatore_StabileOrganizzazione_Nazione,
    CedentePrestatore_IscrizioneREA_Ufficio,
    CedentePrestatore_IscrizioneREA_NumeroREA,
    CedentePrestatore_IscrizioneREA_CapitaleSociale,
    CedentePrestatore_IscrizioneREA_SocioUnico,
    CedentePrestatore_IscrizioneREA_StatoLiquidazione,
    CedentePrestatore_Contatti_Telefono,
    CedentePrestatore_Contatti_Fax,
    CedentePrestatore_Contatti_Email,
    CedentePrestatore_RiferimentoAmministrazione,
    RappresentanteFiscale_DatiAnagrafici_IdFiscaleIVA_IdPaese,
    RappresentanteFiscale_DatiAnagrafici_IdFiscaleIVA_IdCodice,
    RappresentanteFiscale_DatiAnagrafici_CodiceFiscale,
    RappresentanteFiscale_Anagrafica_Denominazione,
    RappresentanteFiscale_Anagrafica_Nome,
    RappresentanteFiscale_Anagrafica_Cognome,
    RappresentanteFiscale_Anagrafica_Titolo,
    RappresentanteFiscale_Anagrafica_CodEORI,
    CessionarioCommittente_DatiAnagrafici_IdFiscaleIVA_IdPaese,
    CessionarioCommittente_DatiAnagrafici_IdFiscaleIVA_IdCodice,
    CessionarioCommittente_DatiAnagrafici_CodiceFiscale,
    CessionarioCommittente_Anagrafica_Denominazione,
    CessionarioCommittente_Anagrafica_Nome,
    CessionarioCommittente_Anagrafica_Cognome,
    CessionarioCommittente_Anagrafica_Titolo,
    CessionarioCommittente_Anagrafica_CodEORI,
    CessionarioCommittente_Sede_Indirizzo,
    CessionarioCommittente_Sede_NumeroCivico,
    CessionarioCommittente_Sede_CAP,
    CessionarioCommittente_Sede_Comune,
    CessionarioCommittente_Sede_Provincia,
    CessionarioCommittente_Sede_Nazione,
    CessionarioCommittente_StabileOrganizzazione_Indirizzo,
    CessionarioCommittente_StabileOrganizzazione_NumeroCivico,
    CessionarioCommittente_StabileOrganizzazione_CAP,
    CessionarioCommittente_StabileOrganizzazione_Comune,
    CessionarioCommittente_StabileOrganizzazione_Provincia,
    CessionarioCommittente_StabileOrganizzazione_Nazione,
    CessionarioCommittente_RappresentanteFiscale_IdFiscaleIVA_IdPaese,
    CessionarioCommittente_RappresentanteFiscale_IdFiscaleIVA_IdCodice,
    CessionarioCommittente_RappresentanteFiscale_Denominazione,
    CessionarioCommittente_RappresentanteFiscale_Nome,
    CessionarioCommittente_RappresentanteFiscale_Cognome,
    TerzoIntermediarioOSoggettoEmittente_DatiAnagrafici_IdFiscaleIVA_IdPaese,
    TerzoIntermediarioOSoggettoEmittente_DatiAnagrafici_IdFiscaleIVA_IdCodice,
    TerzoIntermediarioOSoggettoEmittente_DatiAnagrafici_CodiceFiscale,
    TerzoIntermediarioOSoggettoEmittente_Anagrafica_Denominazione,
    TerzoIntermediarioOSoggettoEmittente_Anagrafica_Nome,
    TerzoIntermediarioOSoggettoEmittente_Anagrafica_Cognome,
    TerzoIntermediarioOSoggettoEmittente_Anagrafica_Titolo,
    TerzoIntermediarioOSoggettoEmittente_Anagrafica_CodEORI,
    TerzoIntermediarioOSoggettoEmittente_SoggettoEmittente
)
VALUES
(   @PKStaging_FatturaElettronicaHeader,         -- PKStaging_FatturaElettronicaHeader - bigint
    @PKLanding_Fattura,         -- PKLanding_Fattura - bigint
    CURRENT_TIMESTAMP, -- DataInserimento - date
    0,      -- IsValida - bit
    NULL, -- DataUltimaValidazione - date
    'IT',        -- DatiTrasmissione_IdTrasmittente_IdPaese - char(2)
    N'03366420986',       -- DatiTrasmissione_IdTrasmittente_IdCodice - nvarchar(28)
    @NumeroFattura,       -- DatiTrasmissione_ProgressivoInvio - nvarchar(10)
    'FPR12',        -- DatiTrasmissione_FormatoTrasmissione - char(5)
    N'SN4CSRI',       -- DatiTrasmissione_CodiceDestinatario - nvarchar(7)
    N'',       -- DatiTrasmissione_ContattiTrasmittente_Telefono - nvarchar(12)
    N'',       -- DatiTrasmissione_ContattiTrasmittente_Email - nvarchar(256)
    N'',       -- DatiTrasmissione_PECDestinatario - nvarchar(256)
    'IT',        -- CedentePrestatore_DatiAnagrafici_IdFiscaleIVA_IdPaese - char(2)
    N'03366420986',       -- CedentePrestatore_DatiAnagrafici_IdFiscaleIVA_IdCodice - nvarchar(28)
    N'TRLLRT74B15D918W',       -- CedentePrestatore_DatiAnagrafici_CodiceFiscale - nvarchar(16)
    N'1729 software di Alberto Turelli',       -- CedentePrestatore_DatiAnagrafici_Anagrafica_Denominazione - nvarchar(80)
    N'',       -- CedentePrestatore_DatiAnagrafici_Anagrafica_Nome - nvarchar(60)
    N'',       -- CedentePrestatore_DatiAnagrafici_Anagrafica_Cognome - nvarchar(60)
    N'',       -- CedentePrestatore_DatiAnagrafici_Anagrafica_Titolo - nvarchar(10)
    N'',       -- CedentePrestatore_DatiAnagrafici_Anagrafica_CodEORI - nvarchar(17)
    N'',       -- CedentePrestatore_DatiAnagrafici_AlboProfessionale - nvarchar(60)
    '',        -- CedentePrestatore_DatiAnagrafici_ProvinciaAlbo - char(2)
    N'',       -- CedentePrestatore_DatiAnagrafici_NumeroIscrizioneAlbo - nvarchar(60)
    NULL, -- CedentePrestatore_DatiAnagrafici_DataIscrizioneAlbo - date
    'RF01',        -- CedentePrestatore_DatiAnagrafici_RegimeFiscale - char(4)
    N'via Violino di sopra',       -- CedentePrestatore_Sede_Indirizzo - nvarchar(60)
    N'81',       -- CedentePrestatore_Sede_NumeroCivico - nvarchar(8)
    '25126',         -- CedentePrestatore_Sede_CAP - char(5)
    N'Brescia',       -- CedentePrestatore_Sede_Comune - nvarchar(60)
    'BS',        -- CedentePrestatore_Sede_Provincia - char(2)
    'IT',        -- CedentePrestatore_Sede_Nazione - char(2)
    N'',       -- CedentePrestatore_StabileOrganizzazione_Indirizzo - nvarchar(60)
    N'',       -- CedentePrestatore_StabileOrganizzazione_NumeroCivico - nvarchar(8)
    '',         -- CedentePrestatore_StabileOrganizzazione_CAP - char(5)
    N'',       -- CedentePrestatore_StabileOrganizzazione_Comune - nvarchar(60)
    '',        -- CedentePrestatore_StabileOrganizzazione_Provincia - char(2)
    '',        -- CedentePrestatore_StabileOrganizzazione_Nazione - char(2)
    'BS',        -- CedentePrestatore_IscrizioneREA_Ufficio - char(2)
    N'',       -- CedentePrestatore_IscrizioneREA_NumeroREA - nvarchar(20)
    NULL,      -- CedentePrestatore_IscrizioneREA_CapitaleSociale - decimal(14, 2)
    '',        -- CedentePrestatore_IscrizioneREA_SocioUnico - char(2)
    'LN',        -- CedentePrestatore_IscrizioneREA_StatoLiquidazione - char(2)
    N'',       -- CedentePrestatore_Contatti_Telefono - nvarchar(12)
    N'',       -- CedentePrestatore_Contatti_Fax - nvarchar(12)
    N'',       -- CedentePrestatore_Contatti_Email - nvarchar(256)
    N'',       -- CedentePrestatore_RiferimentoAmministrazione - nvarchar(20)
    '',        -- RappresentanteFiscale_DatiAnagrafici_IdFiscaleIVA_IdPaese - char(2)
    N'',       -- RappresentanteFiscale_DatiAnagrafici_IdFiscaleIVA_IdCodice - nvarchar(28)
    N'',       -- RappresentanteFiscale_DatiAnagrafici_CodiceFiscale - nvarchar(16)
    N'',       -- RappresentanteFiscale_Anagrafica_Denominazione - nvarchar(80)
    N'',       -- RappresentanteFiscale_Anagrafica_Nome - nvarchar(60)
    N'',       -- RappresentanteFiscale_Anagrafica_Cognome - nvarchar(60)
    N'',       -- RappresentanteFiscale_Anagrafica_Titolo - nvarchar(10)
    N'',       -- RappresentanteFiscale_Anagrafica_CodEORI - nvarchar(17)
    'IT',        -- CessionarioCommittente_DatiAnagrafici_IdFiscaleIVA_IdPaese - char(2)
    N'00285030177',       -- CessionarioCommittente_DatiAnagrafici_IdFiscaleIVA_IdCodice - nvarchar(28)
    N'',       -- CessionarioCommittente_DatiAnagrafici_CodiceFiscale - nvarchar(16)
    N'METRA S.P.A.',       -- CessionarioCommittente_Anagrafica_Denominazione - nvarchar(80)
    N'',       -- CessionarioCommittente_Anagrafica_Nome - nvarchar(60)
    N'',       -- CessionarioCommittente_Anagrafica_Cognome - nvarchar(60)
    N'',       -- CessionarioCommittente_Anagrafica_Titolo - nvarchar(10)
    N'',       -- CessionarioCommittente_Anagrafica_CodEORI - nvarchar(17)
    N'via Stacca',       -- CessionarioCommittente_Sede_Indirizzo - nvarchar(60)
    N'1',       -- CessionarioCommittente_Sede_NumeroCivico - nvarchar(8)
    '25050',         -- CessionarioCommittente_Sede_CAP - char(5)
    N'Rodengo Saiano',       -- CessionarioCommittente_Sede_Comune - nvarchar(60)
    'BS',        -- CessionarioCommittente_Sede_Provincia - char(2)
    'IT',        -- CessionarioCommittente_Sede_Nazione - char(2)
    N'',       -- CessionarioCommittente_StabileOrganizzazione_Indirizzo - nvarchar(60)
    N'',       -- CessionarioCommittente_StabileOrganizzazione_NumeroCivico - nvarchar(8)
    '',         -- CessionarioCommittente_StabileOrganizzazione_CAP - char(5)
    N'',       -- CessionarioCommittente_StabileOrganizzazione_Comune - nvarchar(60)
    '',        -- CessionarioCommittente_StabileOrganizzazione_Provincia - char(2)
    '',        -- CessionarioCommittente_StabileOrganizzazione_Nazione - char(2)
    '',        -- CessionarioCommittente_RappresentanteFiscale_IdFiscaleIVA_IdPaese - char(2)
    N'',       -- CessionarioCommittente_RappresentanteFiscale_IdFiscaleIVA_IdCodice - nvarchar(28)
    N'',       -- CessionarioCommittente_RappresentanteFiscale_Denominazione - nvarchar(80)
    N'',       -- CessionarioCommittente_RappresentanteFiscale_Nome - nvarchar(60)
    N'',       -- CessionarioCommittente_RappresentanteFiscale_Cognome - nvarchar(60)
    '',        -- TerzoIntermediarioOSoggettoEmittente_DatiAnagrafici_IdFiscaleIVA_IdPaese - char(2)
    N'',       -- TerzoIntermediarioOSoggettoEmittente_DatiAnagrafici_IdFiscaleIVA_IdCodice - nvarchar(28)
    N'',       -- TerzoIntermediarioOSoggettoEmittente_DatiAnagrafici_CodiceFiscale - nvarchar(16)
    N'',       -- TerzoIntermediarioOSoggettoEmittente_Anagrafica_Denominazione - nvarchar(80)
    N'',       -- TerzoIntermediarioOSoggettoEmittente_Anagrafica_Nome - nvarchar(60)
    N'',       -- TerzoIntermediarioOSoggettoEmittente_Anagrafica_Cognome - nvarchar(60)
    N'',       -- TerzoIntermediarioOSoggettoEmittente_Anagrafica_Titolo - nvarchar(10)
    N'',       -- TerzoIntermediarioOSoggettoEmittente_Anagrafica_CodEORI - nvarchar(17)
    ''         -- TerzoIntermediarioOSoggettoEmittente_SoggettoEmittente - char(2)
    )
