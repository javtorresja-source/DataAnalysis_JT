# Catálogo de medidas DAX

| Medida | Qué calcula |
|---|---|
| Revenue Total | Suma del monto total de las líneas de tipo Venta. Excluye datos incompletos, por revisar y devoluciones. |
| Costo Total | Suma del costo total de las líneas de tipo Venta. |
| Profit Total | Revenue total menos costo total. |
| Gasto Marketing Total | Suma del gasto de la tabla de marketing. |
| Pedidos | Número de pedidos distintos de tipo Venta. |
| Ticket Promedio | Revenue total dividido por pedidos distintos. |
| Cantidad Total | Unidades vendidas en líneas de tipo Venta. |
| Cantidad Promedio por Orden | Unidades vendidas divididas por pedidos. |
| Revenue YTD | Revenue acumulado del año hasta la fecha, sobre la tabla de fechas. |

## Código de cada medida

### Revenue Total
```dax
Revenue Total =
CALCULATE ( SUM ( orders_clean[monto_total] ), orders_clean[tipo_pedido] = "Venta" )
```

### Costo Total
```dax
Costo Total =
CALCULATE ( SUM ( orders_clean[costo_total] ), orders_clean[tipo_pedido] = "Venta" )
```

### Profit Total
```dax
Profit Total =
[Revenue Total] - [Costo Total]
```

### Gasto Marketing Total
```dax
Gasto Marketing Total =
SUM ( marketing_clean[gasto] )
```

### Pedidos
```dax
Pedidos =
CALCULATE ( DISTINCTCOUNT ( orders_clean[id_pedido] ), orders_clean[tipo_pedido] = "Venta" )
```

### Ticket Promedio
```dax
Ticket Promedio =
DIVIDE ( [Revenue Total], [Pedidos] )
```

### Cantidad Total
```dax
Cantidad Total =
CALCULATE ( SUM ( orders_clean[cantidad] ), orders_clean[tipo_pedido] = "Venta" )
```

### Cantidad Promedio por Orden
```dax
Cantidad Promedio por Orden =
DIVIDE ( [Cantidad Total], [Pedidos] )
```

### Revenue YTD
```dax
Revenue YTD =
TOTALYTD ( [Revenue Total], DimFecha[Date] )
```
