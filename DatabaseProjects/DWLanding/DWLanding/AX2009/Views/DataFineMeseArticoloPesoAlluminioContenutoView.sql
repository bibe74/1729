/**
 * @table AX2009.DataFineMeseArticoloPesoAlluminioContenuto
 * @description 

 * @depends 

SELECT TOP 1 * FROM 
*/

CREATE   VIEW AX2009.DataFineMeseArticoloPesoAlluminioContenutoView
AS
SELECT
    -- Chiavi
    DATAAREAID,
    ITEMID,
    TRANSDATE,

    -- Dimensioni
    PRICECALCID,

    -- Misure
    ItemCount,
    NetWeight,
    NetWeight_New

FROM [AXSQL\AX2009].views.AX2009.DataFineMeseArticoloPesoAlluminioContenuto;
GO

