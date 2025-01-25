--SELECT * FROM dbo.LogZafira;

--SELECT DISTINCT IDTipoCarburante FROM dbo.LogZafira;

DROP TABLE IF EXISTS dbo.TipoCarburante;
GO

CREATE TABLE dbo.TipoCarburante (
    IDTipoCarburante CHAR(1) NOT NULL CONSTRAINT PK_dbo_TipoCarburante PRIMARY KEY CLUSTERED,
    TipoCarburante NVARCHAR(10) NOT NULL,
    IDUnitaDiMisura CHAR(2) NOT NULL
);
GO

INSERT INTO dbo.TipoCarburante
(
    IDTipoCarburante,
    TipoCarburante,
    IDUnitaDiMisura
)
VALUES ('M', N'Metano', 'Kg'), ('B', N'Benzina', 'l');
GO

/*

DROP TABLE IF EXISTS dbo.__LocalitaDistributore;
GO

SELECT DISTINCT
    LocalitaDistributore,
    LocalitaDistributore AS DescrizioneNormalizzata

INTO dbo.__LocalitaDistributore

FROM dbo.LogZafira
WHERE LocalitaDistributore IS NOT NULL
ORDER BY LocalitaDistributore;
GO

-- TODO: valorizzare DescrizioneNormalizzata

INSERT INTO dbo.__LocalitaDistributore
(
    LocalitaDistributore,
    DescrizioneNormalizzata
)
VALUES
(   N'', -- LocalitaDistributore - nvarchar(255)
    N'<distributore sconosciuto>'  -- DescrizioneNormalizzata - nvarchar(255)
);
GO

*/

SELECT DISTINCT 
    LD.DescrizioneNormalizzata
FROM dbo.__LocalitaDistributore LD
ORDER BY LD.DescrizioneNormalizzata;

DROP TABLE IF EXISTS dbo.Distributore;
GO

CREATE TABLE dbo.Distributore (
    IDDistributore INT IDENTITY(1, 1) NOT NULL CONSTRAINT PK_dbo_Distributore PRIMARY KEY CLUSTERED,
    Distributore NVARCHAR(40) NOT NULL,
    Localita NVARCHAR(40) NULL,
    Provincia CHAR(2) NULL,
    Regione NVARCHAR(20) NULL,
    Nazione NVARCHAR(20) NULL,
    IsAutostrada BIT NOT NULL CONSTRAINT DFT_dbo_Distributore_IsAutostrada DEFAULT (0),
    Autostrada NVARCHAR(10) NULL,
    AreaServizio NVARCHAR(40) NULL
);
GO

CREATE UNIQUE INDEX IX_dbo_Distributore_Distributore ON dbo.Distributore (Distributore);
GO

INSERT INTO dbo.Distributore (Distributore)
SELECT DISTINCT
    LD.DescrizioneNormalizzata
FROM dbo.__LocalitaDistributore LD
ORDER BY LD.DescrizioneNormalizzata;
GO

UPDATE dbo.LogZafira
SET LocalitaDistributore = N''
WHERE LocalitaDistributore IS NULL
    AND (
        EuroMetano IS NOT NULL
        OR EuroBenzina IS NOT NULL
    );
GO

SELECT
    LC.*

FROM dbo.LogZafira LC
LEFT JOIN dbo.__LocalitaDistributore LD ON LD.LocalitaDistributore = LC.LocalitaDistributore
LEFT JOIN dbo.Distributore D ON D.Distributore = LD.DescrizioneNormalizzata
WHERE (
    LC.EuroMetano IS NOT NULL
    OR LC.EuroBenzina IS NOT NULL
)
AND D.IDDistributore IS NULL;
GO

DROP TABLE IF EXISTS dbo.Rifornimenti;
GO

CREATE TABLE dbo.Rifornimenti (
    IDRifornimento INT IDENTITY(1, 1) NOT NULL CONSTRAINT PK_dbo_Rifornimenti PRIMARY KEY CLUSTERED,
    DataRifornimento DATE NOT NULL,
    IDDistributore INT NOT NULL CONSTRAINT FK_dbo_Rifornimenti_IDDistributore FOREIGN KEY REFERENCES dbo.Distributore (IDDistributore),
    IDTipoCarburante CHAR(1) NOT NULL CONSTRAINT FK_dbo_Rifornimenti_IDTipoCarburante FOREIGN KEY REFERENCES dbo.TipoCarburante (IDTipoCarburante),
    ImportoEuro DECIMAL(10, 5) NOT NULL,
    PrezzoUnitario DECIMAL(10, 5) NOT NULL,
    QtaCarburante DECIMAL(10, 5) NOT NULL
);
GO

INSERT INTO dbo.Rifornimenti
(
    DataRifornimento,
    IDDistributore,
    IDTipoCarburante,
    ImportoEuro,
    PrezzoUnitario,
    QtaCarburante
)
SELECT
    CAST(LC.Data AS DATE) AS DataRifornimento,
    D.IDDistributore,
    'M' AS IDTipoCarburante,
    LC.EuroMetano AS ImportoEuro,
    LC.PrezzoMetano AS PrezzoUnitario,
    COALESCE(LC.KgMetano, LC.EuroMetano / LC.PrezzoMetano) AS QtaCarburante

FROM dbo.LogZafira LC
LEFT JOIN dbo.__LocalitaDistributore LD ON LD.LocalitaDistributore = LC.LocalitaDistributore
LEFT JOIN dbo.Distributore D ON D.Distributore = LD.DescrizioneNormalizzata
WHERE LC.EuroMetano IS NOT NULL

UNION ALL

SELECT
    CAST(LC.Data AS DATE) AS DataRifornimento,
    D.IDDistributore,
    'B' AS IDTipoCarburante,
    LC.EuroBenzina AS ImportoEuro,
    LC.PrezzoBenzina AS PrezzoUnitario,
    COALESCE(LC.LitriBenzina, LC.EuroBenzina / LC.PrezzoBenzina) AS QtaCarburante

FROM dbo.LogZafira LC
LEFT JOIN dbo.__LocalitaDistributore LD ON LD.LocalitaDistributore = LC.LocalitaDistributore
LEFT JOIN dbo.Distributore D ON D.Distributore = LD.DescrizioneNormalizzata
WHERE LC.EuroBenzina IS NOT NULL

ORDER BY DataRifornimento,
    IDTipoCarburante;
GO

DROP TABLE IF EXISTS dbo.Percorrenze;
GO

CREATE TABLE dbo.Percorrenze (
    IDPercorrenza INT IDENTITY(1, 1) NOT NULL CONSTRAINT PK_dbo_Percorrenze PRIMARY KEY CLUSTERED,
    DataPercorrenza DATE NOT NULL,
    IDTipoCarburante CHAR(1) NOT NULL CONSTRAINT FK_dbo_Percorrenze_IDTipoCarburante FOREIGN KEY REFERENCES dbo.TipoCarburante (IDTipoCarburante),
    QtaKm INT NOT NULL
);
GO

INSERT INTO dbo.Percorrenze
(
    IDTipoCarburante,
    DataPercorrenza,
    QtaKm
)
SELECT
    'M' AS IDTipoCarburante,
    CAST(LC.Data AS DATE) AS DataPercorrenza,
    LC.KmMetanoInt AS QtaKm

FROM dbo.LogZafira LC
WHERE LC.KmMetanoInt > 0

UNION ALL

SELECT
    'B' AS IDTipoCarburante,
    CAST(LC.Data AS DATE) AS DataPercorrenza,
    LC.KmBenzinaInt AS QtaKm

FROM dbo.LogZafira LC
WHERE LC.KmBenzinaInt > 0

ORDER BY DataPercorrenza,
    IDTipoCarburante;
GO

DROP TABLE IF EXISTS dbo.DimData;
GO

SELECT
    PKData,
    Data,
    DataDescrizione,
    DataEstesa,
    DataEstesaDescrizione,
    Anno,
    AnnoDescrizione,
    Mese,
    MeseDescrizione,
    MeseAnno,
    MeseAnnoDescrizione,
    DataNumerica

INTO dbo.DimData

FROM METRADW.MetraDW.Impostazioni.DimData
WHERE Data = CAST('19000101' AS DATE)
    OR Anno BETWEEN 2012 AND 2019;
GO

ALTER TABLE dbo.DimData ADD CONSTRAINT PK_dbo_DimData PRIMARY KEY CLUSTERED (PKData);
GO

ALTER TABLE dbo.Rifornimenti ADD CONSTRAINT FK_dbo_Rifornimenti_DataRifornimento FOREIGN KEY (DataRifornimento) REFERENCES dbo.DimData (PKData);
GO

ALTER TABLE dbo.Percorrenze ADD CONSTRAINT FK_dbo_Percorrenze_DataPercorrenza FOREIGN KEY (DataPercorrenza) REFERENCES dbo.DimData (PKData);
GO
