
CREATE VIEW AX2009.VENDPAYMMODETABLE_MetodoPagamentoFornitoreView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	PAYMMODE,		-- IDMetodoPagamentoFornitore
	RECID,		-- PKMetodoPagamentoFornitore

	-- Dimensioni
	NAME		-- MetodoPagamentoFornitore

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.VENDPAYMMODETABLE;
GO

