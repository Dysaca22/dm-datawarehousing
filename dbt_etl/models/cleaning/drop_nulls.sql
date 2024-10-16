WITH tab AS (
    SELECT *
    FROM {{ ref('special') }}
)

SELECT * 
FROM (
    {{ filter_nulls('tab', ['id', 'fecha_reporte_web', 'fecha_notificacion', 'fecha_inicio_sintomas', 'edad', 'sexo', 'estado']) }}
) AS filtered_data
