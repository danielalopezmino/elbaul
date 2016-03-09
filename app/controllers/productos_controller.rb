class ProductosController < ApplicationController
  
  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.all
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
  	@producto = Producto.find(params[:id])
    @related_productos = Producto.all.sample(3)
    puts "aaaaaaaaaaaaaa:  #{@producto.nombre}"
  end
end
