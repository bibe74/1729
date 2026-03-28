
CREATE VIEW AX2009.CUSTCLASSIFICATIONGROUP_ClienteGruppoClassificazioneView
AS
SELECT
	-- Chiavi
	DATAAREAID,  -- IDAzienda
	CODE,  -- IDClienteGruppoClassificazione
	RECID,  -- PKClienteGruppoClassificazione

	-- Dimensioni
	TXT  -- ClienteGruppoClassificazione

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTCLASSIFICATIONGROUP;
GO

