json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :fecha, :nombre, :email, :telefono, :descuento, :costo_entrega, :nombre_entrega, :direccion_entrega, :fecha_entrega, :items, :estado
  json.url pedido_url(pedido, format: :json)
end
