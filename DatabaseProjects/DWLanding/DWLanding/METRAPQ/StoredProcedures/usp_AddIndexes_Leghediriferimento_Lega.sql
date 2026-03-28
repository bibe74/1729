
CREATE PROCEDURE METRAPQ.usp_AddIndexes_Leghediriferimento_Lega
AS
BEGIN
SET NOCOUNT ON;

CREATE UNIQUE NONCLUSTERED INDEX IX_METRAPQ_Leghediriferimento_Lega_Lega ON METRAPQ.Leghediriferimento_Lega (Lega);

END;
GO

