
CREATE VIEW EDMSRV2016.DocumentRevisionCustom_ProfiliIndustriaDatiCustomView
AS
SELECT
	-- Chiavi
	DRC.DocumentRevisionID,		-- PKProfiliIndustriaDatiCustom

	CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        DRC.DocumentRevisionID,
		' '
    ))) AS HistoricalHashKey,
    CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
		DRC.c_Cliente_Agente,
		DRC.c_Progetto_Anno,
		DRC.c_Profilo_BenestareCampionatur,
		CONVERT(DATE, DRC.c_Profilo_BenestareCampiontura),
		CONVERT(DATE, DRC.c_Profilo_BenestareDisegni),
		DRC.c_Profilo_BenestareDisegni_Ute,
		CONVERT(DATE, DRC.c_Profilo_BenestareOfferta),
		DRC.c_Profilo_BenestareOfferta_Ute,
		DRC.c_Profilo_Categoria,
		DRC.c_Profilo_Codice,
		DRC.c_Cliente_CodiceCliente,
		DRC.c_Profilo_CodiceCliente,
		DRC.c_Profilo_CodiceMatrice,
		CONVERT(DATE, DRC.c_Profilo_DataConsegnaCampioni),
		CONVERT(DATE, DRC.c_Profilo_DataEffettivaConsegn),
		CONVERT(DATE, DRC.c_Profilo_DataPrevConsegnaCamp),
		DRC1.c_Cliente_ItaliaEstero,
		DRC1.c_Profilo_Lega,
		DRC.c_Profilo_Finitura,
		DRC.c_Profilo_FinituraDescrizione,
		DRC.c_Profilo_FinituraCosto,
		DRC.c_Progetto_CantiereDescrizione,
		CONVERT(DATE, DRC.c_Progetto_DataEffettivaFinePr),
		DRC1.c_Profilo_MotivoEsitoNegativo,
		DRC1.c_Cliente_Nazione,
		DRC1.c_Cliente_NomeCliente,
		DRC1.c_Profilo_NoteResponsabile,
		DRC1.c_Profilo_NoteUT,
		DRC1.c_Progetto_Numero,
		DRC1.c_Profilo_Pressa,
		CONVERT(DATE, DRC1.c_Progetto_RicezioneRichiesta),
		DRC1.c_Profilo_SerieID,
		DRC1.c_Profilo_SerieMetra,
		DRC1.c_Profilo_SerieSistema,
		CONVERT(DATE, DRC1.c_Profilo_SpedizioneDisegni),
		DRC1.c_Profilo_SpedizioneDisegni_Ut,
		CONVERT(DATE, DRC1.c_Profilo_SpedizioneOfferta),
		DRC1.c_Profilo_SpedizioneOfferta_Ut,
		DRC1.c_Profilo_Stato,
		CONVERT(DATE, DRC1.c_Profilo_StesuraOfferta),
		DRC1.c_Profilo_StesuraOfferta_Utent,
		DRC1.c_Profilo_SU_Dettaglio,
		DRC1.c_Profilo_SU_Famiglia,
		DRC1.c_Profilo_SU_Gruppo,
		DRC1.c_Profilo_SU_Settore,
		DRC2.c_Profilo_Tipologia,
		DRC1.c_Progetto_RiferimentoRichiest,
		DRC1.c_Progetto_ReferenteCommercial,
		DRC1.c_Progetto_Sospeso,
		CONVERT(DATE, DRC2.c_Profilo_ValutazioneResCom),
		DRC2.c_Profilo_ValutazioneResCom_Ut,
		CONVERT(DATE, DRC2.c_Profilo_ValutazioneUT),
		DRC2.c_Profilo_ValutazioneUT_Utente,
		DRC1.c_Profilo_IncidenzaCostoMatric,
		DRC1.c_Progetto_OffertaCompleta,
		CONVERT(DATE, DRC2.c_Profilo_ValutazioneTecnicaDe),
		DRC2.c_Profilo_ValutazioneTecn_0,
		CONVERT(DATE, DRC2.c_Profilo_ValutazioneEstrusion),
		DRC2.c_Profilo_ValutazioneEstr_0,
		CONVERT(DATE, DRC2.c_Profilo_ValutazioneQA),
		DRC2.c_Profilo_ValutazioneQA_Utente,
		DRC.c_Profilo_DescrizioneExtra1,
		DRC.c_Profilo_DescrizioneExtra2,
		DRC.c_Profilo_DescrizioneExtra3,
		DRC.c_Profilo_DescrizioneExtra4,
		DRC.c_Profilo_CostoExtra1,
		DRC.c_Profilo_CostoExtra2,
		DRC.c_Profilo_CostoExtra3,
		DRC.c_Profilo_CostoExtra4,
        DRC.c_Profilo_CondizioneMatrice,
		DRC.c_Profilo_BenestareTecnicoGior,
		DRC1.c_Profilo_RitardoConsegnaPrevi,
		DRC1.c_Profilo_Peso,
		DRC1.c_Profilo_Scarto,
		DRC1.c_Profilo_QtaMatriceKG,
		DRC.c_Profilo_CostoMatrice,
		DRC.c_Profilo_CostoMatriceCommerci,
		DRC1.c_Profilo_Resa,
		DRC1.c_Profilo_PrezzoVenditaKg,
		DRC1.c_Accessorio_Stato,
		DRC1.c_Custom_SerieID,
		DRC1.c_Custom_SerieMetra,
		DRC1.c_Custom_SerieSistema,
		DRC1.c_Progetto_MacroFamiglia,
		DRC.c_Progetto_Famiglia,
		DRC.c_Accessorio_Guarnizione,
		DRC.c_Fornitore_Codice,
		DRC1.c_Fornitore_RagioneSociale,
		DRC.c_Accessorio_Estruso,
		DRC.c_Accessorio_Codice,
		DRC.c_Accessorio_Descrizione,
		DRC1.c_Progetto_QtaRichiesta,
		DRC1.c_Progetto_SpecificaVendita,
		DRC.c_Progetto_Costo,
		DRC1.c_Accessorio_Materiale,
		DRC1.c_Accessorio_MaterialeComposiz,
		DRC1.c_Accessorio_SpecificaMaterial,
		DRC.c_Accessorio_FinituraSuperific,
		DRC1.c_Accessorio_NoteFinituraSuper,
		DRC2.c_Accessorio_TrattamentoFinitu,
		DRC.c_Accessorio_EstrusoRifer_0,
		DRC.c_Accessorio_EstrusoRifer_1,
		DRC.c_Accessorio_EstrusoRifer_2,
		DRC.c_Accessorio_EstrusoRifer_3,
		CONVERT(DATE, DRC.c_Accessorio_DataAttesaBenesta),
		DRC2.c_Accessorio_UtenteAttesaBenes,
		CONVERT(DATE, DRC.c_Accessorio_DataAttesaCampion),
		DRC2.c_Accessorio_UtenteAttesaCampi,
		CONVERT(DATE, DRC.c_Accessorio_DataBenestareComm),
		DRC2.c_Accessorio_UtenteBenestareCo,
		CONVERT(DATE, DRC.c_Accessorio_DataFineProgetto),
		DRC2.c_Accessorio_UtenteFineProgett,
		CONVERT(DATE, DRC.c_Accessorio_DataRichiestaOffe),
		DRC2.c_Accessorio_UtenteRichiestaOf,
		CONVERT(DATE, DRC.c_Accessorio_DataValutazioneOf),
		DRC2.c_Accessorio_UtenteValutazione,
		DRC1.c_Progetto_SincronizzaAX,
		DRC.c_Cliente_CodiceClienteOrigina,
		DRC1.c_Progetto_Societa,
		DRC.c_Progetto_Ammortamenti,
        DRC1.c_Progetto_ProgettoMaster,
        DRC1.c_Progetto_Lavorazioni,
		' '
    ))) AS ChangeHashKey,

	-- Attributi profili
	DRC.c_Cliente_Agente COLLATE Latin1_General_CI_AS AS c_Cliente_Agente,		-- AgenteMeridian
	DRC.c_Progetto_Anno COLLATE Latin1_General_CI_AS AS c_Progetto_Anno,		-- AnnoCommessa
	DRC.c_Profilo_BenestareCampionatur COLLATE Latin1_General_CI_AS AS c_Profilo_BenestareCampionatur,		-- BenestareCampionatura_Utente
	CONVERT(DATE, DRC.c_Profilo_BenestareCampiontura) AS c_Profilo_BenestareCampiontura,		-- DataBenestareCampionatura
	CONVERT(DATE, DRC.c_Profilo_BenestareDisegni) AS c_Profilo_BenestareDisegni,		-- DataBenestareDisegni
	DRC.c_Profilo_BenestareDisegni_Ute COLLATE Latin1_General_CI_AS AS c_Profilo_BenestareDisegni_Ute,		-- BenestareDisegni_Utente
	CONVERT(DATE, DRC.c_Profilo_BenestareOfferta) AS c_Profilo_BenestareOfferta,		-- DataBenestareOfferta
	DRC.c_Profilo_BenestareOfferta_Ute COLLATE Latin1_General_CI_AS AS c_Profilo_BenestareOfferta_Ute,		-- BenestareOfferta_Utente
	DRC.c_Profilo_Categoria COLLATE Latin1_General_CI_AS AS c_Profilo_Categoria,		-- Categoria
	DRC.c_Profilo_Codice COLLATE Latin1_General_CI_AS AS c_Profilo_Codice,		-- Codice / CodiceProfilo
	DRC.c_Cliente_CodiceCliente COLLATE Latin1_General_CI_AS AS c_Cliente_CodiceCliente,		-- IDClienteMeridian
	DRC.c_Profilo_CodiceCliente COLLATE Latin1_General_CI_AS AS c_Profilo_CodiceCliente,		-- IDCliente
	DRC.c_Profilo_CodiceMatrice COLLATE Latin1_General_CI_AS AS c_Profilo_CodiceMatrice,		-- CodiceMatrice
	CONVERT(DATE, DRC.c_Profilo_DataConsegnaCampioni) AS c_Profilo_DataConsegnaCampioni,		-- DataConsegnaCampioni
	CONVERT(DATE, DRC.c_Profilo_DataEffettivaConsegn) AS c_Profilo_DataEffettivaConsegn,		-- DataEffettivaConsegnaCampioni
	CONVERT(DATE, DRC.c_Profilo_DataPrevConsegnaCamp) AS c_Profilo_DataPrevConsegnaCamp,		-- DataPrevistaConsegnaCampioni
	DRC1.c_Cliente_ItaliaEstero COLLATE Latin1_General_CI_AS AS c_Cliente_ItaliaEstero,		-- GruppoNazionalitaCliente
	DRC1.c_Profilo_Lega COLLATE Latin1_General_CI_AS AS c_Profilo_Lega,		-- Lega
	DRC.c_Profilo_Finitura COLLATE Latin1_General_CI_AS AS c_Profilo_Finitura,		-- Finitura
	DRC.c_Profilo_FinituraDescrizione COLLATE Latin1_General_CI_AS AS c_Profilo_FinituraDescrizione,		-- FinituraDescrizione
	DRC.c_Profilo_FinituraCosto,		-- FinituraCosto
	DRC.c_Progetto_CantiereDescrizione COLLATE Latin1_General_CI_AS AS c_Progetto_CantiereDescrizione,		-- CantiereDescrizione
	CONVERT(DATE, DRC.c_Progetto_DataEffettivaFinePr) AS c_Progetto_DataEffettivaFinePr,		-- DataFineProgetto
	DRC1.c_Profilo_MotivoEsitoNegativo COLLATE Latin1_General_CI_AS AS c_Profilo_MotivoEsitoNegativo,		-- MotivoEsitoNegativo
	DRC1.c_Cliente_Nazione COLLATE Latin1_General_CI_AS AS c_Cliente_Nazione,		-- NazioneCliente
	DRC1.c_Cliente_NomeCliente COLLATE Latin1_General_CI_AS AS c_Cliente_NomeCliente,		-- ClienteMeridian
	DRC1.c_Profilo_NoteResponsabile COLLATE Latin1_General_CI_AS AS c_Profilo_NoteResponsabile,		-- NoteResponsabile
	DRC1.c_Profilo_NoteUT COLLATE Latin1_General_CI_AS AS c_Profilo_NoteUT,		-- NoteUT
	DRC1.c_Progetto_Numero COLLATE Latin1_General_CI_AS AS c_Progetto_Numero,		-- Commessa
	DRC1.c_Profilo_Pressa COLLATE Latin1_General_CI_AS AS c_Profilo_Pressa,		-- Pressa
	CONVERT(DATE, DRC1.c_Progetto_RicezioneRichiesta) AS c_Progetto_RicezioneRichiesta,		-- DataRicezioneRichiesta
	DRC1.c_Profilo_SerieID COLLATE Latin1_General_CI_AS AS c_Profilo_SerieID,		-- IDSerie
	DRC1.c_Profilo_SerieMetra COLLATE Latin1_General_CI_AS AS c_Profilo_SerieMetra,		-- SerieMetra
	DRC1.c_Profilo_SerieSistema COLLATE Latin1_General_CI_AS AS c_Profilo_SerieSistema,		-- SerieSistema
	CONVERT(DATE, DRC1.c_Profilo_SpedizioneDisegni) AS c_Profilo_SpedizioneDisegni,		-- DataSpedizioneDisegni
	DRC1.c_Profilo_SpedizioneDisegni_Ut COLLATE Latin1_General_CI_AS AS c_Profilo_SpedizioneDisegni_Ut,		-- SpedizioneDisegni_Utente
	CONVERT(DATE, DRC1.c_Profilo_SpedizioneOfferta) AS c_Profilo_SpedizioneOfferta,		-- DataSpedizioneOfferta
	DRC1.c_Profilo_SpedizioneOfferta_Ut COLLATE Latin1_General_CI_AS AS c_Profilo_SpedizioneOfferta_Ut,		-- SpedizioneOfferta_Utente
	DRC1.c_Profilo_Stato COLLATE Latin1_General_CI_AS AS c_Profilo_Stato,		-- Stato
	CONVERT(DATE, DRC1.c_Profilo_StesuraOfferta) AS c_Profilo_StesuraOfferta,		-- DataStesuraOfferta
	DRC1.c_Profilo_StesuraOfferta_Utent COLLATE Latin1_General_CI_AS AS c_Profilo_StesuraOfferta_Utent,		-- StesuraOfferta_Utente
	DRC1.c_Profilo_SU_Dettaglio COLLATE Latin1_General_CI_AS AS c_Profilo_SU_Dettaglio,		-- Dettaglio
	DRC1.c_Profilo_SU_Famiglia COLLATE Latin1_General_CI_AS AS c_Profilo_SU_Famiglia,		-- Famiglia
	DRC1.c_Profilo_SU_Gruppo COLLATE Latin1_General_CI_AS AS c_Profilo_SU_Gruppo,		-- Gruppo
	DRC1.c_Profilo_SU_Settore COLLATE Latin1_General_CI_AS AS c_Profilo_SU_Settore,		-- Settore
	DRC2.c_Profilo_Tipologia COLLATE Latin1_General_CI_AS AS c_Profilo_Tipologia,		-- Tipologia
	DRC1.c_Progetto_RiferimentoRichiest COLLATE	Latin1_General_CI_AS AS c_Progetto_RiferimentoRichiest, -- RiferimentoRichiesta
	DRC1.c_Progetto_ReferenteCommercial COLLATE Latin1_General_CI_AS AS c_Progetto_ReferenteCommercial, -- CommercialeInterno
	DRC1.c_Progetto_Sospeso, -- IsSospeso
	CONVERT(DATE, DRC2.c_Profilo_ValutazioneResCom) AS c_Profilo_ValutazioneResCom,		-- DataValutazioneResponsabileCommerciale
	DRC2.c_Profilo_ValutazioneResCom_Ut COLLATE Latin1_General_CI_AS AS c_Profilo_ValutazioneResCom_Ut,		-- ValutazioneResponsabileCommerciale_Utente
	CONVERT(DATE, DRC2.c_Profilo_ValutazioneUT) AS c_Profilo_ValutazioneUT,		-- DataValutazioneUT
	DRC2.c_Profilo_ValutazioneUT_Utente COLLATE Latin1_General_CI_AS AS c_Profilo_ValutazioneUT_Utente,		-- ValutazioneUT_Utente
	DRC1.c_Profilo_IncidenzaCostoMatric,		-- IncidenzaCostoMatrice
	DRC1.c_Progetto_OffertaCompleta,		-- IsOffertaCompleta
	CONVERT(DATE, DRC2.c_Profilo_ValutazioneTecnicaDe) AS c_Profilo_ValutazioneTecnicaDe,		-- DataValutazioneTecnicaDefinitiva
	DRC2.c_Profilo_ValutazioneTecn_0 COLLATE Latin1_General_CI_AS AS c_Profilo_ValutazioneTecn_0,		-- ValutazioneTecnicaDefinitiva_Utente
	CONVERT(DATE, DRC2.c_Profilo_ValutazioneEstrusion) AS c_Profilo_ValutazioneEstrusion,		-- DataValutazioneEstrusione
	DRC2.c_Profilo_ValutazioneEstr_0 COLLATE Latin1_General_CI_AS AS c_Profilo_ValutazioneEstr_0,		-- ValutazioneEstrusione_Utente
	CONVERT(DATE, DRC2.c_Profilo_ValutazioneQA) AS c_Profilo_ValutazioneQA, -- DataValutazioneQA
	DRC2.c_Profilo_ValutazioneQA_Utente COLLATE Latin1_General_CI_AS AS c_Profilo_ValutazioneQA_Utente, -- ValutazioneQA_Utente
	DRC.c_Profilo_DescrizioneExtra1 COLLATE Latin1_General_CI_AS AS c_Profilo_DescrizioneExtra1, -- DescrizioneExtra1
	DRC.c_Profilo_DescrizioneExtra2 COLLATE Latin1_General_CI_AS AS c_Profilo_DescrizioneExtra2, -- DescrizioneExtra2
	DRC.c_Profilo_DescrizioneExtra3 COLLATE Latin1_General_CI_AS AS c_Profilo_DescrizioneExtra3, -- DescrizioneExtra3
	DRC.c_Profilo_DescrizioneExtra4 COLLATE Latin1_General_CI_AS AS c_Profilo_DescrizioneExtra4, -- DescrizioneExtra4
	DRC.c_Profilo_CostoExtra1, -- CostoExtra1
	DRC.c_Profilo_CostoExtra2, -- CostoExtra2
	DRC.c_Profilo_CostoExtra3, -- CostoExtra3
	DRC.c_Profilo_CostoExtra4, -- CostoExtra4
    DRC.c_Profilo_CondizioneMatrice COLLATE Latin1_General_CI_AS AS c_Profilo_CondizioneMatrice, -- CondizioneMatrice

	-- Misure profili
	DRC.c_Profilo_BenestareTecnicoGior,		-- GiorniBenestareTecnico
	DRC1.c_Profilo_RitardoConsegnaPrevi,		-- GiorniRitardoConsegnaPrevista
	DRC1.c_Profilo_Peso,		-- Peso
	DRC1.c_Profilo_Scarto,		-- ScartoKg
	DRC1.c_Profilo_QtaMatriceKG,		-- QtaMatriceKg
	DRC.c_Profilo_CostoMatrice,		-- CostoMatrice
	DRC.c_Profilo_CostoMatriceCommerci,		-- CostoMatriceCommerciale
	DRC1.c_Profilo_Resa,		-- Resa
	DRC1.c_Profilo_PrezzoVenditaKg,		-- PrezzoVenditaKg

	-- Attributi accessori
	DRC1.c_Accessorio_Stato COLLATE Latin1_General_CI_AS AS c_Accessorio_Stato, -- StatoAccessorio
	DRC1.c_Custom_SerieID COLLATE Latin1_General_CI_AS AS c_Custom_SerieID, -- CodiceSerie
	DRC1.c_Custom_SerieMetra COLLATE Latin1_General_CI_AS AS c_Custom_SerieMetra, -- Serie
	DRC1.c_Custom_SerieSistema COLLATE Latin1_General_CI_AS AS c_Custom_SerieSistema, -- Sistema
	DRC1.c_Progetto_MacroFamiglia COLLATE Latin1_General_CI_AS AS c_Progetto_MacroFamiglia, -- MacroFamiglia
	DRC.c_Progetto_Famiglia COLLATE Latin1_General_CI_AS AS c_Progetto_Famiglia, -- Famiglia
	DRC.c_Accessorio_Guarnizione, -- IsGuarnizione
	DRC.c_Fornitore_Codice COLLATE Latin1_General_CI_AS AS c_Fornitore_Codice, -- CodiceFornitore
	DRC1.c_Fornitore_RagioneSociale COLLATE Latin1_General_CI_AS AS c_Fornitore_RagioneSociale, -- Fornitore
	DRC.c_Accessorio_Estruso, -- IsEstrusoContoLavorazione
	DRC.c_Accessorio_Codice COLLATE Latin1_General_CI_AS AS c_Accessorio_Codice, -- Codice / CodiceAccessorio
	DRC.c_Accessorio_Descrizione COLLATE Latin1_General_CI_AS AS c_Accessorio_Descrizione, -- Descrizione
	DRC1.c_Progetto_QtaRichiesta COLLATE Latin1_General_CI_AS AS c_Progetto_QtaRichiesta, -- QtaRichiestaConsumo
	DRC1.c_Progetto_SpecificaVendita COLLATE Latin1_General_CI_AS AS c_Progetto_SpecificaVendita, -- SpecificaDiVendita
	DRC.c_Progetto_Costo, -- PrezzoAcquisto
	DRC1.c_Accessorio_Materiale COLLATE Latin1_General_CI_AS AS c_Accessorio_Materiale, -- Materiale
	DRC1.c_Accessorio_MaterialeComposiz COLLATE Latin1_General_CI_AS AS c_Accessorio_MaterialeComposiz, -- MaterialeComposizione
	DRC1.c_Accessorio_SpecificaMaterial COLLATE Latin1_General_CI_AS AS c_Accessorio_SpecificaMaterial, -- MaterialeSpecifica
	DRC.c_Accessorio_FinituraSuperific COLLATE Latin1_General_CI_AS AS c_Accessorio_FinituraSuperific, -- Finitura
	DRC1.c_Accessorio_NoteFinituraSuper COLLATE Latin1_General_CI_AS AS c_Accessorio_NoteFinituraSuper, -- FinituraNote
	DRC2.c_Accessorio_TrattamentoFinitu COLLATE Latin1_General_CI_AS AS c_Accessorio_TrattamentoFinitu, -- Trattamento
	DRC.c_Accessorio_EstrusoRifer_0 COLLATE Latin1_General_CI_AS AS c_Accessorio_EstrusoRifer_0, -- Estruso1
	DRC.c_Accessorio_EstrusoRifer_1 COLLATE Latin1_General_CI_AS AS c_Accessorio_EstrusoRifer_1, -- Estruso2
	DRC.c_Accessorio_EstrusoRifer_2 COLLATE Latin1_General_CI_AS AS c_Accessorio_EstrusoRifer_2, -- Estruso3
	DRC.c_Accessorio_EstrusoRifer_3 COLLATE Latin1_General_CI_AS AS c_Accessorio_EstrusoRifer_3, -- Estruso4
	CONVERT(DATE, DRC.c_Accessorio_DataAttesaBenesta) AS c_Accessorio_DataAttesaBenesta, -- DataAttesaBenestareTecnico
	DRC2.c_Accessorio_UtenteAttesaBenes COLLATE Latin1_General_CI_AS AS c_Accessorio_UtenteAttesaBenes, -- UtenteAttesaBenestareTecnico
	CONVERT(DATE, DRC.c_Accessorio_DataAttesaCampion) AS c_Accessorio_DataAttesaCampion, -- DataAttesaCampionaturaFornitore
	DRC2.c_Accessorio_UtenteAttesaCampi COLLATE Latin1_General_CI_AS AS c_Accessorio_UtenteAttesaCampi, -- UtenteAttesaCampionaturaFornitore
	CONVERT(DATE, DRC.c_Accessorio_DataBenestareComm) AS c_Accessorio_DataBenestareComm, -- DataBenestareCommerciale
	DRC2.c_Accessorio_UtenteBenestareCo COLLATE Latin1_General_CI_AS AS c_Accessorio_UtenteBenestareCo, -- UtenteBenestareCommerciale
	CONVERT(DATE, DRC.c_Accessorio_DataFineProgetto) AS c_Accessorio_DataFineProgetto, -- DataFineProgetto
	DRC2.c_Accessorio_UtenteFineProgett COLLATE Latin1_General_CI_AS AS c_Accessorio_UtenteFineProgett, -- UtenteFineProgetto
	CONVERT(DATE, DRC.c_Accessorio_DataRichiestaOffe) AS c_Accessorio_DataRichiestaOffe, -- DataRichiestaOfferta
	DRC2.c_Accessorio_UtenteRichiestaOf COLLATE Latin1_General_CI_AS AS c_Accessorio_UtenteRichiestaOf, -- UtenteRichiestaOfferta
	CONVERT(DATE, DRC.c_Accessorio_DataValutazioneOf) AS c_Accessorio_DataValutazioneOf, -- DataValutazioneOfferta
	DRC2.c_Accessorio_UtenteValutazione COLLATE Latin1_General_CI_AS AS c_Accessorio_UtenteValutazione, -- UtenteValutazioneOfferta
	DRC1.c_Progetto_SincronizzaAX, -- IsSincronizzaAX
	DRC.c_Cliente_CodiceClienteOrigina COLLATE Latin1_General_CI_AS AS c_Cliente_CodiceClienteOriginario, -- IDClienteOriginario
	DRC1.c_Progetto_Societa COLLATE Latin1_General_CI_AS AS c_Progetto_Societa, -- IDAziendaProgetto
    DRC1.c_Progetto_ProgettoMaster COLLATE Latin1_General_CI_AS AS c_Progetto_ProgettoMaster, -- IDCommessaMaster

	-- Misure accessori
	DRC.c_Progetto_Ammortamenti -- CostoAttrezzatura

    , DRC1.c_Progetto_Lavorazioni

FROM EDMSRV2016.BCRepository.dbo.DocumentRevisionCustom DRC
INNER JOIN EDMSRV2016.BCRepository.dbo.DocumentRevisionCustom1 DRC1 ON DRC1.DocumentRevisionID = DRC.DocumentRevisionID
INNER JOIN EDMSRV2016.BCRepository.dbo.DocumentRevisionCustom2 DRC2 ON DRC2.DocumentRevisionID = DRC.DocumentRevisionID;
GO

