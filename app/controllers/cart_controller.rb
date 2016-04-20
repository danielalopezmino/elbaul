# cart_controller.rb
class CartController < ApplicationController
  def add_to_cart
    product_id = params[:product_id]
    add_product product_id
    redirect_to controller: 'cart', action: 'index'
  end

  def add_product (product_id)
    cart = session[:cart_id] || {}
    quantity = cart[product_id] || 0
    cart[product_id] = quantity + 1 if quantity < 10

    session[:cart_id] = cart
  end

  def remove_from_cart
    product_id = params[:product_id]
    remove_product product_id
    redirect_to controller: 'cart', action: 'index'
  end

  def remove_product (product_id)
    cart = session[:cart_id] || {}
    quantity = cart[product_id] || 0
    cart[product_id] = quantity - 1 if quantity > 1

    session[:cart_id] = cart
  end

  def remove_all_from_cart
    product_id = params[:product_id]
    remove_all_product product_id
    redirect_to controller: 'cart', action: 'index'
  end

  def remove_all_product (product_id)
    cart = session[:cart_id]
    cart.delete(product_id)

    session[:cart_id] = cart
  end

  def index
    puts "el cart: #{session[:cart_id]}"
    cart = session[:cart_id]

    @cart = Cart.new(cart)
  end

  def checkout
    cart = Cart.new(session[:cart_id])
    nombre = params['nombre']
    email = params['email']
    telefono = params['telefono']
    direccion = params['direccion']

    save_pedido(cart.items, nombre, email, telefono, direccion)

    PedidosMailer.checkout_email(nombre, email, telefono, direccion, cart).deliver_now
    flash.now[:alert] = "Mail enviado, nos pondremos en contacto pronto"

    redirect_to controller: 'cart', action: 'index'
  end

  def save_pedido items, nombre, email, telefono, direccion
    pedido = Pedido.new
    pedido.fecha = Date.today
    pedido.items = items.to_json

    pedido.nombre = nombre
    pedido.email = email
    pedido.telefono = telefono

    pedido.direccion_entrega = direccion

    pedido.estado = 'Pendiente'

    pedido.save
  end
end