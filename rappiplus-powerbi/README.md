# Rappiplus: rentabilidad y crecimiento (Power BI)

Proyecto de formación en Data Analytics, con datos simulados. Tablero de 2 páginas (Overview y detalle por producto) sobre el primer semestre de 2025 de una operación de e-commerce en México, Colombia y Argentina.

## Contexto y problema de negocio
La gerencia necesita una lectura rápida de la rentabilidad, de cuánto invierte en marketing y de si el negocio crece.

- ¿La operación es rentable y cuánto se invierte en marketing?
- ¿Qué categorías y productos generan más profit y cuáles lo destruyen?
- ¿El revenue crece mes a mes?

## Objetivo y herramientas
Mostrar la salud financiera (revenue, costo, profit, ticket y marketing) y permitir bajar al detalle por producto y categoría.
Power BI Desktop, Power Query (M) y DAX.

## Datos
Tres archivos CSV en versión "clean" (datos simulados de un programa de formación):

| Archivo | Contenido |
|---|---|
| `orders_clean.csv` | 25,000 líneas de pedido entre enero y junio de 2025 |
| `marketing_clean.csv` | 1,620 registros de gasto diario por país y canal |
| `catalog_clean.csv` | 7 productos con categoría, costo unitario y proveedor |

Los CSV no se incluyen en el repositorio. Colócalos en una carpeta y ajusta la ruta en Power Query (ver `powerquery/`).

## Preparación y decisiones técnicas
- Promoción de encabezados, reemplazo del punto decimal por coma y tipado de columnas.
- Cada línea de pedido viene clasificada: Venta (24,936), dato incompleto (50), por revisar (10) y devolución (4).
- **Todas las medidas cuentan solo las líneas de tipo Venta**, lo que excluye el 0.26% de líneas dudosas.
- Tabla de fechas `DimFecha` creada en DAX.
- Pedidos y catálogo se relacionan por nombre de producto (muchos a uno).

## Resultados principales
- Revenue de $9.62M, costo de $3.83M y profit de $5.80M (margen de 60%); 24,936 pedidos y ticket de ~$386.
- Marketing: $2.87M, el 30% del revenue.
- El revenue se mantiene entre $1.44M y $1.66M por mes, sin tendencia de crecimiento.
- La rentabilidad depende del producto: Vacuum-Pro-Black, Sneakers-Urban-42 y Phone-Pro-128GB dejan márgenes de 93% a 96%; Blender-XL-Red deja 31% y Jacket-Winter-M 26%.
- Laptop-Gaming-16GB vende por debajo de su costo (profit de -$94K).

## Recomendaciones
1. Revisar precio o costo de la laptop.
2. Revisar costos y descuentos de Blender-XL-Red y Jacket-Winter-M.
3. Analizar el retorno del marketing por canal y país (los datos están en `marketing_clean`).
4. Priorizar la promoción de los productos de mayor margen.

## Limitaciones
Datos simulados de un solo semestre. Persisten 45 líneas de "Producto no identificado" y pedidos con país "Sin especificar" dentro de los totales. El análisis de marketing solo muestra el gasto, no su retorno.

## Estructura del repositorio
```
README.md
docs/modelo_de_datos.md
docs/medidas_dax.md
dax/
powerquery/
capturas/
```

## Capturas y tablero
Agregar en `capturas/` las imágenes de las páginas y aquí el enlace al tablero publicado en Power BI Service.
