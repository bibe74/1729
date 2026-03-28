
CREATE PROCEDURE CANADAPQ.usp_AddIndexes_FogliodiproduzionegiornalieraFoall_DatiColata
AS
BEGIN
SET NOCOUNT ON;

CREATE UNIQUE NONCLUSTERED INDEX IX_CANADAPQ_FogliodiproduzionegiornalieraFoall_DatiColata_Colata ON CANADAPQ.FogliodiproduzionegiornalieraFoall_DatiColata (Colata);

END;
GO

