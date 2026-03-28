

/**
 * @table INTELCO.ADDRESS_Indirizzo
 * @description 

 * @depends dbo.ADDRESS

SELECT TOP 1 * FROM [AXSQL\INTELCO].INTELCO_METRA_LIVE.dbo.ADDRESS
*/

CREATE VIEW [INTELCO].[TimbratureView] AS
WITH TD
AS (SELECT
		T.cognome,
		T.nome,
		CONCAT(RTRIM(T.verso1) , '*', RTRIM(T.data1),  '*', RTRIM(T.timbratura1))  AS vdt01,
		CONCAT(RTRIM(T.verso2) , '*', RTRIM(T.data2),  '*', RTRIM(T.timbratura2))  AS vdt02,
		CONCAT(RTRIM(T.verso3) , '*', RTRIM(T.data3),  '*', RTRIM(T.timbratura3))  AS vdt03,
		CONCAT(RTRIM(T.verso4) , '*', RTRIM(T.data4),  '*', RTRIM(T.timbratura4))  AS vdt04,
		CONCAT(RTRIM(T.verso5) , '*', RTRIM(T.data5),  '*', RTRIM(T.timbratura5))  AS vdt05,
		CONCAT(RTRIM(T.verso6) , '*', RTRIM(T.data6),  '*', RTRIM(T.timbratura6))  AS vdt06,
		CONCAT(RTRIM(T.verso7) , '*', RTRIM(T.data7),  '*', RTRIM(T.timbratura7))  AS vdt07,
		CONCAT(RTRIM(T.verso8) , '*', RTRIM(T.data8),  '*', RTRIM(T.timbratura8))  AS vdt08,
		CONCAT(RTRIM(T.verso9) , '*', RTRIM(T.data9),  '*', RTRIM(T.timbratura9))  AS vdt09,
		CONCAT(RTRIM(T.verso10), '*', RTRIM(T.data10), '*', RTRIM(T.timbratura10)) AS vdt10
	FROM INTELCO.Timbrature T
)
, UP
AS (
	SELECT 
		unpvt.Cognome,
		unpvt.Nome,
		unpvt.AccNr,
		unpvt.VerAcc
	FROM (
		SELECT
			TD.Cognome,
			TD.Nome,
			TD.vdt01,
			TD.vdt02,
			TD.vdt03,
			TD.vdt04,
			TD.vdt05,
			TD.vdt06,
			TD.vdt07,
			TD.vdt08,
			TD.vdt09,
			TD.vdt10
		FROM TD
	) P
	UNPIVOT
	(
		VerAcc FOR AccNr IN (vdt01, vdt02, vdt03, vdt04, vdt05,
							 vdt06, vdt07, vdt08, vdt09, vdt10)
	) AS unpvt
)
SELECT 
	UP.Cognome,
	UP.Nome,
	CONVERT(DATE, UDT.DataOra) AS Data,
	UDT.Verso,
    UDT.DataOra
FROM 
	UP	
	CROSS APPLY INTELCO.ufn_DatiTimbratura(UP.VerAcc) UDT
WHERE 
	UP.VerAcc <> N'**'
GO

