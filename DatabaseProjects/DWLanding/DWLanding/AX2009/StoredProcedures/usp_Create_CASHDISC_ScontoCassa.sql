
CREATE PROCEDURE AX2009.usp_Create_CASHDISC_ScontoCassa
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AX2009.CASHDISC_ScontoCassa (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    CASHDISCCODE        NVARCHAR(10) NOT NULL,
    RECID        BIGINT NOT NULL,

    -- Dimensioni
    DESCRIPTION        NVARCHAR(60) NOT NULL


    -- Constraint
    CONSTRAINT PK_CASHDISC_ScontoCassa PRIMARY KEY CLUSTERED (
        DATAAREAID,
        CASHDISCCODE
    )
);

END;
GO

