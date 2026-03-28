/**
 * @function INTELCO.ufn_DatiTimbratura
 * @description Trascodifica la stringa E*03/07/2024*807 in E/2024-07-03 08:07:00

*/

CREATE   FUNCTION INTELCO.ufn_DatiTimbratura (
	@txt NVARCHAR(50)
)
RETURNS @ret TABLE
(	
	Verso NCHAR(1) NULL,
	Data DATE NULL,
	Ora TINYINT NULL,
	Minuto TINYINT NULL,
	DataOra	DATETIME NULL
)
AS
BEGIN
	DECLARE @ver_acc NCHAR(1);
	DECLARE @data_acc NVARCHAR(10);
	DECLARE @ora_acc NVARCHAR(4);

	SELECT
		@ver_acc = [1],
		@data_acc = [2],
		@ora_acc = [3]
	FROM(
		SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) Id, Item
		FROM MetraDW.Util.SplitStrings(@txt, '*')
	) As tbl
	PIVOT
	(
	   MAX(Item)
	   FOR Id IN([1],[2],[3])
	) As pivotTable
	
	INSERT INTO @ret
	(
	    Verso,
	    Data,
	    Ora,
	    Minuto,
	    DataOra
	)
	SELECT
		@ver_acc,
		NULLIF(CONVERT(DATETIME, @data_acc, 103), '19000101'),
		CONVERT(INT, @ora_acc) / 100,
		CONVERT(INT, @ora_acc) % 100,
		NULLIF(DATEADD(
			MINUTE,
			CONVERT(INT, @ora_acc) % 100,
			DATEADD(
				HOUR,
				CONVERT(INT, @ora_acc) / 100 ,
				CONVERT(DATETIME, @data_acc, 103))
			), '19000101');

	RETURN;
END
GO

