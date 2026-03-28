
CREATE VIEW AS400.MEDEP_RG_ANFOR00F_Fornitore_MetraRagusaView
AS
SELECT
	-- Chiavi
    CDFOR ,

	-- Dimensioni
	TRB05 ,
    ATB05 ,
    DAB05 ,
    RASFO ,
    INDFO ,
    LOCFO ,
    PROVN ,
    CAPAA ,
    NAZNE ,
    NAZNL ,
    CDFIS ,
    CDVAL ,
    CDLIN ,
    MODSP ,
    MODCO ,
    COPAG ,
    CATEG ,
    CPAIV ,
    CBAPA ,
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
    FS001 ,
    FS002 ,
    FS003 ,
    FS004 ,
    FS005 ,
    FS006 ,
    FS007 ,
    FS008 ,
    FS009 ,
    FS010 ,
    CAESE ,
    FOSEI ,
    FOS1I ,
    FOSEL ,
    FOS1L ,
    FOSEP ,
    FOSEC ,
    CZONA ,
    EMAIL ,
    CDRJE ,
    FOGCD ,
    FO1CD ,
    FOSEQ ,
    FOTPO ,
    CFORC

--FROM OPENQUERY(ALBERTO, 'SELECT * FROM MEDEP_RG.ANFOR00F WHERE ATB05 = ''''');
FROM AS400_BACKUPS.AS400.MEDEP_RG_ANFOR00F_Fornitore_MetraRagusa WHERE ATB05 = '';
GO

