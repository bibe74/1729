
CREATE   PROCEDURE audit.usp_RebuildIndexes_RDP
AS
BEGIN

ALTER INDEX ALL ON IRDP.CausaliChiusuraLotto_CausaleChiusuraLotto REBUILD;
ALTER INDEX ALL ON IRDP.CausaliFermoMacchina_CausaleFermoMacchina REBUILD;
ALTER INDEX ALL ON IRDP.CausaliMicrofermoMacchina_CausaleMicroFermoMacchina REBUILD;
ALTER INDEX ALL ON IRDP.DataTurno_DataTurno REBUILD;
ALTER INDEX ALL ON IRDP.FermiMacchina_FermiMacchina REBUILD;
ALTER INDEX ALL ON IRDP.Presse_Pressa REBUILD;
ALTER INDEX ALL ON IRDP.RaccoltaDatiLotto_Billette REBUILD;
ALTER INDEX ALL ON IRDP.RaccoltaDatiLotto_Lotti_Lotti REBUILD;
ALTER INDEX ALL ON IRDP.RaccoltaDatiTaglierina_DatiIncestamento REBUILD;
ALTER INDEX ALL ON IRDP.ScartiCesoia_ScartiCesoia REBUILD;
ALTER INDEX ALL ON MRDP.CaricamentoBillettePressa_Carico_CaricoBillette REBUILD;
ALTER INDEX ALL ON MRDP.CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette REBUILD;
ALTER INDEX ALL ON MRDP.CausaliChiusuraLotto_CausaleChiusuraLotto REBUILD;
ALTER INDEX ALL ON MRDP.CausaliFermoMacchina_CausaleFermoMacchina REBUILD;
ALTER INDEX ALL ON MRDP.CausaliMicrofermoMacchina_CausaleMicroFermoMacchina REBUILD;
ALTER INDEX ALL ON MRDP.DataTurno_DataTurno REBUILD;
ALTER INDEX ALL ON MRDP.FermiMacchina_FermiMacchina REBUILD;
ALTER INDEX ALL ON MRDP.Presse_Pressa REBUILD;
ALTER INDEX ALL ON MRDP.RaccoltaDatiLotto_Billette REBUILD;
ALTER INDEX ALL ON MRDP.RaccoltaDatiLotto_Billette_CalcoliBillette REBUILD;
ALTER INDEX ALL ON MRDP.RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto REBUILD;
ALTER INDEX ALL ON MRDP.RaccoltaDatiLotto_Lotti_Lotti REBUILD;
ALTER INDEX ALL ON MRDP.RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini REBUILD;
ALTER INDEX ALL ON MRDP.RaccoltaDatiTaglierina_DatiIncestamento REBUILD;
ALTER INDEX ALL ON MRDP.ScartiCesoia_ScartiCesoia REBUILD;
ALTER INDEX ALL ON RRDP.CausaliChiusuraLotto_CausaleChiusuraLotto REBUILD;
ALTER INDEX ALL ON RRDP.CausaliFermoMacchina_CausaleFermoMacchina REBUILD;
ALTER INDEX ALL ON RRDP.CausaliMicrofermoMacchina_CausaleMicroFermoMacchina REBUILD;
ALTER INDEX ALL ON RRDP.DataTurno_DataTurno REBUILD;
ALTER INDEX ALL ON RRDP.FermiMacchina_FermiMacchina REBUILD;
ALTER INDEX ALL ON RRDP.Presse_Pressa REBUILD;
ALTER INDEX ALL ON RRDP.RaccoltaDatiLotto_Billette REBUILD;
ALTER INDEX ALL ON RRDP.RaccoltaDatiLotto_Billette_CalcoliBillette REBUILD;
ALTER INDEX ALL ON RRDP.RaccoltaDatiLotto_Lotti_Lotti REBUILD;
ALTER INDEX ALL ON RRDP.RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini REBUILD;
ALTER INDEX ALL ON RRDP.RaccoltaDatiTaglierina_DatiIncestamento REBUILD;
ALTER INDEX ALL ON RRDP.ScartiCesoia_ScartiCesoia REBUILD;

END;
GO

