json.array!(@fotos) do |foto|
  json.extract! foto, :id, :url, :producto_id
  json.url foto_url(foto, format: :json)
end
