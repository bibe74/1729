CREATE VIEW AX2009.NPOWRKCTRSETUPTABLE_CentroDiLavoroDatiMatriceView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    WRKCTRID,        -- IDCentroDiLavoro
    RECID,        -- PKCentroDiLavoroDatiMatrice

    -- Dimensioni
    MASTERWRKCTRID,        -- IDPressa
    BILLETDIAMETER,        -- DiametroBilletta
    HOLENUM,        -- NumeroFori
    SUBWRKCTRID,        -- Sottomatrice
    PULLOUT,        -- InsertoMatrice
    BOLSTER,        -- BolsterMatrice
    SUBBOLSTER,        -- SottobolsterMatrice
    WRKCTRPACKAGETYPE,        -- IDTipoPacchetto [enum NPOWrkCtrPackageTypeId]
    PACKAGEDIAMETER,        -- DiametroMatrice
    PACKAGEHEIGHT,        -- AltezzaMatrice
    STATUSUSE,        -- IDStatoMatrice [enum NPOWrkStatusType]
    NETWEIGHT,        -- PesoMatrice
    NETWEIGHTSUB,        -- PesoSottomatrice
    LASTTRANSDATE,        -- DataUltimaEstrusioneMatrice
    APPROVALDATE,        -- DataBenestareMatrice
    ANNULDATE,        -- DataEliminazioneMatrice
    NPOINVOICINGMODE,        -- IDModalitaFatturazione [enum NPOInvoicingMode]
    RECEIPTDATE,        -- DataRicevimentoMatrice
    SAMPLINGDATE,        -- DataCampionaturaMatrice
    DIESTEELLOT,        -- LottoAcciaioMatrice
    SPINDLESTEELLOT,        -- LottoAcciaioMandrino
    SODAVOLUME,        -- VolumeMatricePerVascaSoda
    SODAALKG,        -- PesoAlluminioDaSciogliere
    CONVERT(NVARCHAR(1000), NOTES) AS NOTES,        -- Note
    SODASUBVOLUME,        -- VolumeSottomatricePerVascaSoda

    -- Misure
    QTYGOOD,        -- QtaEstrusa
    QTYGOODSECONDARYUM        -- NumeroBilletteEstruse

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOWRKCTRSETUPTABLE;
GO

