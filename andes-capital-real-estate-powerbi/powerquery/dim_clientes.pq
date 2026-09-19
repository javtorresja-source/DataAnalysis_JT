// Parámetro: RutaDatos = carpeta donde están los CSV (ej. "C:\\datos\\proyecto")
let
    Origen = Csv.Document(File.Contents(RutaDatos & "\dim_clientes.csv"),[Delimiter=",", Columns=4, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Tipo cambiado" = Table.TransformColumnTypes(Origen,{{"Column1", type text}, {"Column2", type text}, {"Column3", type text}, {"Column4", type text}}),
    #"Encabezados promovidos" = Table.PromoteHeaders(#"Tipo cambiado", [PromoteAllScalars=true]),
    #"Tipo cambiado1" = Table.TransformColumnTypes(#"Encabezados promovidos",{{"id_cliente", type text}, {"segmento_comprador", type text}, {"pais", type text}, {"ciudad", type text}})
in
    #"Tipo cambiado1"
