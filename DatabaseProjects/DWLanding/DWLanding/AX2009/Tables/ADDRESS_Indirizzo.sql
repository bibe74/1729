CREATE TABLE [AX2009].[ADDRESS_Indirizzo] (
    [DATAAREAID]      CHAR (4)       NOT NULL,
    [RECID]           BIGINT         NOT NULL,
    [ADDRTABLEID]     INT            NOT NULL,
    [ADDRRECID]       BIGINT         NOT NULL,
    [TYPE]            SMALLINT       NOT NULL,
    [NAME]            NVARCHAR (60)  NOT NULL,
    [ADDRESS]         NVARCHAR (250) NOT NULL,
    [COUNTRYREGIONID] NVARCHAR (10)  NOT NULL,
    [ZIPCODE]         NVARCHAR (10)  NOT NULL,
    [STATE]           NVARCHAR (10)  NOT NULL,
    [COUNTY]          NVARCHAR (10)  NOT NULL,
    [CITY]            NVARCHAR (60)  NOT NULL,
    [STREET]          NVARCHAR (250) NOT NULL
);
GO

ALTER TABLE [AX2009].[ADDRESS_Indirizzo]
    ADD CONSTRAINT [PK_ADDRESS_Indirizzo] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [RECID] ASC);
GO

