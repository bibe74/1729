
CREATE PROCEDURE CANADAPQ.usp_Create_tblFoallFornitoriBillette_FornitoreBillette
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE CANADAPQ.tblFoallFornitoriBillette_FornitoreBillette (
	-- Chiavi
	CodiceFornitore		NVARCHAR(3),
	ID		BIGINT NOT NULL,

	-- Dimensioni
	NomeFornitore		NVARCHAR(50)


	-- Constraint
	CONSTRAINT PK_tblFoallFornitoriBillette_FornitoreBillette PRIMARY KEY CLUSTERED (
		CodiceFornitore
	)
);

END;
GO

