
CREATE VIEW AX2009.CUSTGROUP_ClienteGruppoView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	CUSTGROUP,		-- IDClienteGruppo
	RECID,		-- PKClienteGruppo

	-- Dimensioni
	NAME		-- ClienteGruppo

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTGROUP;
GO

