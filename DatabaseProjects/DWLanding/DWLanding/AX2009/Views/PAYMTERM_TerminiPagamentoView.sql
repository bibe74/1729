
CREATE VIEW AX2009.PAYMTERM_TerminiPagamentoView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	PAYMTERMID,		-- IDTerminiPagamento
	RECID,		-- PKTerminiPagamento

	-- Dimensioni
	DESCRIPTION,		-- TerminiPagamento
	NUMOFMONTHS		-- MesiPagamento

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.PAYMTERM;
GO

