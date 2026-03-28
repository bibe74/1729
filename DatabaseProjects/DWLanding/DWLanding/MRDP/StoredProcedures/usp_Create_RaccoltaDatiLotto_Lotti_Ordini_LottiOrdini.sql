
CREATE PROCEDURE MRDP.usp_Create_RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDP.RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini (
	-- Chiavi
	NumeroLotto		CHAR(15) NOT NULL,
	NumeroOrdine		CHAR(20) NOT NULL,
	ID		INT NOT NULL,

	-- Dimensioni


	-- Constraint
	CONSTRAINT PK_RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini PRIMARY KEY CLUSTERED (
		NumeroLotto,
		NumeroOrdine
	)
);

END;
GO

