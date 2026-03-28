
CREATE VIEW AS400.SVIBAPMET_BFAGE00F_GruppoVendite_MetraView
AS
SELECT
	-- Chiavi
    CDAGE ,

	-- Dimensioni
	TRB12 ,
    ATB12 ,
    NRB12 ,
    NOMAG ,
    INDAG ,
    LOCAG ,
    PROVN ,
    CAPAA ,
    PROVG ,
    PRFAG ,
    ZONCO ,
    ESCLU ,
    SOCCA ,
    RITAC ,
    VAPRO ,
    [PROV£] ,
    PROP1 ,
    PROP2 ,
    RCSP1 ,
    RCVA1 ,
    RCSP2 ,
    RCVA2 ,
    RCSP3 ,
    RCVA3 ,
    RCSP4 ,
    RCVA4 ,
    RCSP5 ,
    RCVA5 ,
    [PROT£]

--FROM OPENQUERY(ALBERTO, 'SELECT * FROM SVIBAPMET.BFAGE00F WHERE ATB12 = ''''');
FROM AS400_BACKUPS.AS400.SVIBAPMET_BFAGE00F_GruppoVendite_Metra WHERE ATB12 = '';
GO

