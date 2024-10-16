WITH imputacion_fechas AS (
    SELECT * EXCEPT(fecha_diagnostico),
        COALESCE(fecha_diagnostico, fecha_reporte_web) AS fecha_diagnostico
    FROM {{ ref('normalize') }}
)

SELECT * FROM imputacion_fechas
