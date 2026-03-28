
CREATE PROCEDURE AX2009.usp_Create_CUSTCONFIRMJOUR_ConfermaOrdineCliente
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AX2009.CUSTCONFIRMJOUR_ConfermaOrdineCliente (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    CONFIRMID        NVARCHAR(20) NOT NULL,
    RECID        BIGINT NOT NULL,

    -- Dimensioni
    CONFIRMDATE        DATE NOT NULL,
    SALESID        NVARCHAR(20) NOT NULL


    -- Constraint
    CONSTRAINT PK_CUSTCONFIRMJOUR_ConfermaOrdineCliente PRIMARY KEY CLUSTERED (
        DATAAREAID,
        CONFIRMID
    )
);

END;
GO

