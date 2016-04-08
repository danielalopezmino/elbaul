# cart_controller.rb
class CartController < ApplicationController
  def add_to_cart
    product_id = params[:product_id]
    add_product product_id
    redirect_to controller: 'cart', action: 'index', product_id: product_id
  end

  def add_product (product_id)
    cart = session[:cart_id] || {}
    quantity = cart[product_id] || 0
    cart[product_id] = quantity + 1

    session[:cart_id] = cart
  end

  def remove_from_cart
    product_id = params[:product_id]
    remove_product product_id
    redirect_to controller: 'cart', action: 'index'
  end

  def remove_product (product_id)
    cart = session[:cart_id]
    cart.delete(product_id)

    session[:cart_id] = cart
  end

  def index
    puts "el cart: #{session[:cart_id]}"
    cart = session[:cart_id]

    @cart = Cart.new(cart)
  end

end