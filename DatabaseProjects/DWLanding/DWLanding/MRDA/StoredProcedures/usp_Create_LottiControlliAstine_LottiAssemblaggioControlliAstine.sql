
CREATE PROCEDURE MRDA.usp_Create_LottiControlliAstine_LottiAssemblaggioControlliAstine
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.LottiControlliAstine_LottiAssemblaggioControlliAstine (
	-- Chiavi
	ID		INT NOT NULL,

	-- Dimensioni
	IDLottoControllo		INT NOT NULL,
	CodiceAstina		NVARCHAR(20) NOT NULL,
	LottoAstina		NVARCHAR(50)


	-- Constraint
	CONSTRAINT PK_LottiControlliAstine_LottiAssemblaggioControlliAstine PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

