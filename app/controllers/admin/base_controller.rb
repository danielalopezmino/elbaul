class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_usuario!
  #before_filter :login_required, :load_admin_menu

  def index
  end
end