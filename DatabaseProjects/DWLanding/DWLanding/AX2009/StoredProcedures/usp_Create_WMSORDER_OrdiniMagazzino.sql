
CREATE PROCEDURE AX2009.usp_Create_WMSORDER_OrdiniMagazzino
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AX2009.WMSORDER_OrdiniMagazzino (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    ORDERID        NVARCHAR(20) NOT NULL,
    RECID        BIGINT NOT NULL,

    -- Dimensioni
    INVENTTRANSID        NVARCHAR(20) NOT NULL,
    ITEMID        NVARCHAR(20) NOT NULL,
    INVENTDIMID        NVARCHAR(20) NOT NULL,
    STATUS        SMALLINT NOT NULL,

    -- Misure
    QTY        NUMERIC(28, 12) NOT NULL

    -- Constraint
    CONSTRAINT PK_WMSORDER_OrdiniMagazzino PRIMARY KEY CLUSTERED (
        DATAAREAID,
        ORDERID
    )
);

END;
GO

