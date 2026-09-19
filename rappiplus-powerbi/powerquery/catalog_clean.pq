// Parámetro: RutaDatos = carpeta donde están los CSV (ej. "C:\\datos\\proyecto")
let
    Origen = Csv.Document(File.Contents(RutaDatos & "\catalog_clean.csv"),[Delimiter=",", Columns=4, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Encabezados promovidos" = Table.PromoteHeaders(Origen, [PromoteAllScalars=true]),
    #"Valor reemplazado" = Table.ReplaceValue(#"Encabezados promovidos",".",",",Replacer.ReplaceText,{"costo_unitario"}),
    #"Tipo cambiado" = Table.TransformColumnTypes(#"Valor reemplazado",{{"nombre_producto", type text}, {"categoria_producto", type text}, {"costo_unitario", Int64.Type}, {"proveedor", type text}})
in
    #"Tipo cambiado"
