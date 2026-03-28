
CREATE PROCEDURE MES40RAW.usp_Create_Batch_LottiVerniciatura
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40RAW.Batch_LottiVerniciatura (
    -- Chiavi
    BatchID        NVARCHAR(40) NOT NULL,

    -- Dimensioni
    BatchStartTs        DATETIME2 NOT NULL,
    BatchStatusID        SMALLINT NOT NULL,
    BatchStopTs        DATETIME2 NOT NULL,
    BatchTypeID        CHAR(1) NOT NULL,
    IsClosed        BIT NOT NULL,
    IsDeleted        BIT NOT NULL,
    PaintFinishingID        NVARCHAR(40) NOT NULL,
    PaintingAreaID        NVARCHAR(40) NOT NULL,
    PaintingLineID        NVARCHAR(40) NOT NULL,
    TagFinishingID        NVARCHAR(40) NOT NULL


    -- Constraint
    CONSTRAINT PK_Batch_LottiVerniciatura PRIMARY KEY CLUSTERED (
        BatchID
    )
);

END;
GO

