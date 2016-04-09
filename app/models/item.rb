class Item
  attr_reader :producto
  attr_reader :cantidad

  def initialize(producto_id, cantidad)
    @producto = Producto.find(producto_id)
    @cantidad = cantidad
  end

  def total
    producto.precio*cantidad
  end
end