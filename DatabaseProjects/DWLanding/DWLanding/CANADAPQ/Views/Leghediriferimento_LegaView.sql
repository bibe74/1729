
/**
 * @table CANADAPQ.Leghediriferimento_Lega
 * @description 

 * @depends [dbo].[Leghe di riferimento]

SELECT TOP 1 * FROM [192.168.216.247\DB2017].MetraPQ.[dbo].[Leghe di riferimento]
*/

CREATE   VIEW CANADAPQ.Leghediriferimento_LegaView
AS
SELECT
	-- Chiavi
	ID,		-- IDLega

	-- Dimensioni
	Lega,		-- Lega
	LegaSuAS400		-- LegaAS400

FROM [192.168.216.247\DB2017].MetraPQ.[dbo].[Leghe di riferimento];
GO

