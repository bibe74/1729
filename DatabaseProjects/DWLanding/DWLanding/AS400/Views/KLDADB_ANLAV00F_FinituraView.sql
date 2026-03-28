
CREATE VIEW AS400.KLDADB_ANLAV00F_FinituraView
AS
SELECT
	-- Chiavi
    LAVCD ,

	-- Dimensioni
	LAVDL ,
    LAVDS ,
    LAVF1 ,
    LAVF2 ,
    LAVF3 ,
    LAVF4 ,
    LAVFB ,
    LAVFS ,
    LAVC1 ,
    LAVC2 ,
    LAVFD ,
    LAVIN ,
    LAVIE ,
    LAVFR ,
    LAV08 ,
    CMPAC ,
    OKWEBL ,
    CMRGF ,
    DELTSS ,
    DELTGG ,
    LAVTT ,
    LAVVM ,
    LAVNA ,
    LAVUB ,
    LAVFM ,
    LAVML ,
    LAULA ,
    LAVRL ,
    LAVF5 ,
    LAVF6 ,
    LAVF7 ,
    LAVF8 ,
    LAVF9

--FROM OPENQUERY(ALBERTO, 'SELECT * FROM KLDADB.ANLAV00F WHERE LAVDL = ''''');
FROM AS400_BACKUPS.AS400.KLDADB_ANLAV00F_Finitura WHERE LAVDL = '';
GO

