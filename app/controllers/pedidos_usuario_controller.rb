class PedidosUsuarioController < UsuarioLogeadoController
  def index
    email_usuario = current_usuario.email
    @pedidos = Pedido.where("email = ?", email_usuario)
  end

  def show
    id = params[:id].to_i
    email_usuario = current_usuario.email
    @pedido = Pedido.find(id)
  end
end
