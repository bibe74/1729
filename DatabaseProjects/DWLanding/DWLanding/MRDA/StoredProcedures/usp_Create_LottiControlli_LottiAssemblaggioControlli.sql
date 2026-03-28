
CREATE PROCEDURE MRDA.usp_Create_LottiControlli_LottiAssemblaggioControlli
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.LottiControlli_LottiAssemblaggioControlli (
	-- Chiavi
	ID		INT NOT NULL,

	-- Dimensioni
	IDLotto		INT NOT NULL,
	Ts		DATETIME,
	NumeroBarra		INT,
	PlanaritaConforme		BIT,

	-- Misure
	ProvaT_Grezzo		FLOAT,
	ProvaT_Grezzo2		FLOAT,
	ProvaT_DopoForno		FLOAT,
	ProvaQ_Grezzo		FLOAT,
	ProvaQ_Lunghezza		FLOAT,
	ProvaQ_Misura		FLOAT,
	ProvaQ_DopoForno		FLOAT

	-- Constraint
	CONSTRAINT PK_LottiControlli_LottiAssemblaggioControlli PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

