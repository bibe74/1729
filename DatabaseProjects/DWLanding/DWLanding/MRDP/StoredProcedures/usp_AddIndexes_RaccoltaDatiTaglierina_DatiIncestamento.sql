
CREATE PROCEDURE MRDP.usp_AddIndexes_RaccoltaDatiTaglierina_DatiIncestamento
AS
BEGIN
SET NOCOUNT ON;

CREATE NONCLUSTERED INDEX IX_MRDP_RaccoltaDatiTaglierina_DatiIncestamento_NumeroLotto_NumeroCesta ON MRDP.RaccoltaDatiTaglierina_DatiIncestamento (NumeroLotto, NumeroCesta);

END;
GO

