
CREATE VIEW MRDP.DataTurno_DataTurnoView
AS
SELECT
    -- Chiavi
    PKDataTurno,        -- PKDataTurno

    -- Dimensioni
    PKData,        -- PKData
    IDTurno,        -- IDTurno
    Turno,        -- Turno
    DateTimeStart,        -- DateTimeStart
    DateTimeEnd        -- DateTimeEnd

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.dbo.DataTurno;
GO

