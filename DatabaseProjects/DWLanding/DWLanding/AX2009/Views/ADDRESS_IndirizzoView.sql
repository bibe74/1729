
CREATE VIEW AX2009.ADDRESS_IndirizzoView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	RECID,		-- PKIndirizzo

	-- Dimensioni
	ADDRTABLEID,		-- ADDRTABLEID
	ADDRRECID,		-- ADDRRECID
	TYPE,		-- IDTipoIndirizzo [enum AddressType]
	NAME,		-- Nome
	ADDRESS,		-- Indirizzo
	COUNTRYREGIONID,		-- IDNazione
	ZIPCODE,		-- CodicePostale
	STATE,		-- IDRegione
	COUNTY,		-- IDProvincia
	CITY,		-- Citta
	STREET		-- NomeVia

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.ADDRESS;
GO

