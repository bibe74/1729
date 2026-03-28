
CREATE PROCEDURE CANADAPQ.usp_Create_FogliodiproduzionegiornalieraFoall_DatiColata
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE CANADAPQ.FogliodiproduzionegiornalieraFoall_DatiColata (
	-- Chiavi
	[N° progressivo]  INT NOT NULL,

	-- Dimensioni
	Colata  NVARCHAR(20) NOT NULL,
	DiametroBilletta  DECIMAL(28, 12) NOT NULL,
	Lega  NVARCHAR(20),
	LunghezzaBilletta  DECIMAL(28, 12),
	PesoTeoricoBilletta  DECIMAL(28, 12) NOT NULL


	-- Constraint
	CONSTRAINT PK_FogliodiproduzionegiornalieraFoall_DatiColata PRIMARY KEY CLUSTERED (
		[N° progressivo]
	)
);

END;
GO

