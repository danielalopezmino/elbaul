class PedidosUsuarioController < UsuarioLogeadoController
  def index
    email_usuario = current_usuario.email
    @pedidos = Pedido.where("email = ?", email_usuario)
  end

  def show
    id = params[:id].to_i
    email_usuario = current_usuario.email
    @pedido = Pedido.where("id = ? and email = ?", id, email_usuario).first

    redirect_to root_path, alert: 'No tiene autorización para ver el pedido' unless @pedido != nil
  end
end
