WITH moda_ubicacion_caso AS (
    -- Calcular la moda para la columna 'ubicacion_caso'
    SELECT ubicacion_caso, COUNT(*) AS frecuencia
    FROM {{ ref('replace') }}
    WHERE ubicacion_caso IS NOT NULL
    GROUP BY ubicacion_caso
    ORDER BY frecuencia DESC
    LIMIT 1
),
moda_tipo_recuperacion AS (
    -- Calcular la moda para la columna 'tipo_recuperacion'
    SELECT tipo_recuperacion, COUNT(*) AS frecuencia
    FROM {{ ref('replace') }}
    WHERE tipo_recuperacion IS NOT NULL
    GROUP BY tipo_recuperacion
    ORDER BY frecuencia DESC
    LIMIT 1
),
imputacion_datos AS (
    -- Reemplazar valores nulos con la moda calculada
    SELECT
        * EXCEPT(ubicacion_caso, tipo_recuperacion),
        -- Si 'ubicacion_caso' es NULL, reemplazar por la moda
        COALESCE(ubicacion_caso, (SELECT ubicacion_caso FROM moda_ubicacion_caso)) AS ubicacion_caso,
        -- Si 'tipo_recuperacion' es NULL, reemplazar por la moda
        COALESCE(tipo_recuperacion, (SELECT tipo_recuperacion FROM moda_tipo_recuperacion)) AS tipo_recuperacion
    FROM {{ ref('replace') }}
)
SELECT * FROM imputacion_datos
