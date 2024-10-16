WITH cleaned_data AS (
    SELECT
        * EXCEPT (departamento, municipio, sexo, ubicacion_caso, estado, recuperado, tipo_recuperacion),

        
        -- Aplicación del macro en las columnas seleccionadas
        {{ normalize_text('departamento', 'upper') }} AS departamento,
        {{ normalize_text('municipio', 'upper') }} AS municipio,
        {{ normalize_text('sexo', 'upper') }} AS sexo,
        {{ normalize_text('ubicacion_caso', 'title') }} AS ubicacion_caso,
        {{ normalize_text('estado', 'title') }} AS estado,
        {{ normalize_text('recuperado', 'title') }} AS recuperado,
        {{ normalize_text('tipo_recuperacion', 'upper') }} AS tipo_recuperacion

    FROM {{ ref('select_rename_cols') }}
)
SELECT * FROM cleaned_data
