
CREATE PROCEDURE EDMSRV2016.usp_Create_Folder_Cartella
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE EDMSRV2016.Folder_Cartella (
    -- Chiavi
    ID        INT NOT NULL,

    -- Dimensioni
    ParentID        INT,
    Name        NVARCHAR(255) NOT NULL


    -- Constraint
    CONSTRAINT PK_Folder_Cartella PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

