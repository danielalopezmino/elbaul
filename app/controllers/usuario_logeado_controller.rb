class UsuarioLogeadoController < ApplicationController
  layout 'application'
  before_action :authenticate_usuario!
end