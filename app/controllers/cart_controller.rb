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
    cart = session[:cart_id]
    if cart
      @cart = Cart.new(cart)
      @error = params['error']
    end
  end

  def checkout
    cart = Cart.new(session[:cart_id])
    email = params['email']
    nombre = params['nombre']
    telefono = params['telefono']
    direccion = params['direccion']
    nombre_entrega = params['nombre_entrega']
    mensaje = params['mensaje']

    if direccion.eql?("Dirección [opcional]")
      direccion = ''
    end
    if mensaje.eql?("Mensaje [opcional]")
      mensaje = ''
    end

    if validate email, nombre, telefono, nombre_entrega
      pedido_id = save_pedido(cart.items, nombre, email, telefono, direccion, nombre_entrega, mensaje)
      session[:pedido_id] = pedido_id

      PedidosMailer.checkout_email(nombre, email, telefono, direccion, cart).deliver_now
      flash.now[:alert] = "Mail enviado, nos pondremos en contacto pronto"

      session[:cart_id] = nil
      redirect_to controller: 'checkout', action: 'index'
    else
      flash.now[:alert] = "Por favor ingrese su email, nombre y telefono"
      redirect_to controller: 'cart', action: 'index', error: true
    end

  end

  def validate(email, nombre, telefono, nombre_entrega)
    !((!is_a_valid_email?(email)) ||
        (nombre.strip.empty? || nombre.eql?('Nombre')) ||
        (nombre_entrega.strip.empty? || nombre_entrega.eql?('Entregar a')) ||
        (telefono.strip.empty? || telefono.eql?('Teléfono')))
  end

  def is_a_valid_email?(email)
    (email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  end

  def save_pedido items, nombre, email, telefono, direccion, nombre_entrega, mensaje
    pedido = Pedido.new
    pedido.fecha = Date.today
    pedido.items = items.to_json

    pedido.nombre = nombre
    pedido.email = email
    pedido.telefono = telefono

    pedido.direccion_entrega = direccion
    pedido.nombre_entrega = nombre_entrega
    #pedido.mensaje = mensaje

    pedido.estado = 'Pendiente'

    pedido.save

    pedido.id
  end
end