WITH raw_data AS (
    SELECT
        `ID_de_caso` AS id,
        `fecha_reporte_web` AS fecha_reporte_web,
        `Fecha_de_notificaci__n` AS fecha_notificacion,
        `C__digo_DIVIPOLA_departamento` AS cod_departamento,
        `Nombre_departamento` AS departamento,
        `C__digo_DIVIPOLA_municipio` AS cod_municipio,
        `Nombre_municipio` AS municipio,
        Edad AS edad,
        `Unidad_de_medida_de_edad` AS unidad_medida_edad,
        Sexo AS sexo,
        `Tipo_de_contagio` AS tipo_contagio,
        `Ubicaci__n_del_caso` AS ubicacion_caso,
        Estado AS estado,
        Recuperado AS recuperado,
        `Fecha_de_inicio_de_s__ntomas` AS fecha_inicio_sintomas,
        `Fecha_de_muerte` AS fecha_muerte,
        `Fecha_de_diagn__stico` AS fecha_diagnostico,
        `Fecha_de_recuperaci__n` AS fecha_recuperacion,
        `Tipo_de_recuperaci__n` AS tipo_recuperacion
    FROM {{ source('raw', 'casos positivos covid-19') }}
)
SELECT * FROM raw_data