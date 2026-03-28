
CREATE PROCEDURE RAGUSAPQ.usp_Create_FogliodiproduzionegiornalieraFoall_DatiColata
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE RAGUSAPQ.FogliodiproduzionegiornalieraFoall_DatiColata (
	-- Chiavi
	[N° progressivo]		INT NOT NULL,

	-- Dimensioni
	Colata		NVARCHAR(20) NOT NULL,

	-- Modifica 2/5/2016
	--[Diametro billette]		NVARCHAR(20),
	DiametroBilletta		DECIMAL(28, 12),

	Lega		NVARCHAR(20),
	LunghezzaBilletta		DECIMAL(28, 12)


	-- Constraint
	CONSTRAINT PK_FogliodiproduzionegiornalieraFoall_DatiColata PRIMARY KEY CLUSTERED (
		[N° progressivo]
	)
);

END;
GO

