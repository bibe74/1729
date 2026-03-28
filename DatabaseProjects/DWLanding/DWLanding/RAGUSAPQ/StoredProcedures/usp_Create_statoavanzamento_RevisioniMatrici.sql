
CREATE PROCEDURE RAGUSAPQ.usp_Create_statoavanzamento_RevisioniMatrici
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE RAGUSAPQ.Statoavanzamento_RevisioniMatrici (
	-- Chiavi
	[N°]				        INT NOT NULL,

	-- Dimensioni
	[Codice Metra]				NVARCHAR(20),
	[Barra matrice]				SMALLINT,
    CodiceBarraMatrice          NVARCHAR(20),
	Revisione                   INT,
    DataRevisione               DATE,
    TipoAzione                  NVARCHAR(20),
	[Arrivo previsto matrice]	DATE,
	[Arrivo effettivo matrice]	DATE,
    [Ordine matrice]            NVARCHAR(20),
    NumeroOrdineFornitore       NVARCHAR(20),

	-- Constraint
	CONSTRAINT PK_statoavanzamento_RevisioniMatrici PRIMARY KEY CLUSTERED (
		[N°]
	)
);

END;
GO

