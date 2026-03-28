
CREATE PROCEDURE IRDP.usp_Create_RaccoltaDatiTaglierina_DatiIncestamento
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE IRDP.RaccoltaDatiTaglierina_DatiIncestamento (
	-- Chiavi
	ID		INT NOT NULL,

	-- Dimensioni
	LunghezzaTagliata		SMALLINT,
	NumeroLotto		CHAR(15),
	NumeroCesta		VARCHAR(10),
	Tipo		CHAR(1),

	-- Misure
	Qta		SMALLINT

	-- Constraint
	CONSTRAINT PK_RaccoltaDatiTaglierina_DatiIncestamento PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

