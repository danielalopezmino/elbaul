class Item
  attr_reader :producto
  attr_reader :cantidad

  def initialize(producto_id, cantidad)
    @producto = Producto.find(producto_id)
    @cantidad = cantidad
  end
end