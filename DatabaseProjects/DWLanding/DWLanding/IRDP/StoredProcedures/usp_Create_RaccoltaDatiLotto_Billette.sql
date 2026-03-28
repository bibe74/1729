
CREATE PROCEDURE IRDP.usp_Create_RaccoltaDatiLotto_Billette
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE IRDP.RaccoltaDatiLotto_Billette (
	-- Chiavi
	NumeroLotto		CHAR(15),
	NumeroBilletta		SMALLINT,
	ID		INT NOT NULL,

	-- Dimensioni
	IDCausaleProduzioneRidotta		SMALLINT,
	IDCausaleChiusuraLotto		SMALLINT,
	TimeStartCiclo		DATETIME,
	TimeStart		DATETIME,
	TimeStop		DATETIME,
	TimeStopCiclo		DATETIME,
	LunghezzaBarra		SMALLINT,
	LunghezzaBillettaEstrusa		DECIMAL(28, 12),
	CodiceColata		CHAR(35),
	LunghezzaFondello		DECIMAL(28, 12),
	Campionatura		BIT,
	Elab_Turno		SMALLINT,
	Elab_TurnoData		DATE,
	Elab_TurnoDataMetra		DATE,

	-- Misure
	KgLordiPressa		DECIMAL(28, 12),
	KgEstrusi		DECIMAL(28, 12),
	Elab_KgNettiTaglio		DECIMAL(28, 12),
	Elab_KgNettiImballo		DECIMAL(28, 12),
	Elab_SecondiFermo		SMALLINT

	-- Constraint
	CONSTRAINT PK_RaccoltaDatiLotto_Billette PRIMARY KEY CLUSTERED (
		NumeroLotto,
		NumeroBilletta,
		ID
	)
);

END;
GO

