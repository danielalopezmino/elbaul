class ListaCategoriasController < ApplicationController
  def index
    @categorias = Categorium.all
  end
end
