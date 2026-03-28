
CREATE PROCEDURE MRDP.usp_Create_ScartiCesoia_ScartiCesoia
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDP.ScartiCesoia_ScartiCesoia (
	-- Chiavi
	NumeroLotto		CHAR(15) NOT NULL,
	ID		INT NOT NULL,

	-- Dimensioni
	TimeStamp		DATETIME NOT NULL,
	ScartoManuale		BIT NOT NULL,

	-- Misure
	KgScartoCesoia		DECIMAL(28, 12) NOT NULL

	-- Constraint
	CONSTRAINT PK_ScartiCesoia_ScartiCesoia PRIMARY KEY CLUSTERED (
		NumeroLotto,
		ID
	)
);

END;
GO

