# Catálogo de medidas DAX

| Medida | Qué calcula |
|---|---|
| Ingreso Total | Suma del precio de venta. Métrica base de ingresos. |
| Cantidad de Ventas | Número de ventas (filas de la tabla de hechos). |
| Ticket Promedio | Ingreso total dividido por la cantidad de ventas. |
| Comisión Total | Suma del monto de comisión pagado. |
| % Ingresos por Tipo Propiedad | Participación del ingreso de cada tipo de propiedad sobre el total. Usa ALL para conservar el total al filtrar. |
| % Ingresos por Canal Venta | Participación del ingreso de cada canal (Corredor, Directo) sobre el total. |
| % Ingresos por Segmento Cliente | Participación del ingreso de cada segmento de comprador sobre el total. |
| Ventas YTD | Ingreso acumulado del año hasta la fecha. |
| Ventas MTD | Ingreso acumulado del mes hasta la fecha. |
| Ventas Año Anterior | Ingreso del mismo periodo del año anterior. |
| Crecimiento YoY % | Variación porcentual del ingreso frente al mismo periodo del año anterior. |
| Total Clientes | Número de clientes distintos con al menos una compra. |
| Clientes Recurrentes | Clientes con más de una venta en el periodo. |
| Tasa de Recompra % | Clientes recurrentes divididos por el total de clientes. |

## Código de cada medida

### Ingreso Total
```dax
Ingreso Total =
SUM ( hecho_ventas_propiedades[precio_venta] )
```

### Cantidad de Ventas
```dax
Cantidad de Ventas =
COUNTROWS ( hecho_ventas_propiedades )
```

### Ticket Promedio
```dax
Ticket Promedio =
DIVIDE ( [Ingreso Total], [Cantidad de Ventas] )
```

### Comisión Total
```dax
Comisión Total =
SUM ( hecho_ventas_propiedades[monto_comision] )
```

### % Ingresos por Tipo Propiedad
```dax
% Ingresos por Tipo Propiedad =
DIVIDE (
    [Ingreso Total],
    CALCULATE ( [Ingreso Total], ALL ( hecho_ventas_propiedades[tipo_propiedad] ) )
)
```

### % Ingresos por Canal Venta
```dax
% Ingresos por Canal Venta =
DIVIDE (
    [Ingreso Total],
    CALCULATE ( [Ingreso Total], ALL ( hecho_ventas_propiedades[canal_venta] ) )
)
```

### % Ingresos por Segmento Cliente
```dax
% Ingresos por Segmento Cliente =
DIVIDE (
    [Ingreso Total],
    CALCULATE ( [Ingreso Total], ALL ( dim_clientes[segmento_comprador] ) )
)
```

### Ventas YTD
```dax
Ventas YTD =
TOTALYTD ( [Ingreso Total], dim_fecha[Date] )
```

### Ventas MTD
```dax
Ventas MTD =
TOTALMTD ( [Ingreso Total], dim_fecha[Date] )
```

### Ventas Año Anterior
```dax
Ventas Año Anterior =
CALCULATE ( [Ingreso Total], SAMEPERIODLASTYEAR ( dim_fecha[Date] ) )
```

### Crecimiento YoY %
```dax
Crecimiento YoY % =
DIVIDE(
    [Ingreso Total] - [Ventas Año Anterior],
    [Ventas Año Anterior]
)
```

### Total Clientes
```dax
Total Clientes =
DISTINCTCOUNT(hecho_ventas_propiedades[id_cliente])
```

### Clientes Recurrentes
```dax
Clientes Recurrentes =
COUNTROWS(
    FILTER(
        VALUES(hecho_ventas_propiedades[id_cliente]),
        CALCULATE(COUNTROWS(hecho_ventas_propiedades)) > 1
    )
)
```

### Tasa de Recompra %
```dax
Tasa de Recompra % =
DIVIDE([Clientes Recurrentes], [Total Clientes])
```
