// Parámetro: RutaDatos = carpeta donde están los CSV (ej. "C:\\datos\\proyecto")
let
    Origen = Csv.Document(File.Contents(RutaDatos & "\marketing_clean.csv"),[Delimiter=",", Columns=5, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Encabezados promovidos" = Table.PromoteHeaders(Origen, [PromoteAllScalars=true]),
    #"Valor reemplazado" = Table.ReplaceValue(#"Encabezados promovidos",".",",",Replacer.ReplaceText,{"gasto"}),
    #"Tipo cambiado" = Table.TransformColumnTypes(#"Valor reemplazado",{{"fecha", type date}, {"pais", type text}, {"id_campaña", type text}, {"canal", type text}, {"gasto", Int64.Type}})
in
    #"Tipo cambiado"
