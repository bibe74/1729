
CREATE VIEW AX2009.NPOSTRUCTURALITEMIDSETUPTABLE_ArticoloImpostazioniProfiliView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    ITEMID,        -- IDArticoloConfigurato
    RECID,        -- PKArticoloImpostazioniProfili

    -- Dimensioni
    STRUCTURALITEMTYPE,        -- IDTipoProfilo [enum NPOStructuralTypeItemId]
    MNGTYPE,        -- IDTipoGestione [enum NPOMngTypeId]
    SECTORTYPE,        -- IDTipoSettore [enum NPOSectorTypeId]
    SERIESID,        -- IDSerie
    CATEGORYID,        -- IDCategoria
    PERIMETER,        -- Perimetro
    AREA,        -- Area
    DIAMETER,        -- Diametro
    ROLLING,        -- IsRolling
    TEAROFFSTRIP,        -- IsStrappo
    SECURITY,        -- IsParticolareDiSicurezza
    ALLOYID,        -- IDLega
    CUSTACCOUNT,        -- IDClienteMatrice
    PHYSICALSTATEALLOYID,        -- IDStatoFisico
    MAXLENGTH,        -- LunghezzaMassima
    MINLENGTH,        -- LunghezzaMinima
    STANDARDLENGTH,        -- LunghezzaStandard
    NOSTDQTYLEADTIME,        -- LeadTimeQtaNoStandard
    STRUCTURALWEIGHT,        -- PesoAlMetroLineare
    MAXQUANTITY,        -- QtaNoStandard
    MINQUANTITY,        -- QtaMinimaEstrusione
    USEDINCATALOG,        -- IsPresenteACatalogo
    MERIDIANNUMBER,        -- NumeroCommessaMeridian
    STRUCTURALGLAZING,        -- HasIncollaggioStrutturale
    ASSEMBLYPASSES,        -- NumeroPassateAssemblaggio
    WIDTH,        -- Larghezza
    HEIGHT,        -- Altezza

    -- Misure
    PAINTINGHOOKS        -- NumeroGanci

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOSTRUCTURALITEMIDSETUPTABLE;
GO

