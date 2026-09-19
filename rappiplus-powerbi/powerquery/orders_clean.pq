// Parámetro: RutaDatos = carpeta donde están los CSV (ej. "C:\\datos\\proyecto")
let
    Origen = Csv.Document(File.Contents(RutaDatos & "\orders_clean.csv"),[Delimiter=",", Columns=17, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Encabezados promovidos" = Table.PromoteHeaders(Origen, [PromoteAllScalars=true]),
    #"Valor reemplazado1" = Table.ReplaceValue(#"Encabezados promovidos",".",",",Replacer.ReplaceText,{"cantidad", "precio_unitario", "monto_descuento", "monto_total", "costo_unitario", "costo_total", "profit"}),
    #"Tipo cambiado" = Table.TransformColumnTypes(#"Valor reemplazado1",{{"id_pedido", type text}, {"id_usuario", type text}, {"fecha_hora_pedido", type date}, {"pais", type text}, {"dispositivo", type text}, {"fuente_referencia", type text}, {"nombre_producto", type text}, {"categoria_producto_orders", type text}, {"cantidad", Int64.Type}, {"precio_unitario", Int64.Type}, {"monto_descuento", Int64.Type}, {"monto_total", Int64.Type}, {"tipo_pedido", type text}, {"categoria_producto", type text}, {"costo_unitario", Int64.Type}, {"costo_total", Int64.Type}, {"profit", Int64.Type}})
in
    #"Tipo cambiado"
