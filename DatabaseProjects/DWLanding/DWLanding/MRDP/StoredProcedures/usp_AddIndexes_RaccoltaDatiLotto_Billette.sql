
CREATE PROCEDURE MRDP.usp_AddIndexes_RaccoltaDatiLotto_Billette
AS
BEGIN
SET NOCOUNT ON;

CREATE UNIQUE NONCLUSTERED INDEX IX_MRDP_RaccoltaDatiLotto_Billette_ID ON MRDP.RaccoltaDatiLotto_Billette (ID);

END;
GO

