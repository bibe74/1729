
CREATE VIEW AX2009.NPOPBAFINISHING_FinituraView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    FINISHINGID,        -- IDFinitura
    RECID,        -- PKFinitura

    -- Dimensioni
    NAME,        -- Finitura
    LEADTIME,        -- LeadTime
    ASALIASID,        -- AliasAS400
    DEL_FINISHINGTYPE,        -- TipoFinitura_Old
    FINISHINGGROUPID,        -- IDGruppoFinitura
    ASALIASIDACCESSORI,        -- AliasAS400Accessori
    NCEGROUPPRICEMNG,        -- IsGestionePrezziAScaglioni
    FINISHINGSUBLIMATED,        -- IDSublimato [enum NPOPBAFinishingSublimated]
    FINISHINGDOUBLELAYER,        -- IDDoppioStrato [enum NPOPBAFinishingDoubleLayer]
    DEL_FINISHINGPOWDERCLASS AS FINISHINGPOWDERCLASS,        -- IDClassePolvere [enum NPOPBAFinishingPowderClass]
    FINISHINGMETALLIC,        -- IDMetallizzato [enum NPOPBAFinishingMetallic]
    FINISHINGROUGHNESS,        -- IDRugosita [enum NPOPBAFinishingRoughness]
    FINISHINGSURFACE,        -- IDAspettoSuperficie [enum NPOPBAFinishingSurface]
    FINISHINGFAMILY,        -- IDFamiglia [enum NPOPBAFinishingFamily]
    FINISHINGTYPE,        -- IDTipoFinitura [enum NPOPBAFinishingType]
    OPERATIONTYPE,        -- IDTipoLavorazione [enum NPOPBAOperationType]
    ITEMPRICEGROUPID,        -- IDGruppoPrezzi
    FINISHINGMNG,        -- IDGestione [enum NPOPBAFinishingMng]
    APPLYCOLORCHANGEMARKUP,        -- IsExtraPerCambioColore
    FINISHINGDURABILITYCLASS        -- IDClasseDurabilita [enum NPOPBAFinishingDurabilityClass]

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOPBAFINISHING;
GO

