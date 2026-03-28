
CREATE PROCEDURE MES40ALMA.usp_Create_BatchDieChanges_CambiMatrice
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40ALMA.BatchDieChanges_CambiMatrice (
    -- Chiavi
    BatchID        CHAR(15) NOT NULL,

    -- Misure
    DieChangeSeconds INT NOT NULL


    -- Constraint
    CONSTRAINT PK_BatchDieChanges_CambiMatrice PRIMARY KEY CLUSTERED (
        BatchID
    )
);

END;
GO

