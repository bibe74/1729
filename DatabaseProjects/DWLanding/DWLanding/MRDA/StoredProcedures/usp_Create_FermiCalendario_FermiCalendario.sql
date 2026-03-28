
CREATE PROCEDURE MRDA.usp_Create_FermiCalendario_FermiCalendario
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.FermiCalendario_FermiCalendario (
    -- Chiavi
    IDPostazione        NVARCHAR(50) NOT NULL,
    TsStart        DATETIME NOT NULL,

    -- Dimensioni
    TsStop        DATETIME


    -- Constraint
    CONSTRAINT PK_FermiCalendario_FermiCalendario PRIMARY KEY CLUSTERED (
        IDPostazione,
        TsStart
    )
);

END;
GO

