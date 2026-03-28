
CREATE PROCEDURE MES40MALU.usp_Create_Batch_Lotti
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40MALU.Batch_Lotti (
    -- Chiavi
    BatchID        CHAR(15) NOT NULL,

    -- Dimensioni
    PressID        CHAR(3) NOT NULL,
    DieID        VARCHAR(20),
    DieStatusID        CHAR(1),
    DieCode        VARCHAR(20),
    DieNumber        SMALLINT,
    StartTs        DATETIME,
    StopTs        DATETIME,
    ItemMeterWeight_MasterData        DECIMAL(28, 12),
    ItemMeterWeight_Mes        DECIMAL(28, 12),
    ItemMeterWeight_Test        DECIMAL(28, 12),
    ItemMeterWeight        DECIMAL(28, 12),
    IsPressClosed        BIT NOT NULL,
    PressClosedTs        DATETIME,
    IsSawClosed        BIT NOT NULL,
    SawClosedTs        DATETIME,
    CustAccount        NVARCHAR(20),
    BilletFirstNo        SMALLINT,
    KgRaw        DECIMAL(28, 12),
    KgSheared        DECIMAL(28, 12),
    KgExtruded        DECIMAL(28, 12),
    KgCut        DECIMAL(28, 12),
    KgScrapShear        DECIMAL(28, 12),
    KgScrapPress        DECIMAL(28, 12),
    KgScrapSaw        DECIMAL(28, 12),
    IsSampling        BIT NOT NULL,
    IsErpImported        BIT NOT NULL,
    PressBatchClosingReasonID        SMALLINT,
    BarCount        INT,
    ModuleCount        SMALLINT,
    BilletDiameter        DECIMAL(28, 12)


    -- Constraint
    CONSTRAINT PK_Batch_Lotti PRIMARY KEY CLUSTERED (
        BatchID
    )
);

END;
GO

