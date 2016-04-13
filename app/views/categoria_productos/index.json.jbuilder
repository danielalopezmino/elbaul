json.array!(@categoria_productos) do |categoria_producto|
  json.extract! categoria_producto, :id, :categorium_id, :producto_id
  json.url categoria_producto_url(categoria_producto, format: :json)
end
