
CREATE PROCEDURE CANADAPQ.usp_AddIndexes_Leghediriferimento_Lega
AS
BEGIN
SET NOCOUNT ON;

CREATE UNIQUE NONCLUSTERED INDEX IX_CANADAPQ_Leghediriferimento_Lega_Lega ON CANADAPQ.Leghediriferimento_Lega (Lega);

END;
GO

