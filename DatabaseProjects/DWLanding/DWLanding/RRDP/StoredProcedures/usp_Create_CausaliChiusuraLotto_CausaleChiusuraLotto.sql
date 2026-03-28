
CREATE PROCEDURE RRDP.usp_Create_CausaliChiusuraLotto_CausaleChiusuraLotto
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE RRDP.CausaliChiusuraLotto_CausaleChiusuraLotto (
	-- Chiavi
	ID		SMALLINT NOT NULL,

	-- Dimensioni
	Descrizione		VARCHAR(50) NOT NULL,
	EsitoProduzione		VARCHAR(50) NOT NULL


	-- Constraint
	CONSTRAINT PK_CausaliChiusuraLotto_CausaleChiusuraLotto PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

