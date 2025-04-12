/*
 * https://www.mssqltips.com/sqlservertip/8213/calculating-matrix-inverse-in-sql-server/
*/

CREATE TYPE [dbo].[uttMtxIndexed] AS TABLE(
   [lin] [smallint] NULL,
   [col] [smallint] NULL,
   [val] [float] NULL
)
GO

-- =============================================
-- Author:      SCP - MSSQLTips
-- Create date: 20241112
-- Description: Cleanup String
-- =============================================
CREATE FUNCTION [dbo].[ufnMtxFlatCleanup] 
            (@String varchar(MAX))
RETURNS nvarchar(MAX)
WITH EXECUTE AS CALLER
AS
BEGIN
   IF LEN(@String) = 0 
      RETURN '';
 
   WHILE @String LIKE '%  %' OR @String LIKE '%; %' OR @String LIKE '% ;%' BEGIN
      -- Replace double spaces with a single space
      IF @String LIKE '%  %'
         SET @String = REPLACE(@String,'  ',' ');
 
      -- Remove space after opening parenthesis
      IF @String LIKE '%; %'
         SET @String = REPLACE(@String,'; ',';');
 
      -- Remove space before closing parenthesis
      IF @String LIKE '% ;%'
         SET @String = REPLACE(@String,' ;',';');
   END
 
   WHILE PATINDEX('%[^0-9 .;+-]%', @String) > 0 BEGIN
      SET @String = REPLACE(@String, SUBSTRING(@String, PATINDEX('%[^0-9 .;+-]%', @String), 1), '')
   END
 
   IF @String LIKE '%;'
      SET @String = LEFT(@String,LEN(@String)-1);
 
    RETURN @String;
END
GO

-- =============================================
-- Author:      SCP - MSSQLTips
-- Create date: 20241110
-- Description: Data to Matrix format
-- =============================================
CREATE FUNCTION [dbo].[tvfMtxIndexed] 
         (@DataValues varchar(MAX))
RETURNS @Output 
   TABLE (lin int
         ,col int
         ,val float) 
WITH EXECUTE AS CALLER 
AS
BEGIN
   SET  @DataValues = [dbo].[ufnMtxFlatCleanup] (@DataValues);
 
   DECLARE @InputData [varchar](200)
         ,@Row int = 1
         ,@Column int
         ,@i int = 1
         ,@c numeric(18,6);
 
   DECLARE cursorTab CURSOR FAST_FORWARD READ_ONLY FOR 
      SELECT value FROM string_split(@DataValues,';');
 
   OPEN cursorTab
      FETCH NEXT FROM cursorTab INTO @InputData;
 
      WHILE @@FETCH_STATUS = 0
         BEGIN
            INSERT INTO @Output
               SELECT @Row
                        ,ROW_NUMBER() OVER (ORDER BY (SELECT NULL))  
                        ,value
                  FROM string_split(@InputData,' ');   
 
            FETCH NEXT FROM cursorTab INTO @InputData;
 
            SET @Row += 1;
         END
   CLOSE cursorTab
   DEALLOCATE cursorTab
 
   RETURN;
END
GO

-- =============================================
-- Author:      SCP - MSSQLTips
-- Create date: 20241112
-- Description: Matrix Row Math Operation
-- =============================================
CREATE FUNCTION [dbo].[tvfMtxMathRowOp] 
         (@DataValues AS [dbo].[uttMtxIndexed] READONLY
         ,@RowFrom smallint
         ,@RowTo smallint
         ,@Number float)
RETURNS @Output 
   TABLE (lin int
         ,col int
         ,val float) 
WITH EXECUTE AS CALLER 
AS
BEGIN
   IF @RowFrom < 0 OR 
      @RowTo < 0 OR
      ISNUMERIC(@Number) = 0 OR
      (SELECT COUNT(*) 
         FROM @DataValues) = 0
       RETURN;
 
   INSERT INTO @Output
      SELECT [lin]
               ,[col]
               ,[val]
         FROM @DataValues;
 
   UPDATE    @Output
      SET       [val] += (SELECT @Number * [val] 
                           FROM @Output X
                           WHERE X.lin = @RowFrom AND
                                  X.col = [@Output].[col])
      WHERE    [lin] = @RowTo;
 
   RETURN;
END
GO

-- =============================================
-- Author:      SCP - MSSQLTips
-- Create date: 20241112
-- Description: Matrix to String format
-- =============================================
CREATE FUNCTION [dbo].[ufnMtxToString] 
         (@Input AS [dbo].[uttMtxIndexed] READONLY
         ,@Vetor AS [dbo].[uttMtxIndexed] READONLY)
RETURNS nvarchar(MAX) 
WITH EXECUTE AS CALLER 
AS
BEGIN
   DECLARE @MtxString nvarchar(MAX) = '';
 
   DECLARE @i int = 1;
   WHILE @i <= (SELECT MAX([col]) FROM @Input) BEGIN
      DECLARE @j int = 1;
      WHILE @j <= (SELECT MAX([lin]) FROM @Input) BEGIN
         SET @MtxString += (SELECT CONCAT([val],' ')
                        FROM @Input
                        WHERE [lin] = @i AND
                               [col] = @j);
         SET @j += 1;
      END
 
      IF EXISTS (SELECT 1 FROM @Vetor)
         SET @MtxString += (SELECT    CONCAT([val],' ')
                           FROM @Vetor
                           WHERE [col] = @i);
 
      IF @i < (SELECT MAX([col]) FROM @Input)
         SET @MtxString = TRIM(@MtxString) + ';';
      ELSE
         SET @MtxString = TRIM(@MtxString);
 
      SET @i += 1;
   END
 
   RETURN @MtxString;
END
GO

-- =============================================
-- Author:      SCP - MSSQLTips
-- Create date: 20241112
-- Description: Matrix x Matrix multiplication
-- =============================================
CREATE FUNCTION [dbo].[tvfMtxMtxMult] 
            (@MatrixA AS [dbo].[uttMtxIndexed] READONLY
            ,@MatrixB AS [dbo].[uttMtxIndexed] READONLY)
RETURNS    @Output 
   TABLE    (lin int
            ,col int
            ,val float) 
WITH EXECUTE AS CALLER 
AS
BEGIN
   IF (SELECT MAX([col]) FROM @MatrixA) <> (SELECT MAX([lin]) FROM @MatrixB)
      RETURN;
 
   INSERT INTO    @Output
      SELECT    A.lin
                  ,B.col
                  ,SUM(A.val * B.val)
         FROM    @MatrixA A JOIN 
                   @MatrixB B ON 
                   A.col = B.lin
         GROUP BY A.lin, B.col;
 
   RETURN;
END
GO

-- =============================================
-- Author:      SCP - MSSQLTips
-- Create date: 20241101
-- Description: Gauss-Seidel Linear equation
-- =============================================
CREATE FUNCTION  [dbo].[tvfGaussSeidel] 
            (@DataValues varchar(MAX))
RETURNS  @Solut  TABLE 
            (Xi int
            ,Val decimal(18,6)) 
WITH EXECUTE AS CALLER 
AS
BEGIN
 
   DECLARE @InputData [varchar](200)
            ,@Row int = 1
            ,@Column int
            ,@i int = 1
            ,@c numeric(18,6);
 
   DECLARE @DataRaw 
      TABLE (lin int
            ,col int
            ,val numeric(18,6));
 
   DECLARE cursorTab CURSOR FAST_FORWARD READ_ONLY FOR 
      SELECT value FROM string_split(@DataValues,';');
 
   OPEN cursorTab
      FETCH NEXT FROM cursorTab INTO @InputData;
 
      WHILE @@FETCH_STATUS = 0
         BEGIN
            INSERT INTO @DataRaw
               SELECT @Row
                        ,ROW_NUMBER() OVER (ORDER BY (SELECT NULL))  
                        ,value
                  FROM string_split(@InputData,' ');   
 
            FETCH NEXT FROM cursorTab INTO @InputData;
 
            SET @Row += 1;
         END
   CLOSE cursorTab
   DEALLOCATE cursorTab
 
   SELECT @Row = MAX(lin)
            ,@Column = MAX(col)
      FROM @DataRaw;
 
   WHILE @i <= @Row BEGIN
      SELECT @c = val
         FROM @DataRaw
         WHERE lin = @i AND
                lin = col;
 
      UPDATE @DataRaw
         SET    val /= @c
         WHERE lin = @i AND
                @c <> 0;
 
         UPDATE @DataRaw
            SET    val -= (SELECT val FROM @DataRaw Q WHERE lin = @i AND q.col = [@DataRaw].col) *
                        (SELECT val FROM @DataRaw W WHERE col = @i AND w.lin = [@DataRaw].lin)
            WHERE lin <> @i;
 
         SET @i += 1;
   END
 
   INSERT INTO @Solut
      SELECT lin
               ,val
         FROM @DataRaw 
         WHERE col = @Column;
 
   RETURN;
END
GO

-- =============================================
-- Author:      SCP - MSSQLTips
-- Create date: 20241115
-- Description: Matrix Inverse Calculation
-- =============================================
CREATE PROCEDURE [dbo].[uspMtxInverse] 
            (@DataValues varchar(MAX))
AS
BEGIN
   SET NOCOUNT ON;
   BEGIN TRY
      IF LEN(@DataValues) = 0
         RETURN;
 
      SET  @DataValues = [dbo].[ufnMtxFlatCleanup] (@DataValues);
 
      DECLARE    @Output    AS [dbo].[uttMtxIndexed]
                  ,@Input   AS [dbo].[uttMtxIndexed]
                  ,@MtxL    AS [dbo].[uttMtxIndexed]
                  ,@MtxLInv AS [dbo].[uttMtxIndexed]
                  ,@MtxU    AS [dbo].[uttMtxIndexed]
                  ,@MtxUInv AS [dbo].[uttMtxIndexed]
                  ,@Vector  AS [dbo].[uttMtxIndexed]
                  ,@MmtIxO  AS [dbo].[uttMtxIndexed];
 
      INSERT INTO @Input
         SELECT [lin]
                  ,[col]
                  ,[val]
            FROM [dbo].[tvfMtxIndexed] (@DataValues);
 
      IF (SELECT MAX([col]) FROM @Input) <> (SELECT MAX([lin]) FROM @Input) BEGIN
         PRINT 'Number of rows does not match with the number of columns!'
         RETURN;
      END
 
      INSERT INTO @MtxU
         SELECT [lin]
                  ,[col]
                  ,[val]
            FROM @Input;
 
      INSERT INTO @MtxL
         SELECT [lin]
                  ,[col]
                  ,CASE WHEN [lin] = [col] THEN 1 ELSE 0 END
            FROM @Input;
 
      DECLARE @i smallint = 1;
      WHILE @i <= (SELECT MAX([lin]) FROM @MtxU) BEGIN
         DECLARE @ValR1 float = 
                  (SELECT [val] 
                     FROM @MtxU
                     WHERE [lin] = @i AND
                              [col] = @i); 
 
         IF @ValR1 = 0 BEGIN
            SELECT 'The matrix cannot be decomposed without modifications because it contains a zero pivot'
            RETURN 
         END
      
         DECLARE @j smallint = @i + 1;
         WHILE @j <= (SELECT MAX([lin]) FROM @MtxU) BEGIN
            DECLARE @ValR2 float = 
                     (SELECT   -[val] / @ValR1 
                        FROM @MtxU
                        WHERE [lin] = @j AND
                                 [col] = @i);
 
            UPDATE @MtxU
               SET    [val] = 
                     (SELECT [val] 
                        FROM [dbo].[tvfMtxMathRowOp] (@MtxU,@i,@j,@ValR2) X
                        WHERE X.col = [@MtxU].[col] AND
                                 X.lin = @j)
               WHERE [lin] = @j;
 
            UPDATE @MtxL
               SET    [val] = -@ValR2
               WHERE [lin] = @j AND
                        [col] = @i;
 
            SET @j += 1;
         END
 
         SET @i += 1;
      END
 
      SET @i = 1;
      WHILE @i <= (SELECT MAX([lin]) FROM @MtxU) BEGIN
         DECLARE @VectorStr nvarchar(MAX) = REPLICATE('0 ',(SELECT MAX([lin]) FROM @MtxU));
         SET @VectorStr = TRIM(STUFF(@VectorStr, 2 * @i - 1, 1, N'1'));
 
         INSERT INTO @Vector
            SELECT [lin]
                     ,[col]
                     ,[val]
               FROM [dbo].[tvfMtxIndexed] (@VectorStr);    
 
         INSERT INTO @MtxUInv
            SELECT Xi,@i AS Xj,Val 
               FROM [dbo].[tvfGaussSeidel] ((SELECT [dbo].[ufnMtxToString] (@MtxU,@Vector)));
 
         INSERT INTO @MtxLInv
            SELECT Xi,@i AS Xj,Val 
               FROM [dbo].[tvfGaussSeidel] ((SELECT [dbo].[ufnMtxToString] (@MtxL,@Vector)));
 
         DELETE FROM @Vector;
 
         SET @i += 1;
      END
 
      DECLARE @Det float = 1;
 
      SELECT @Det *= [val]
         FROM @MtxU
         WHERE [lin] = [col];
 
      INSERT INTO @Output
         SELECT * FROM [dbo].[tvfMtxMtxMult] (@MtxUInv,@MtxLInv);
 
      INSERT INTO @MmtIxO
         SELECT * FROM [dbo].[tvfMtxMtxMult] (@Input,@Output);
 
      SELECT 'Matrix A        ' AS Item,@DataValues AS 'Values (col by spaces, row by semicolons)'
         UNION ALL
      SELECT 'Determinant of A', CONVERT(nvarchar(50),@Det) AS Determinant
         UNION ALL
      SELECT 'Matrix A Inversa', [dbo].[ufnMtxToString] (@Output,@Vector) AS MtxInverse
         UNION ALL
      SELECT 'Matrix A * A Inv' ,[dbo].[ufnMtxToString] (@MmtIxO,@Vector) AS MtxAxAinv
         UNION ALL
      SELECT 'Matrix A Lower  ',[dbo].[ufnMtxToString] (@MtxL,@Vector) AS MtxLower
         UNION ALL
      SELECT 'Matrix A Upper  ',[dbo].[ufnMtxToString] (@MtxU,@Vector) AS MtxUpper;
 
      RETURN;
   END TRY
   BEGIN CATCH
      IF @@TRANCOUNT > 0
         BEGIN
            ROLLBACK TRANSACTION;
         END
 
         -- Print error information. 
         PRINT   'Error: ' + CONVERT(varchar(50), ERROR_NUMBER()) +
               ', Severity: ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
               ', State: ' + CONVERT(varchar(5), ERROR_STATE()) + 
               ', Procedure: ' + ISNULL(ERROR_PROCEDURE(), '-') + 
               ', Line: ' + CONVERT(varchar(5), ERROR_LINE());
 
         PRINT ERROR_MESSAGE();
   END CATCH;
END
GO

EXEC dbo.uspMtxInverse '2 1 1;4 3 3;8 7 9';
GO

EXEC dbo.uspMtxInverse @DataValues = '1 0 0;0 1 0;0 0 1';
GO

EXEC dbo.uspMtxInverse @DataValues = '1 0 -2;4 3 1;3 2 2';
GO
