
CREATE PROCEDURE IRDP.usp_Create_RaccoltaDatiLotto_Lotti_Lotti
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE IRDP.RaccoltaDatiLotto_Lotti_Lotti (
	-- Chiavi
	NumeroLotto		CHAR(15),
	ID		INT NOT NULL,

	-- Dimensioni
	IDPressa		CHAR(3),
	IDCausaleChiusuraLotto		SMALLINT,
	CodiceMatrice		VARCHAR(20),
	NumeroMatrice		SMALLINT,
	StatoMatrice		CHAR(1),
	CodiceCliente		NVARCHAR(40),
	ChiusuraLotto		BIT,
	ChiusuraLottoDataOra		DATETIME,
	ChiusuraIncestamento		BIT,
	ChiusuraIncestamentoDataOra		DATETIME,
	PrimaBilletta		SMALLINT,
	PesoProfiloAlMetroScada		DECIMAL(28, 12),
	PesoProfiloAlMetroAnagrafica		DECIMAL(28, 12),
	PesoProfiloAlMetroCollaudo		DECIMAL(28, 12),
	PesoProfiloAlMetro		DECIMAL(28, 12),
	TimeStart		DATETIME,
	TimeStop		DATETIME,
	Campionatura		BIT,
	Lega		NVARCHAR(100),
	LegaTrattamento		NVARCHAR(100),
	Elab_Riconciliato		BIT,
	ProdUtilizzoGrafite		BIT,

	-- Misure
	----BarreTagliate		SMALLINT,
	----BarreImballate		SMALLINT,
	----BarreScartateImballo		SMALLINT,
	KgLordiPressa		DECIMAL(28, 12),
	KgScartoCesoia		DECIMAL(28, 12),
	KgEstrusi		DECIMAL(28, 12),
	KgTagliati		DECIMAL(28, 12),
	KgImballati		DECIMAL(28, 12),
	KgScartoImballo		DECIMAL(28, 12)

	-- Constraint
	CONSTRAINT PK_RaccoltaDatiLotto_Lotti_Lotti PRIMARY KEY CLUSTERED (
		NumeroLotto
	)
);

END;
GO

