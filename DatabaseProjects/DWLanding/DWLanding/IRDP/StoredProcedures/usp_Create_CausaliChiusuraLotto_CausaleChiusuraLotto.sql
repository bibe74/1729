
CREATE PROCEDURE IRDP.usp_Create_CausaliChiusuraLotto_CausaleChiusuraLotto
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE IRDP.CausaliChiusuraLotto_CausaleChiusuraLotto (
	-- Chiavi
	ID		SMALLINT NOT NULL,

	-- Dimensioni
	Descrizione		VARCHAR(50),
	EsitoProduzione		VARCHAR(50)


	-- Constraint
	CONSTRAINT PK_CausaliChiusuraLotto_CausaleChiusuraLotto PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

