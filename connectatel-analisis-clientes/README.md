# Análisis de Clientes – ConnectaTel

## Contexto del negocio

ConnectaTel es una empresa de telecomunicaciones con operaciones en México y Colombia.

El proyecto busca comprender cómo los clientes utilizan los servicios móviles, llamadas y mensajes en estos mercados, con el fin de identificar patrones de comportamiento, detectar anomalías y generar insights que permitan optimizar la oferta comercial y mejorar la experiencia del usuario.

---

## Objetivo del proyecto
Construir una visión clara, confiable y accionable del comportamiento de uso de los clientes para:

- Identificar segmentos de usuarios  
- Detectar patrones de consumo  
- Analizar comportamiento por edad y tipo de plan  
- Generar recomendaciones de negocio  

---

## Preguntas del negocio

- ¿Qué segmentos muestran mayor o menor uso?  
- ¿Qué usuarios presentan valores atípicos (outliers)?  
- ¿Cómo varía el uso según edad y plan?  
- ¿Qué patrones permiten optimizar los planes?  

---

## Datasets utilizados

### plans.csv
- Precio  
- Minutos incluidos  
- GB incluidos  
- Costos adicionales  

### users_latam.csv
- user_id  
- age  
- city  
- reg_date  
- plan  
- churn_date  

### usage.csv
- type (call / text)  
- date  
- duration  
- length  

---

## Etapas del análisis

### 1. Exploración
- .head(), .info(), .shape  

### 2. Limpieza
- Eliminación de sentinels (-999, "?")  
- Manejo de valores nulos  
- Validación de fechas (filtrado de 2026)  

### 3. Transformación
- Conversión a datetime  
- Creación de métricas:
  - cant_mensajes  
  - cant_llamadas  
  - cant_minutos_llamada  

### 4. Análisis exploratorio
- Distribuciones  
- Boxplots  
- Detección de outliers  

### 5. Segmentación

Grupo de uso:
- Bajo uso  
- Uso medio  
- Alto uso  

Grupo de edad:
- Joven  
- Adulto  
- Adulto mayor  

### 6. Visualización
- Distribuciones por segmento  
- Análisis de patrones  

---

## Principales hallazgos

- El 74% de los usuarios son de uso medio  
- El 7% son usuarios intensivos (alto uso)  
- El principal driver de valor es el consumo de minutos  

---

## Problemas detectados

- Sentinels:
  - age = -999  
  - city = "?"  

- Nulos:
  - city (~11.7%)  
  - churn_date (~88%)  

- Fechas fuera de rango:
  - Registros en 2026  

---

## Outliers

- Usuarios con alto número de mensajes  
- Usuarios con muchas llamadas  
- Usuarios con alto consumo de minutos (los más relevantes)  

Estos representan usuarios reales de alto valor.

---

## Recomendaciones

- Optimizar el plan Premium basado en minutos  
- Crear estrategias de upgrade (uso medio a alto)  
- Diseñar planes escalonados  
- Activar usuarios de bajo uso  

---

## Cómo ejecutar el notebook

### Opción 1: Google Colab

1. Abre Google Colab  
2. Sube el notebook `.ipynb`  
3. Sube los archivos CSV requeridos  
4. Ajusta las rutas si es necesario  
5. Ejecuta las celdas en orden  

Ejemplo de carga:

```python
import pandas as pd

plans = pd.read_csv('/datasets/plans.csv')
users = pd.read_csv('/datasets/users_latam.csv')
usage = pd.read_csv('/datasets/usage.csv')
```

Si subes archivos manualmente:

```plans = pd.read_csv('plans.csv')
users = pd.read_csv('users_latam.csv')
usage = pd.read_csv('usage.csv')
```

### Guía de reproducción 

### 1. Carga de datos
Cargar los siguientes archivos:
- `plans.csv`
- `users_latam.csv`
- `usage.csv`

###Opción 2: Jupyter Notebook local

Descarga o clona el repositorio
Coloca los archivos CSV en la misma carpeta del notebook
Abre Jupyter:
``
Abre el archivo .ipynb
Ejecuta las celdas con Shift + Enter

Requisitos
Librerías utilizadas:

pandas
numpy
matplotlib
seaborn

Instalación:
pip install pandas numpy matplotlib seaborn
---

### 2. Exploración inicial
Revisar la estructura de los datasets:
- `.head()`
- `.shape`
- `.info()`

---

### 3. Validación de calidad de datos
Identificar posibles problemas:
- Valores nulos  
- Sentinels (ej: `-999`, `"?"`)  
- Fechas fuera de rango  
- Inconsistencias lógicas entre columnas  

---

### 4. Limpieza de datos
Aplicar las siguientes acciones:
- Reemplazar sentinels por `NaN`  
- Convertir variables de fecha a `datetime`  
- Marcar o eliminar fechas inválidas  
- Mantener nulos estructurales cuando corresponda  

---

### 5. Transformación y agregación
Construir métricas de uso por usuario:
- Cantidad de mensajes  
- Cantidad de llamadas  
- Minutos totales de llamada  

---

### 6. Integración de datos
Combinar la información de uso con los datos de clientes para crear un perfil consolidado por usuario.

---

### 7. Análisis y visualización
- Visualizar distribuciones de uso  
- Crear boxplots para analizar comportamiento  
- Explorar diferencias entre segmentos  

---

### 8. Detección de outliers
- Identificar valores extremos utilizando el método IQR  
- Analizar si corresponden a errores o comportamientos reales  

---

### 9. Segmentación de clientes
Crear variables de segmentación:
- `grupo_uso` (bajo, medio, alto)  
- `grupo_edad`  

---

### 10. Insights y recomendaciones
- Analizar patrones de comportamiento  
- Identificar segmentos clave  
- Redactar conclusiones y recomendaciones de negocio 

### Por Javier Torres
