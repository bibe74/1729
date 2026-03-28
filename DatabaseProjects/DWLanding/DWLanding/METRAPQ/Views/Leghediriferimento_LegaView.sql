
/**
 * @table METRAPQ.Leghediriferimento_Lega
 * @description 

 * @depends [dbo].[Leghe di riferimento]

SELECT TOP 1 * FROM [SQL2014\DB2014].MetraPQ.[dbo].[Leghe di riferimento]
*/

CREATE   VIEW METRAPQ.Leghediriferimento_LegaView
AS
SELECT
	-- Chiavi
	ID,		-- IDLega

	-- Dimensioni
	Lega,		-- Lega
	LegaSuAS400		-- LegaAS400

FROM [SQL2014\DB2014].MetraPQ.[dbo].[Leghe di riferimento];
GO

