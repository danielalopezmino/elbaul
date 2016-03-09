class PageController < ApplicationController
  def home
    @productos = Producto.all.sample(10)
  end

  def contactos
  end
end
