# Minería de Datos - Homework #1

**Fecha:** 13 de agosto de 2024

## Introducción

Se presenta el desafío de predecir la tasa de contagio (número de nuevos casos diarios) en una región específica a partir de datos históricos y variables relacionadas, como medidas de confinamiento, tasas de vacunación y movilidad. El objetivo es seleccionar un modelo de predicción que permita anticipar la evolución de los contagios y así apoyar la toma de decisiones en salud pública.

## Selección del Modelo

### Modelos Considerados

- **Modelo de Regresión Lineal:** Debido a su simplicidad y facilidad de interpretación, es útil para identificar relaciones lineales entre las variables.
- **Modelo de Series Temporales (ARIMA):** Específicamente útil para datos secuenciales, como la evolución diaria de casos.
- **Modelo de Random Forest:** Modelo avanzado que maneja relaciones no lineales y múltiples variables explicativas, útil para capturar la complejidad de los datos de COVID-19.
- **Redes Neuronales Recurrentes (RNN):** Potente en la predicción de secuencias y útil para capturar patrones complejos en series temporales.

### Justificación

**Modelo Seleccionado: ARIMA (AutoRegressive Integrated Moving Average)**

#### Fortalezas

- ARIMA es un modelo robusto y ampliamente utilizado en la predicción de series temporales.
- Es capaz de capturar patrones históricos y proyectar futuros puntos en la serie temporal con alta precisión.

#### Debilidades

- Requiere que los datos sean estacionarios o se transformen para alcanzar la estacionariedad.
- Puede no ser ideal para datos con relaciones no lineales complejas.

#### Adecuación al Problema

Dado que los datos de COVID-19 tienen una clara secuencia temporal (días consecutivos) y es crucial prever los casos futuros con base en los datos anteriores, ARIMA es una elección natural y adecuada.

## Relevancia del Modelo

ARIMA es especialmente relevante para analizar y predecir la propagación de enfermedades, como ha sido demostrado en estudios anteriores durante brotes epidémicos. Su capacidad para prever la evolución de los casos en el tiempo es crucial para la planificación de recursos sanitarios y la implementación de medidas de control.

## Planificación

### Preparación de los Datos

- Involucra la recopilación de datos históricos de casos de COVID-19, así como variables relacionadas (vacunación, medidas de confinamiento, etc.).

### Análisis Previo de Estacionariedad

- Se debe realizar una prueba de Dickey-Fuller para verificar si los datos son estacionarios o necesitan transformaciones.

### Ajuste y Evaluación del Modelo

- Ajustar el modelo ARIMA a los datos, seleccionar los mejores parámetros (p, d, q) y evaluar su desempeño con métricas como RMSE (Root Mean Squared Error).
