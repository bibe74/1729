SELECT * FROM dbo.Distributore;

SELECT * FROM dbo.Percorrenze;

SELECT * FROM dbo.Rifornimenti;
GO

CREATE OR ALTER PROCEDURE dbo.usp_LogRifornimento (
    @KmTotali INT,
    @DataRifornimento DATE = NULL,
    @IDDistributore INT,
    @IDTipoCarburante CHAR(1) = 'M',
    @ImportoEuro DECIMAL(10, 5),
    @PrezzoUnitario DECIMAL(10, 5)
)
AS
BEGIN

    SET NOCOUNT ON;

    DECLARE @KmAttuali INT;
    DECLARE @QtaKm INT;

    SELECT @KmAttuali = COALESCE(SUM(QtaKm), 0) FROM dbo.Percorrenze;

    SELECT @KmAttuali;

    IF (@KmTotali < @KmAttuali) RETURN 1;

    IF ((@KmAttuali - @KmTotali) > 400) RETURN 1;

    SET @QtaKm = @KmTotali - @KmAttuali;

    IF (@DataRifornimento IS NULL) SET @DataRifornimento = CAST(CURRENT_TIMESTAMP AS DATE);

    IF (@IDTipoCarburante NOT IN ('M', 'B')) RETURN 1;

    SELECT 'OK'

    /*
    INSERT INTO dbo.Rifornimenti
    (
        DataRifornimento,
        IDDistributore,
        IDTipoCarburante,
        ImportoEuro,
        PrezzoUnitario,
        QtaCarburante
    )
    VALUES
    (   GETDATE(), -- DataRifornimento - date
        0,         -- IDDistributore - int
        '',        -- IDTipoCarburante - char(1)
        NULL,      -- ImportoEuro - decimal(10, 5)
        NULL,      -- PrezzoUnitario - decimal(10, 5)
        NULL       -- QtaCarburante - decimal(10, 5)
    );
    */

END;
GO

EXEC dbo.usp_LogRifornimento @KmTotali = 0,            -- int
                             @DataRifornimento = NULL, -- date
                             @IDDistributore = 0,      -- int
                             @IDTipoCarburante = 'M',  -- char(1)
                             @ImportoEuro = NULL,      -- decimal(10, 5)
                             @PrezzoUnitario = NULL    -- decimal(10, 5)
