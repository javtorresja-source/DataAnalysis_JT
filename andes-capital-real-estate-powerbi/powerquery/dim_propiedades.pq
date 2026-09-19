// Parámetro: RutaDatos = carpeta donde están los CSV (ej. "C:\\datos\\proyecto")
let
    Origen = Csv.Document(File.Contents(RutaDatos & "\dim_propiedades.csv"),[Delimiter=",", Columns=8, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Encabezados promovidos" = Table.PromoteHeaders(Origen, [PromoteAllScalars=true]),
    #"Tipo cambiado" = Table.TransformColumnTypes(#"Encabezados promovidos",{{"id_propiedad", type text}, {"tipo_propiedad", type text}, {"ciudad", type text}, {"barrio", type text}, {"habitaciones", Int64.Type}, {"tamano_m2", Int64.Type}, {"precio_publicado", Int64.Type}, {"categoria_propiedad", type text}})
in
    #"Tipo cambiado"
