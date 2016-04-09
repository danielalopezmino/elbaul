class Cart
  attr_reader :items

  def initialize (cart)
   @items = cart.map { |producto_id, cantidad| Item.new(producto_id, cantidad)}
  end

  def total
    items.reduce(0) {|sum, item| sum + item.producto.precio*item.cantidad }
  end

end