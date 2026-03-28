
CREATE PROCEDURE AX2009.usp_Create_ASSETGROUP_GruppoCespiti
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AX2009.ASSETGROUP_GruppoCespiti (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    GROUPID        NVARCHAR(10) NOT NULL,

    -- Dimensioni
    NAME        NVARCHAR(30) NOT NULL


    -- Constraint
    CONSTRAINT PK_ASSETGROUP_GruppoCespiti PRIMARY KEY CLUSTERED (
        DATAAREAID,
        GROUPID
    )
);

END;
GO

