// Parámetro: RutaDatos = carpeta donde están los CSV (ej. "C:\\datos\\proyecto")
let
    Origen = Csv.Document(File.Contents(RutaDatos & "\hecho_ventas_propiedades.csv"),[Delimiter=",", Columns=10, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Encabezados promovidos" = Table.PromoteHeaders(Origen, [PromoteAllScalars=true]),
    #"Valor reemplazado" = Table.ReplaceValue(#"Encabezados promovidos",".",",",Replacer.ReplaceText,{"porcentaje_comision"}),
    #"Tipo cambiado" = Table.TransformColumnTypes(#"Valor reemplazado",{{"porcentaje_comision", Percentage.Type}, {"monto_comision", Int64.Type}, {"precio_venta", Int64.Type}, {"fecha_venta", type date}})
in
    #"Tipo cambiado"
