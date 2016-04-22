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
    @error = params['error']
  end

  def checkout
    cart = Cart.new(session[:cart_id])
    email = params['email']
    nombre = params['nombre']
    telefono = params['telefono']
    direccion = params['direccion']

    if direccion.eql?("Dirección [opcional]")
      direccion = ''
    end

    if validate email, nombre, telefono
      save_pedido(cart.items, nombre, email, telefono, direccion)

      PedidosMailer.checkout_email(nombre, email, telefono, direccion, cart).deliver_now
      flash.now[:alert] = "Mail enviado, nos pondremos en contacto pronto"

      redirect_to controller: 'cart', action: 'index'
    else
      flash.now[:alert] = "Por favor ingrese su email, nombre y telefono"
      redirect_to controller: 'cart', action: 'index', error: true
    end

  end

  def validate(email, nombre, telefono)
    !((!is_a_valid_email?(email)) ||
        (nombre.strip.empty? || nombre.eql?('Nombre')) ||
        (telefono.strip.empty? || telefono.eql?('Teléfono')))
  end

  def is_a_valid_email?(email)
    (email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
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