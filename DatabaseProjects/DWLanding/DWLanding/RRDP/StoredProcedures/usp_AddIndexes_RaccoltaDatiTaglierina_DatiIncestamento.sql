
CREATE PROCEDURE RRDP.usp_AddIndexes_RaccoltaDatiTaglierina_DatiIncestamento
AS
BEGIN
SET NOCOUNT ON;

CREATE NONCLUSTERED INDEX IX_RRDP_RaccoltaDatiTaglierina_DatiIncestamento_NumeroLotto_NumeroCesta ON RRDP.RaccoltaDatiTaglierina_DatiIncestamento (NumeroLotto, NumeroCesta);

END;
GO

