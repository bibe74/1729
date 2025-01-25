SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[DimDistributoreView]
AS
SELECT DISTINCT
    D.LocalitaDistributore_cleaned AS Localita,
	CASE
	  WHEN CHARINDEX(')', D.LocalitaDistributore_cleaned) - CHARINDEX(N'(', D.LocalitaDistributore_cleaned) = 3 THEN SUBSTRING(D.LocalitaDistributore_cleaned, CHARINDEX(N'(', D.LocalitaDistributore_cleaned) + 1, 2)
	  WHEN CHARINDEX(')', D.LocalitaDistributore_cleaned) - CHARINDEX(N'(', D.LocalitaDistributore_cleaned) = 4 THEN N''
	  WHEN CHARINDEX('Brescia', D.LocalitaDistributore_cleaned) > 0 THEN N'BS'
	  WHEN CHARINDEX('Cremona', D.LocalitaDistributore_cleaned) > 0 THEN N'CR'
	  WHEN CHARINDEX('Aosta', D.LocalitaDistributore_cleaned) > 0 THEN N'AO'
	  WHEN CHARINDEX('Bolzano', D.LocalitaDistributore_cleaned) > 0 THEN N'BZ'
	  WHEN CHARINDEX('Como', D.LocalitaDistributore_cleaned) > 0 THEN N'CO'
	  WHEN CHARINDEX('Firenze', D.LocalitaDistributore_cleaned) > 0 THEN N'FI'
	  WHEN CHARINDEX('Grosseto', D.LocalitaDistributore_cleaned) > 0 THEN N'GR'
	  WHEN CHARINDEX('Lucca', D.LocalitaDistributore_cleaned) > 0 THEN N'LU'
	  WHEN CHARINDEX('Milano', D.LocalitaDistributore_cleaned) > 0 THEN N'MI'
	  WHEN CHARINDEX('Parma', D.LocalitaDistributore_cleaned) > 0 THEN N'PR'
	  WHEN CHARINDEX('Pisa', D.LocalitaDistributore_cleaned) > 0 THEN N'PI'
	  WHEN CHARINDEX('Reggio Emilia', D.LocalitaDistributore_cleaned) > 0 THEN N'RE'
	  WHEN CHARINDEX('Sassari', D.LocalitaDistributore_cleaned) > 0 THEN N'SS'
	END AS Provincia,
	CASE WHEN CHARINDEX(')', D.LocalitaDistributore_cleaned) - CHARINDEX(N'(', D.LocalitaDistributore_cleaned) = 4 THEN SUBSTRING(D.LocalitaDistributore_cleaned, CHARINDEX(N'(', D.LocalitaDistributore_cleaned) + 1, 3) ELSE N'ITA' END AS Nazione

FROM Staging.T_Distributore D
WHERE D.LocalitaDistributore_cleaned IS NOT NULL;
GO
