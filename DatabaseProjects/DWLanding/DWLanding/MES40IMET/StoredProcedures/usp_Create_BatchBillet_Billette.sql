
CREATE PROCEDURE MES40IMET.usp_Create_BatchBillet_Billette
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40IMET.BatchBillet_Billette (
    -- Chiavi
    BatchBilletID        INT NOT NULL,

    -- Dimensioni
    BatchID        CHAR(15) NOT NULL,
    DieID        VARCHAR(20) NOT NULL,
    PressReducedProdReasonID        SMALLINT,
    BilletNo        SMALLINT NOT NULL,
    StartTs        DATETIME,
    StopTs        DATETIME,
    SecCycle        INT NOT NULL,
    Billet1_CastingID        CHAR(20),
    Billet2_CastingID        CHAR(20),
    MmBilletAct        INT,
    MmBarSet        DECIMAL(28, 12),
    MmBilletBackAct        INT,
    KgSheared        DECIMAL(28, 12),
    KgExtruded        DECIMAL(28, 12),
    KgItemMeter        DECIMAL(28, 12),
    Billet1_AlloyID        NVARCHAR(20),
    Billet2_AlloyID        NVARCHAR(20),
    ShiftID        CHAR(10),
    ShiftDate        DATETIME,
    ShiftDate_Normalized        DATETIME,
    KgCut        DECIMAL(28, 12),
    SecDowntime        INT,
    SecExtrusion        INT,
    KgScrapShear        DECIMAL(28, 12),
    IsDieChange        BIT,
    ClosingReasonID        TINYINT


    -- Constraint
    CONSTRAINT PK_BatchBillet_Billette PRIMARY KEY CLUSTERED (
        BatchBilletID
    )
);

END;
GO

