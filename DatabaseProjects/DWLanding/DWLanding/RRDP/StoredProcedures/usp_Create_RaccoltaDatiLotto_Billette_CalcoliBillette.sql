
CREATE PROCEDURE RRDP.usp_Create_RaccoltaDatiLotto_Billette_CalcoliBillette
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE RRDP.RaccoltaDatiLotto_Billette_CalcoliBillette (
	-- Chiavi
	ID		INT NOT NULL,

	-- Dimensioni
	Turno		CHAR(2) NOT NULL,
	TurnoData		DATE NOT NULL,
	TurnoDataMetra		DATE NOT NULL,

	-- Misure
	KgNettiTaglio		DECIMAL(28, 12) NOT NULL,
	KgNettiImballo		DECIMAL(28, 12) NOT NULL,
	SecondiFermo		SMALLINT NOT NULL

	-- Constraint
	CONSTRAINT PK_RaccoltaDatiLotto_Billette_CalcoliBillette PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

