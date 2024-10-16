
# Proyecto DBT ETL para Casos de COVID-19

## Descripción General
Este proyecto utiliza dbt (data build tool) para realizar la extracción, transformación y carga (ETL) de datos relacionados con casos positivos de COVID-19. El proyecto está estructurado para limpiar, normalizar e imputar datos desde una fuente cruda hasta un modelo final listo para análisis.

## Estructura del Proyecto

### Configuración
- **dbt_project.yml**: Define la configuración del proyecto, incluyendo la materialización de los modelos.
- **profiles.yml**: Configura la conexión a BigQuery, el almacén de datos utilizado.

### Fuentes de Datos
- **models/schema.yml**: Define las fuentes de datos, incluyendo la tabla cruda de casos de COVID-19.

### Macros
- **macros/normalize_text.sql**: Macro para normalizar texto (mayúsculas, minúsculas, título).
- **macros/filter_nulls.sql**: Macro para filtrar filas con valores nulos en columnas específicas.

### Modelos

#### Core
- **models/core/select_rename_cols.sql**: Selecciona y renombra columnas de la tabla cruda.

#### Transformación
- **models/transform/normalize.sql**: Aplica normalización de texto a columnas específicas.

#### Imputación
- **models/imputation/replace.sql**: Reemplaza valores nulos en la columna de fecha de diagnóstico.
- **models/imputation/mode.sql**: Imputa valores nulos con la moda para ubicación del caso y tipo de recuperación.
- **models/imputation/special.sql**: Realiza imputaciones especiales para las columnas 'recuperado' y 'estado'.

#### Limpieza
- **models/cleaning/drop_nulls.sql**: Elimina filas con valores nulos en columnas críticas.

#### Resultados
- **models/results/casos positivos covid-19.sql**: Modelo final que presenta los datos limpios y procesados.

## Flujo de Datos
1. Los datos crudos se extraen de BigQuery `dm-09242024.raw.casos positivos covid-19` haciendo uso de la llame de la Cuenta de Servicio de Google Cloud.
2. Se seleccionan y renombran las columnas en `select_rename_cols.sql`.
3. Se normalizan los textos en `normalize.sql`.
4. Se realizan imputaciones en el siguiente orden:
   a. Reemplazo de fechas en `replace.sql`.
   b. Imputación por moda en `mode.sql`.
   c. Imputaciones especiales (especificas de este proyecto) en `special.sql`.
5. Se eliminan filas con valores nulos críticos en `drop_nulls.sql`.
6. El resultado final se materializa como una vista en `casos positivos covid-19.sql`.

## Ejecución
Para ejecutar este proyecto:
1. Asegúrese de tener dbt instalado y configurado.
2. Configure las credenciales de BigQuery en `profiles.yml`.
3. Ejecute `dbt run` para procesar todos los modelos.
4. Use `dbt test` para ejecutar las pruebas definidas.

## Notas Adicionales
- El proyecto está configurado para usar BigQuery como almacén de datos.
- Los modelos intermedios están configurados como efímeros para optimizar el rendimiento.
- El modelo final se materializa como una vista en el esquema 'cleaned'.
