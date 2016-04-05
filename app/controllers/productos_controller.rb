class ProductosController < ApplicationController
  
  # GET /productos
  # GET /productos.json
  def index
    busqueda = "#{params['search']}"
    if busqueda.empty?
      @productos = Producto.all
    else
      @productos = Producto.where("nombre like ? or descripcion like ?", "%#{busqueda}%", "%#{busqueda}%")
    end
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
  	@producto = Producto.find(params[:id])
    @related_productos = Producto.all.sample(3)
  end
end
