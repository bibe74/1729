
CREATE PROCEDURE EDMSRV2016.usp_Create_DocumentReference_CommesseAccessori
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE EDMSRV2016.DocumentReference_CommesseAccessori (
    -- Chiavi
    ID        INT NOT NULL,

    -- Dimensioni
    SourceID        INT,
    TargetID        INT,
    ReferenceTypeID        INT NOT NULL


    -- Constraint
    CONSTRAINT PK_DocumentReference_CommesseAccessori PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

