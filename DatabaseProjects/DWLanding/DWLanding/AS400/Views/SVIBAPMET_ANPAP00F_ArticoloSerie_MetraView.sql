
CREATE VIEW AS400.SVIBAPMET_ANPAP00F_ArticoloSerie_MetraView
AS
SELECT
	-- Chiavi
	CDPAR ,

	-- Dimensioni
    DEPARA ,
    CLME01 ,
    CLME02 ,
    CLME03 ,
    CLME04 ,
    CLME05 ,
    CLME06 ,
    CLME07 ,
    CLME08 ,
    CLME09 ,
    CLME10 ,
    CLME11 ,
    CLME12 ,
    CLME13 ,
    CLME14 ,
    CLME15 ,
    CLME16 ,
    CLME17 ,
    CLME18 ,
    CLME19 ,
    CLME20 ,
    CLME21 ,
    CLME22 ,
    CLME23 ,
    CLME24 ,
    CLME25 ,
    CLME26 ,
    CLME27 ,
    CLME28 ,
    CLME29 ,
    CLME30 ,
    MTCDPR ,
    MTCD01 ,
    MTCD02 ,
    MTCD03 ,
    MTCD04 ,
    MTCD05 ,
    MTCD06 ,
    MTCD07 ,
    MTCD08 ,
    MTCD09 ,
    MTCD10 ,
    FINCAT ,
    FLAG11 ,
    FLAG12 ,
    FLAG13 ,
    FLAG21 ,
    FLAG22 ,
    FLAG23 ,
    FLAG31 ,
    FLAG32 ,
    FLAG33

--FROM OPENQUERY(ALBERTO, 'SELECT * FROM SVIBAPMET.ANPAP00F');
FROM AS400_BACKUPS.AS400.SVIBAPMET_ANPAP00F_ArticoloSerie_Metra;
GO

