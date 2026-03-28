
CREATE PROCEDURE MES40MSPA.usp_Create_PressBatchClosingReason_CausaleChiusuraLotto
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40MSPA.PressBatchClosingReason_CausaleChiusuraLotto (
    -- Chiavi
    PressBatchClosingReasonID        SMALLINT NOT NULL,

    -- Dimensioni
    Description        NVARCHAR(50) NOT NULL,
    Result        NVARCHAR(50) NOT NULL


    -- Constraint
    CONSTRAINT PK_PressBatchClosingReason_CausaleChiusuraLotto PRIMARY KEY CLUSTERED (
        PressBatchClosingReasonID
    )
);

END;
GO

