
CREATE VIEW AX2009.NPOCUSTVENDRATINGRELATION_ClienteFornitoreGruppoRatingView
AS
SELECT
	-- Chiavi
	PARTYID,		-- IDRubrica
	RECID,		-- PKClienteFornitoreGruppoRating

	-- Dimensioni
	RATINGREFTYPE,		-- IDTipoRiferimentoRating [enum NPORatingRefType]
	RATINGREFID,		-- IDCliente/IDFornitore
	RATINGID,		-- RatingCliente/RatingFornitore
	DATEFROM,		-- DataInizio
	DATETO		-- DataFine

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOCUSTVENDRATINGRELATION;
GO

