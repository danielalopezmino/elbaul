json.array!(@productos) do |producto|
  json.extract! producto, :id, :nombre, :descripcion, :foto_url, :precio
  json.url producto_url(producto, format: :json)
end
