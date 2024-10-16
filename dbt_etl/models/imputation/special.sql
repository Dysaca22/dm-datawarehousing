WITH moda_estado AS (
    -- Calcular la moda (valor más frecuente) de la columna 'estado'
    SELECT estado, COUNT(*) AS frecuencia
    FROM {{ ref('mode') }}
    WHERE estado IS NOT NULL
    GROUP BY estado
    ORDER BY frecuencia DESC
    LIMIT 1
),
imputacion_datos AS (
    SELECT
        -- Imputación para la columna 'recuperado'
        CASE 
            WHEN fecha_recuperacion IS NOT NULL THEN 'Recuperado'
            WHEN fecha_muerte IS NOT NULL THEN 'Fallecido'
            ELSE 'Activo'
        END AS recuperado,

        -- Imputación para la columna 'estado'
        CASE 
            WHEN fecha_muerte IS NOT NULL THEN 'Fallecido'
            WHEN estado IS NULL THEN (SELECT estado FROM moda_estado) -- Reemplazar NULL con la moda
            ELSE estado
        END AS estado,

        -- Otras columnas sin cambios
        * EXCEPT(recuperado, estado)
    FROM {{ ref('mode') }}
)
SELECT * FROM imputacion_datos
