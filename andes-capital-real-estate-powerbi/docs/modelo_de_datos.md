# Modelo de datos

Esquema en estrella: la tabla de hechos `hecho_ventas_propiedades` se conecta con las dimensiones `dim_clientes` y `dim_propiedades`. `dim_fecha` es una tabla calendario creada en DAX a partir de las fechas de venta.

## Relaciones

| Desde | Hacia | Cardinalidad | Filtro |
|---|---|---|---|
| hecho_ventas_propiedades[id_propiedad] | dim_propiedades[id_propiedad] | M:1 | Single |
| hecho_ventas_propiedades[id_cliente] | dim_clientes[id_cliente] | M:1 | Single |

## Tablas y columnas

### dim_clientes
| Columna | Tipo |
|---|---|
| id_cliente | string |
| segmento_comprador | string |
| pais | string |
| ciudad | string |

### dim_fecha
| Columna | Tipo |
|---|---|
| Date | datetime64[ns] |
| Año | Int64 |
| Mes | string |
| Mes Numero | Int64 |
| Año-Mes | string |
| Trimestre | string |

### dim_propiedades
| Columna | Tipo |
|---|---|
| id_propiedad | string |
| tipo_propiedad | string |
| ciudad | string |
| barrio | string |
| habitaciones | Int64 |
| tamano_m2 | Int64 |
| precio_publicado | Int64 |
| categoria_propiedad | string |

### hecho_ventas_propiedades
| Columna | Tipo |
|---|---|
| id_venta | string |
| fecha_venta | datetime64[ns] |
| id_cliente | string |
| id_propiedad | string |
| ciudad | string |
| precio_venta | Int64 |
| tipo_propiedad | string |
| canal_venta | string |
| porcentaje_comision | Float64 |
| monto_comision | Int64 |
| Primera Compra Cliente | datetime64[ns] |
| Mes Cohorte | string |
| Mes Venta | string |
| Numero Mes Cohorte | Int64 |
