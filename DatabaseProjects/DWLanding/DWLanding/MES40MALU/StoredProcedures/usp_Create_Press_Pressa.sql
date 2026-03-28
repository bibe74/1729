
CREATE PROCEDURE MES40MALU.usp_Create_Press_Pressa
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40MALU.Press_Pressa (
    -- Chiavi
    PressID        CHAR(3) NOT NULL,

    -- Dimensioni
    Description        NVARCHAR(50) NOT NULL


    -- Constraint
    CONSTRAINT PK_Press_Pressa PRIMARY KEY CLUSTERED (
        PressID
    )
);

END;
GO

