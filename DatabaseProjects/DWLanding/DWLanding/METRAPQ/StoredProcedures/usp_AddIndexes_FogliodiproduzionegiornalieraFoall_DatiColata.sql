
CREATE PROCEDURE METRAPQ.usp_AddIndexes_FogliodiproduzionegiornalieraFoall_DatiColata
AS
BEGIN
SET NOCOUNT ON;

CREATE UNIQUE NONCLUSTERED INDEX IX_METRAPQ_FogliodiproduzionegiornalieraFoall_DatiColata_Colata ON METRAPQ.FogliodiproduzionegiornalieraFoall_DatiColata (Colata);

END;
GO

