
CREATE VIEW AS400.SGLIB_SGAZI00F_AziendaView
AS
SELECT
	-- Chiavi
	CDAZI,	-- CodiceAzienda

	-- Dimensioni
	DEAZI,	-- DescrizioneAzienda
	CASE
	  WHEN R1AZI = 'MYS' THEN 'msis'
	  ELSE
		CASE CDAZI
		  WHEN 'ALC' THEN 'mcol'
		  WHEN 'ALM' THEN 'mrag'
		  WHEN 'FOA' THEN 'mfoa'
		  WHEN 'IME' THEN 'imet'
		  WHEN 'MES' THEN 'mser'
		  WHEN 'MET' THEN 'mspa'
		  WHEN 'PUG' THEN 'mpug'
		  ELSE ''
		END
	END AS IDAzienda,
	CONVERT(DATE, '20120101') AS DataGoLive,
	20120101 AS DataNumericaGoLive

--FROM OPENQUERY(ALBERTO, 'SELECT * FROM SGLIB.SGAZI00F');
FROM AS400_BACKUPS.AS400.SGLIB_SGAZI00F_Azienda;
GO

