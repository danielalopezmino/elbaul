class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_usuario!, :authorize_admin
  #before_filter :login_required, :load_admin_menu

  def authorize_admin
    redirect_to root_path, alert: 'No tiene autorización para administrar la aplicación' unless current_usuario.isAdmin?
  end
end