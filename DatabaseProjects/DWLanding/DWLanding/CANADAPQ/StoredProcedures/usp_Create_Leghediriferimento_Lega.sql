
CREATE PROCEDURE CANADAPQ.usp_Create_Leghediriferimento_Lega
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE CANADAPQ.Leghediriferimento_Lega (
	-- Chiavi
	ID		INT NOT NULL,

	-- Dimensioni
	Lega		NVARCHAR(50),
	LegaSuAS400		NVARCHAR(50)


	-- Constraint
	CONSTRAINT PK_Leghediriferimento_Lega PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

