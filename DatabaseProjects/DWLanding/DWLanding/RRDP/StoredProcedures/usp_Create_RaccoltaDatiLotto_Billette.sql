
CREATE PROCEDURE RRDP.usp_Create_RaccoltaDatiLotto_Billette
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE RRDP.RaccoltaDatiLotto_Billette (
	-- Chiavi
	NumeroLotto		CHAR(15) NOT NULL,
	NumeroBilletta		SMALLINT NOT NULL,
	ID		INT NOT NULL,

	-- Dimensioni
	IDCausaleProduzioneRidotta		SMALLINT NOT NULL,
	IDCausaleChiusuraLotto		SMALLINT NOT NULL,
	ChiusuraLotto		SMALLINT NOT NULL,
	CodiceMatrice		CHAR(20) NOT NULL,
	NumeroMatrice		SMALLINT NOT NULL,
	TimeStartCiclo		DATETIME NOT NULL,
	TimeStart		DATETIME NOT NULL,
	TimeStop		DATETIME NOT NULL,
	TimeStopCiclo		DATETIME NOT NULL,
	LunghezzaBarra		SMALLINT NOT NULL,
	LunghezzaBillettaEstrusa		DECIMAL(28, 12) NOT NULL,
	CodiceColata		CHAR(35) NOT NULL,
	PesoProfiloAlMetro		DECIMAL(28, 12) NOT NULL,
	LunghezzaFondello		DECIMAL(28, 12) NOT NULL,

	-- Misure
	KgLordiPressa		DECIMAL(28, 12) NOT NULL,
	KgEstrusi		DECIMAL(28, 12) NOT NULL,
	SecondiEstrusioneNetti		SMALLINT NOT NULL

	-- Constraint
	CONSTRAINT PK_RaccoltaDatiLotto_Billette PRIMARY KEY CLUSTERED (
		NumeroLotto,
		NumeroBilletta,
		ID
	)
);

END;
GO

