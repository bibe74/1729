
CREATE VIEW AX2009.NPOBICOLORWEBSETUP_FinituraBicoloreView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	BICOLORCODE,		-- IDFinituraBicolore
	RECID,		-- PKFinituraBicolore

	-- Dimensioni
	INTERNALFINISHINGID,		-- IDFinituraInterna
	EXTERNALFINISHINGID,		-- IDFinituraEsterna
	NAME		-- FinituraBicolore

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOBICOLORWEBSETUP;
GO

