
CREATE PROCEDURE MES40MSPA.usp_Create_ModuleTransSaw_DatiIncestamento
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40MSPA.ModuleTransSaw_DatiIncestamento (
    -- Chiavi
    ModuleTransID BIGINT NOT NULL,

    -- Dimensioni
    CreatedTs DATETIME2 NOT NULL,
    BarLength DECIMAL(15, 5) NOT NULL,
    BatchID NVARCHAR(20) NOT NULL,
    Qty INT NOT NULL

    -- Constraint
    CONSTRAINT PK_ModuleTransSaw_DatiIncestamento PRIMARY KEY CLUSTERED (
        ModuleTransID
    )
);

END;
GO

