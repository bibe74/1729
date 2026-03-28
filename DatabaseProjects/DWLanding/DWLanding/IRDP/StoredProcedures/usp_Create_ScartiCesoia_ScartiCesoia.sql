
CREATE PROCEDURE IRDP.usp_Create_ScartiCesoia_ScartiCesoia
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE IRDP.ScartiCesoia_ScartiCesoia (
	-- Chiavi
	NumeroLotto		CHAR(15),
	ID		INT NOT NULL,

	-- Dimensioni
	TimeStamp		DATETIME,
	ScartoManuale		BIT,

	-- Misure
	KgScartoCesoia		DECIMAL(28, 12)

	-- Constraint
	CONSTRAINT PK_ScartiCesoia_ScartiCesoia PRIMARY KEY CLUSTERED (
		NumeroLotto,
		ID
	)
);

END;
GO

