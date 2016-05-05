class CheckoutController < ApplicationController
  def index
    id = session[:pedido_id].to_i
    @pedido = Pedido.find(id)
  end
end
