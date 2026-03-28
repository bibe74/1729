
CREATE VIEW AX2009.AIFENDPOINTCONSTRAINT_AIFEndPointConstraintView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    ENDPOINTID,        -- IDAIFEndPointConstraint
    CONSTRAINTID,        -- IDConstraint
    RECID,        -- PKAIFEndPointConstraint

    -- Dimensioni
    CONSTRAINTTYPE        -- IDTipoConstraint [enum AifConstraintType]

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.AIFENDPOINTCONSTRAINT;
GO

