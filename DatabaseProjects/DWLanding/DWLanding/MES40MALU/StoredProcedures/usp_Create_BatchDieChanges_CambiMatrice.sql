
CREATE PROCEDURE MES40MALU.usp_Create_BatchDieChanges_CambiMatrice
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40MALU.BatchDieChanges_CambiMatrice (
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

