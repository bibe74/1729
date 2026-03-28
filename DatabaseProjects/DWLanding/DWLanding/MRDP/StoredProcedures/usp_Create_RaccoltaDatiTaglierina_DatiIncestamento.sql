
CREATE PROCEDURE MRDP.usp_Create_RaccoltaDatiTaglierina_DatiIncestamento
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDP.RaccoltaDatiTaglierina_DatiIncestamento (
	-- Chiavi
	NumeroLotto		CHAR(15) NOT NULL,
	NumeroCesta		VARCHAR(10) NOT NULL,
	ID		INT NOT NULL,

	-- Dimensioni
	LunghezzaTagliata		SMALLINT NOT NULL,
	Tipo		CHAR(1) NOT NULL,

	-- Misure
	Qta		SMALLINT NOT NULL

	-- Constraint
	CONSTRAINT PK_RaccoltaDatiTaglierina_DatiIncestamento PRIMARY KEY CLUSTERED (
		NumeroLotto,
		NumeroCesta,
		ID
	)
);

END;
GO

