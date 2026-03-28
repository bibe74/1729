
CREATE VIEW AX2009.EMPLTABLE_DipendenteView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	EMPLID,		-- IDDipendente
	RECID,		-- PKDipendente

	-- Dimensioni
	PARTYID,		-- IDRubrica
	PBAUSERPROFILE,		-- IDProfiloUtente
	DIMENSION6_		-- IDMacroArea

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.EMPLTABLE;
GO

