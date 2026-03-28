
CREATE PROCEDURE RRDP.usp_AddIndexes_RaccoltaDatiLotto_Billette
AS
BEGIN
SET NOCOUNT ON;

CREATE UNIQUE NONCLUSTERED INDEX IX_RRDP_RaccoltaDatiLotto_Billette_ID ON RRDP.RaccoltaDatiLotto_Billette (ID);

END;
GO

