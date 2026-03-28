
CREATE PROCEDURE AX2009.usp_Create_COMPANYINFO_InformazioniAzienda
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AX2009.COMPANYINFO_InformazioniAzienda (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    RECID        BIGINT NOT NULL,

    -- Dimensioni
    NAME        NVARCHAR(60) NOT NULL,
    CURRENCYCODE        NVARCHAR(3) NOT NULL


    -- Constraint
    CONSTRAINT PK_COMPANYINFO_InformazioniAzienda PRIMARY KEY CLUSTERED (
        DATAAREAID
    )
);

END;
GO

