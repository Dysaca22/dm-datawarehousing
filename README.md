# COVID-19 en Colombia: almacén de datos y pronóstico semanal

Proyecto de la asignatura Minería de Datos (2024). Las entregas, con el análisis exploratorio y los gráficos, están en el [sitio del proyecto](https://dysaca22.github.io/dm-datawarehousing/web).

## Problema

Anticipar los casos nuevos de COVID-19 a partir de su historia, para apoyar decisiones de salud pública.

## Datos

Casos positivos de COVID-19 en Colombia, de Datos Abiertos Colombia. Se descargan con su API, pasan por Drive y se cargan en BigQuery, en la capa `raw`.

## Método

- dbt (`dbt_etl/`) lleva los datos de `raw` a `cleaned`: selecciona y renombra columnas, normaliza el texto, descarta nulos e imputa con la moda.
- Los casos se suman por semana. Se entrena hasta el 31 de diciembre de 2021 y se evalúa desde enero de 2022.
- Con Darts se comparan ARIMA, Random Forest y N-BEATS, cada uno con su búsqueda de hiperparámetros.

## Resultado

Error en el tramo de prueba, en casos por semana:

| Modelo | MAE | RMSE | MAPE |
|---|---|---|---|
| N-BEATS | 17.447 | 44.600 | 195 % |
| Random Forest | 33.986 | 48.377 | 1.878 % |
| ARIMA | 34.534 | 48.110 | 1.953 % |

N-BEATS reduce a la mitad el error absoluto de los otros dos. Aun así, el error relativo sigue alto en los tres.

## Cómo correrlo

Requiere una cuenta de servicio de Google Cloud con acceso a BigQuery. Su clave va como `dbt-bigquery-key.json` en `dbt_etl/` y en `model/`; `.gitignore` la excluye.

```sh
python -m venv venv && source venv/bin/activate
pip install -r requirements.txt
cd dbt_etl && dbt run
```

El modelado está en `model/Modelado.ipynb`.
