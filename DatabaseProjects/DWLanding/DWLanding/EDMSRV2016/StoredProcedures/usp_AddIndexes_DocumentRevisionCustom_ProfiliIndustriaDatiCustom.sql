
CREATE PROCEDURE EDMSRV2016.usp_AddIndexes_DocumentRevisionCustom_ProfiliIndustriaDatiCustom
AS
BEGIN
SET NOCOUNT ON;

--CREATE NONCLUSTERED INDEX IX_EDMSRV2016_DocumentRevisionCustom_ProfiliIndustriaDatiCustom_c_Profilo_CodiceMatrice_INCLUDE ON [EDMSRV2016].[DocumentRevisionCustom_ProfiliIndustriaDatiCustom] ([c_Profilo_CodiceMatrice]) INCLUDE ([DocumentRevisionID],[c_Cliente_Agente],[c_Progetto_Anno],[c_Profilo_BenestareCampionatur],[c_Profilo_BenestareCampiontura],[c_Profilo_BenestareDisegni],[c_Profilo_BenestareDisegniUten],[c_Profilo_BenestareOfferta],[c_Profilo_BenestareOffertaUten],[c_Profilo_Categoria],[c_Profilo_Codice],[c_Cliente_CodiceCliente],[c_Profilo_CodiceCliente],[c_Profilo_DataConsegnaCampioni],[c_Profilo_DataEffettivaConsegn],[c_Profilo_DataPrevConsegnaCamp],[c_Cliente_ItaliaEstero],[c_Profilo_Lega],[c_Profilo_MotivoEsitoNegativo],[c_Cliente_Nazione],[c_Cliente_NomeCliente],[c_Profilo_NoteResponsabile],[c_Profilo_NoteUT],[c_Progetto_Numero],[c_Profilo_Pressa],[c_Progetto_RicezioneRichiesta],[c_Profilo_SerieID],[c_Profilo_SerieMetra],[c_Profilo_SerieSistema],[c_Profilo_SpedizioneDisegni],[c_Profilo_SpedizioneDisegniUte],[c_Profilo_SpedizioneOfferta],[c_Profilo_SpedizioneOffertaUte],[c_Profilo_Stato],[c_Profilo_StesuraOfferta],[c_Profilo_StesuraOffertaUtente],[c_Profilo_SUDettaglio],[c_Profilo_SUFamiglia],[c_Profilo_SUGruppo],[c_Profilo_SUSettore],[c_Profilo_Tipologia],[c_Profilo_ValutazioneResCom],[c_Profilo_ValutazioneResComUte],[c_Profilo_ValutazioneUT],[c_Profilo_ValutazioneUTUtente],[c_Profilo_IncidenzaCostoMatric],[c_Progetto_OffertaCompleta],[c_Profilo_ValutazioneTecnicaDe],[c_Profilo_ValutazioneTecn_0],[c_Profilo_ValutazioneEstrusion],[c_Profilo_ValutazioneEstr_0],[c_Profilo_BenestareTecnicoGior],[c_Profilo_RitardoConsegnaPrevi],[c_Profilo_Peso],[c_Profilo_Scarto],[c_Profilo_QtaMatriceKG],[c_Profilo_CostoMatrice],[c_Profilo_CostoMatriceCommerci],[c_Profilo_Resa],[c_Profilo_PrezzoVenditaKg]);
CREATE UNIQUE NONCLUSTERED INDEX IX_EDMSRV2016_DocumentRevisionCustom_ProfiliIndustriaDatiCustom_HistoricalHashKey_INCLUDE ON EDMSRV2016.DocumentRevisionCustom_ProfiliIndustriaDatiCustom (HistoricalHashKey) INCLUDE (ChangeHashKey);

END;
GO

