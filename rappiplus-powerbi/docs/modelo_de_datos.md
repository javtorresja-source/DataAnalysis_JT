# Modelo de datos

La tabla `orders_clean` se relaciona con `catalog_clean` por nombre de producto. `marketing_clean` se usa para el gasto de marketing y `DimFecha` es una tabla calendario creada en DAX.

## Relaciones

| Desde | Hacia | Cardinalidad | Filtro |
|---|---|---|---|
| orders_clean[nombre_producto] | catalog_clean[nombre_producto] | M:1 | Single |

## Tablas y columnas

### DimFecha
| Columna | Tipo |
|---|---|
| Date | datetime64[ns] |
| Año | Int64 |
| NumeroMes | Int64 |
| Mes | string |
| AñoMes | string |
| Trimestre | string |
| DiaSemana | string |
| EsFinDeSemana | bool |

### catalog_clean
| Columna | Tipo |
|---|---|
| nombre_producto | string |
| categoria_producto | string |
| costo_unitario | Int64 |
| proveedor | string |

### marketing_clean
| Columna | Tipo |
|---|---|
| fecha | datetime64[ns] |
| pais | string |
| id_campaña | string |
| canal | string |
| gasto | Int64 |

### orders_clean
| Columna | Tipo |
|---|---|
| id_pedido | string |
| id_usuario | string |
| fecha_hora_pedido | datetime64[ns] |
| pais | string |
| dispositivo | string |
| fuente_referencia | string |
| nombre_producto | string |
| categoria_producto_orders | string |
| cantidad | Int64 |
| precio_unitario | Int64 |
| monto_descuento | Int64 |
| monto_total | Int64 |
| tipo_pedido | string |
| categoria_producto | string |
| costo_unitario | Int64 |
| costo_total | Int64 |
| profit | Int64 |
