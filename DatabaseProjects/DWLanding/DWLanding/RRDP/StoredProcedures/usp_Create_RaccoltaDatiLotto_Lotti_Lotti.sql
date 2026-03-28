
CREATE PROCEDURE RRDP.usp_Create_RaccoltaDatiLotto_Lotti_Lotti
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE RRDP.RaccoltaDatiLotto_Lotti_Lotti (
	-- Chiavi
	NumeroLotto		CHAR(15) NOT NULL,
	ID		INT NOT NULL,

	-- Dimensioni
	IDPressa		CHAR(3) NOT NULL,
	IDCausaleChiusuraLotto		SMALLINT NOT NULL,
	CodiceMatrice		VARCHAR(20) NOT NULL,
	NumeroMatrice		SMALLINT NOT NULL,
	StatoMatrice		CHAR(1) NOT NULL,
	CodiceCliente		NVARCHAR(40) NOT NULL,
	ChiusuraLotto		BIT NOT NULL,
	ChiusuraLottoDataOra		DATETIME NOT NULL,
	ChiusuraIncestamento		BIT NOT NULL,
	ChiusuraIncestamentoDataOra		DATETIME NOT NULL,
	PrimaBilletta		SMALLINT NOT NULL,
	PesoProfiloAlMetroScada		DECIMAL(28, 12) NOT NULL,
	PesoProfiloAlMetroAnagrafica		DECIMAL(28, 12) NOT NULL,
	PesoProfiloAlMetroCollaudo		DECIMAL(28, 12) NOT NULL,
	PesoProfiloAlMetro		DECIMAL(28, 12) NOT NULL,
	TimeStart		DATETIME NOT NULL,
	TimeStop		DATETIME NOT NULL,
	Campionatura		BIT NOT NULL,
	Lega		NVARCHAR(100) NOT NULL,
	LegaTrattamento		NVARCHAR(100) NOT NULL,
	Elab_Riconciliato		BIT NOT NULL,
	ProdUtilizzoGrafite		BIT NOT NULL,

	-- Misure
	----BarreTagliate		SMALLINT NOT NULL,
	----BarreImballate		SMALLINT NOT NULL,
	----BarreScartateImballo		SMALLINT NOT NULL,
	KgLordiPressa		DECIMAL(28, 12) NOT NULL,
	KgScartoCesoia		DECIMAL(28, 12) NOT NULL,
	KgEstrusi		DECIMAL(28, 12) NOT NULL,
	KgTagliati		DECIMAL(28, 12) NOT NULL,
	KgImballati		DECIMAL(28, 12) NOT NULL,
	KgScartoImballo		DECIMAL(28, 12) NOT NULL

	-- Constraint
	CONSTRAINT PK_RaccoltaDatiLotto_Lotti_Lotti PRIMARY KEY CLUSTERED (
		NumeroLotto
	)
);

END;
GO

