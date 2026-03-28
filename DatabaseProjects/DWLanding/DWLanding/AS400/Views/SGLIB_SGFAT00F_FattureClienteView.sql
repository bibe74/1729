
CREATE VIEW AS400.SGLIB_SGFAT00F_FattureClienteView
AS
SELECT
	-- Chiavi
	SGDIT,	-- CodiceAzienda
	SGDFA,	-- DataFattura
	SGNFA,	-- NumeroFattura
	SGKEY,	-- PKFattureCliente

	-- Dimensioni
	SGSTA,
	SGTRK,
	SGTOM,
	SGCLI,	-- CodiceCliente
	SGDBO,	-- DataDDT
	SGNBO,	-- NumeroDDT
	SGAGE,	-- CodiceAgente
	SGZON,
	SGPAR,	-- CodiceArticolo
	SGTAR,	-- CodiceTipoArticolo
	SGSER,	-- CodiceSerie
	SGLEG,	-- CodiceLega
	SGPRO,	-- CodiceProfilo
	SGLAV,	-- CodiceLavorazione
	SGLUB,	-- LunghezzaBarra
	SGMAR,
	'' AS IDAzienda,
	CASE
	  WHEN SGTAR = 'P' THEN SGPRO + RIGHT('   '+LTRIM(RTRIM(SGLAV)), 3) + RIGHT('00000'+LTRIM(RTRIM(SGLUB)), 5)
	  ELSE SGPAR
	END AS AliasAS400,
	SUBSTRING(SGAGE, 2, 2) AS CodiceGruppoVendite,

	-- Misure
	SGQTA,	-- Qta
	SGQTK,	-- QtaKg
	SGVAL,	-- CodiceValuta
	SGIMP,	-- Importo
	SGPRV,
	SGIMV

--FROM OPENQUERY(ALBERTO, '
--	SELECT
--		SGDIT, SGDFA, SGNFA, SGKEY,
--		SGSTA, SGTRK, SGTOM, SGCLI, SGDBO, SGNBO, SGAGE, SGZON, SGPAR, SGTAR, SGSER, SGLEG, SGPRO, SGLAV, SGLUB, SGMAR,
--		SGQTA, SGQTK, SGVAL, SGIMP, SGPRV, SGIMV
--	FROM SGLIB.SGFAT00F
--	WHERE SGSTA <> ''A''
--		AND SGDFA BETWEEN 20080101 AND 20160531
--	ORDER BY SGDIT, SGDFA, SGNFA, SGKEY
--');
FROM AS400_BACKUPS.AS400.SGLIB_SGFAT00F_FattureCliente;
GO

