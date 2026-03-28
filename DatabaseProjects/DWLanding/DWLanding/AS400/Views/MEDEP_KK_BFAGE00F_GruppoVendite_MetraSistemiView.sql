
CREATE VIEW AS400.MEDEP_KK_BFAGE00F_GruppoVendite_MetraSistemiView
AS
SELECT
	-- Chiavi
    CDAGE ,

	-- Dimensioni
	TRB12 ,
    ATB12 ,
    NOMAG ,
    INDAG ,
    LOCAG ,
    PROVN ,
    CAPAA ,
    PROVG ,
    AGPAIV ,
    AGCFIS ,
    ZONCO ,
    ESCLU ,
    SOCCA ,
    RITAC ,
    VAPRO ,
    TAR01 ,
    TAR02 ,
    TAR03 ,
    TAR04 ,
    TAR05 ,
    TAR06 ,
    TAR07 ,
    TAR08 ,
    TAR09 ,
    TAR10 ,
    PRO01 ,
    PRO02 ,
    PRO03 ,
    PRO04 ,
    PRO05 ,
    PRO06 ,
    PRO07 ,
    PRO08 ,
    PRO09 ,
    PRO10 ,
    TILIQ ,
    FISSO ,
    DATPR ,
    BFAIV ,
    AGCFOR ,
    AGCENA ,
    AGCFAT ,
    CDCAA ,
    MACAR

--FROM OPENQUERY(ALBERTO, 'SELECT * FROM MEDEP_KK.BFAGE00F WHERE ATB12 = ''''');
FROM AS400_BACKUPS.AS400.MEDEP_KK_BFAGE00F_GruppoVendite_MetraSistemi WHERE ATB12 = '';
GO

