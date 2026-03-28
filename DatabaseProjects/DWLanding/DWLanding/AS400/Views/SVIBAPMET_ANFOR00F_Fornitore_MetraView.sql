
CREATE VIEW AS400.SVIBAPMET_ANFOR00F_Fornitore_MetraView
AS
SELECT
	-- Chiavi
    CDFOR ,

	-- Dimensioni
	TRB05 ,
    ATB05 ,
    NRB05 ,
    DAB05 ,
    AGB05 ,
    RASFO ,
    INDFO ,
    LOCFO ,
    PROVN ,
    CAPAA ,
    NAZNE ,
    NAZNL ,
    CDFIS ,
    CDVAL ,
    MODSP ,
    MODCO ,
    COPAG ,
    CATEG ,
    FOPAR ,
    PROFA ,
    DULFA ,
    DULPA ,
    TOTES ,
    FFORN ,
    CPAIV ,
    NUEL1 ,
    NUEL2 ,
    CBAPA ,
    CAGPA ,
    CLFOE ,
    FODOG ,
    CATFI ,
    RASF1 ,
    INDF1 ,
    LOCF1 ,
    TELNR ,
    TLXNR ,
    FAXNR ,
    XCABI ,
    XCCAB ,
    XCONT ,
    XBABO ,
    FLIMB ,
    FS101 ,
    FS102 ,
    FS103 ,
    FS104 ,
    FS105 ,
    FS201 ,
    FS202 ,
    FS203 ,
    FS301 ,
    FS302 ,
    CAESE

--FROM OPENQUERY(ALBERTO, 'SELECT * FROM SVIBAPMET.ANFOR00F WHERE ATB05 = ''''');
FROM AS400_BACKUPS.AS400.SVIBAPMET_ANFOR00F_Fornitore_Metra WHERE ATB05 = '';
GO

