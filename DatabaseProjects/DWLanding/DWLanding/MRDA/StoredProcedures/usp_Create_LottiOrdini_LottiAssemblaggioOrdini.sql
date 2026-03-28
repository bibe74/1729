
CREATE PROCEDURE MRDA.usp_Create_LottiOrdini_LottiAssemblaggioOrdini
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.LottiOrdini_LottiAssemblaggioOrdini (
	-- Chiavi
	ID		INT NOT NULL,

	-- Dimensioni
	IDLotto		INT NOT NULL,
	OrdineProduzione		NVARCHAR(50) NOT NULL,
	OrdineCliente		NVARCHAR(50),

	-- Misure
	Qta		INT

	-- Constraint
	CONSTRAINT PK_LottiOrdini_LottiAssemblaggioOrdini PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

