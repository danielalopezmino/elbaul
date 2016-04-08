class Cart
  attr_reader :items

  def initialize (cart)
   @items = cart.map { |producto_id, cantidad| Item.new(producto_id, cantidad)}
  end

end