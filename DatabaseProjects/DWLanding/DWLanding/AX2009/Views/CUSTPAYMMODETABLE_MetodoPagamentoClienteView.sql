
CREATE VIEW AX2009.CUSTPAYMMODETABLE_MetodoPagamentoClienteView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	PAYMMODE,		-- IDMetodoPagamentoCliente
	RECID,		-- PKMetodoPagamentoCliente

	-- Dimensioni
	NAME,		-- MetodoPagamentoCliente
	NPOPAYMTYPE		-- TipoPagamentoCliente

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTPAYMMODETABLE;
GO

