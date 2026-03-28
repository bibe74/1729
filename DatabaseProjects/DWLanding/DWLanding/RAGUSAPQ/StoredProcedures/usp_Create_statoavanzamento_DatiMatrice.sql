
CREATE PROCEDURE RAGUSAPQ.usp_Create_statoavanzamento_DatiMatrice
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE RAGUSAPQ.Statoavanzamento_DatiMatrice (
	-- Chiavi
	PKDatiMatrice				INT NOT NULL,

	-- Dimensioni
	DataScheda                  DATE,
    CodiceMatrice				NVARCHAR(20),
	BarraMatrice				SMALLINT,
	CodiceBarraMatrice			NVARCHAR(20),
	IsBenestareInternoMatrice	BIT,
	DataArrivoPrevistoMatrice	DATE,
    OrdineMatrice               NVARCHAR(20),

	-- Constraint
	CONSTRAINT PK_statoavanzamento_DatiMatrice PRIMARY KEY CLUSTERED (
		PKDatiMatrice
	)
);

END;
GO

