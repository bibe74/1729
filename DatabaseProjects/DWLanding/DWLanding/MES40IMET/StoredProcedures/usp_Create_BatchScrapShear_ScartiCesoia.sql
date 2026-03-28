
CREATE PROCEDURE MES40IMET.usp_Create_BatchScrapShear_ScartiCesoia
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40IMET.BatchScrapShear_ScartiCesoia (
    -- Chiavi
    BatchScrapShearID        INT NOT NULL,

    -- Dimensioni
    Ts        DATETIME,
    BatchID        CHAR(15),
    KgScrapShear        DECIMAL(28, 12),
    IsManualScrap        BIT


    -- Constraint
    CONSTRAINT PK_BatchScrapShear_ScartiCesoia PRIMARY KEY CLUSTERED (
        BatchScrapShearID
    )
);

END;
GO

