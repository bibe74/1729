
CREATE VIEW AX2009.BOMCALCTRANS_CalcoloDBA_RigaView
AS
SELECT
	-- Chiavi
	BCT.DATAAREAID,				-- IDAzienda
	BCT.PRICECALCID,			-- IDCalcoloDBA
	BCT.LINENUM,				-- NumeroRiga
	BCT.RECID,					-- PKCalcoloDBA_Riga

	-- Dimensioni
	BCT.COSTGROUPID,			-- IDGruppoCosti
	BCT.LEVEL_,					-- Livello
	BCT.QTY,					-- Qta
	BCT.COSTPRICE,				-- CostoUnitario
	BCT.TRANSDATE,				-- DataTransazione
	BCT.KEY1,					-- ArticoloCentroDiLavoro
	BCT.KEY2,					-- IDUnitaDiMisura
	BCT.KEY3,					-- Operazione
	BCT.CONSUMPTIONVARIABLE,	-- ConsumoRiga
	BCT.OPRNUM,					-- NumeroOperazione
	BCT.CALCTYPE,				-- IDTipoCalcolo [enum ItemCalcType]
	BCT.COSTPRICEUNIT,			-- UnitaDiCosto
	BCT.COSTPRICEQTY,			-- ImportoCostiUnitario
	BCT.COSTMARKUPQTY,			-- ImportoSpeseVarie

	-- Extra (rimuovere dopo la migrazione)
	CAST(0 AS BIGINT) AS PARENTRECID,
	CAST(1 AS BIT) AS IsFoglia,
	CAST(0 AS BIGINT) AS SERVICEITEMRECID,

    BCT.CONSUMPTIONCONSTANT     -- ConsumoRigaCostante

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.BOMCALCTRANS BCT
INNER JOIN (
	SELECT DISTINCT
		DATAAREAID,
		PRICECALCID
	FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTITEMPRICE
	WHERE DATAAREAID IN (N'mspa', N'imet', N'mrag', N'malu')

	UNION

	SELECT DISTINCT
		DATAAREAID,
		PRICECALCID
	FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTITEMPRICESIM
	WHERE DATAAREAID IN (N'mspa', N'imet', N'mrag', N'malu')
) PCIV ON BCT.DATAAREAID = PCIV.DATAAREAID AND BCT.PRICECALCID = PCIV.PRICECALCID
WHERE BCT.TRANSDATE >= CAST('20230101' AS DATETIME);
GO

