
CREATE PROCEDURE EDMSRV2016.usp_Create_DocumentRevision_ProfiliIndustria
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE EDMSRV2016.DocumentRevision_ProfiliIndustria (
	-- Chiavi
	ID		INT NOT NULL,

	-- Dimensioni
	DocumentID		INT NOT NULL,
	Filename		NVARCHAR(255) NOT NULL,
	DocumentTypeID		INT NOT NULL,
	RevisionNumber		NVARCHAR(255) NOT NULL,
	IsLatestRevision		BIT NOT NULL,
	StartDate		DATE NOT NULL,
	ModificationDate		DATE NOT NULL


	-- Constraint
	CONSTRAINT PK_EDMSRV2016_DocumentRevision_ProfiliIndustria PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

