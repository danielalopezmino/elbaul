class PageController < ApplicationController
  def home
    @productos = Producto.all.sample(10)
  end

  def contactos
  end

  def send_email
    if verify_recaptcha
      puts "los params: #{params}"
      NotificacionesMailer.contactos_email(params['nombre'], params['email'], params['titulo'], params['mensaje']).deliver
      flash.now[:alert] = "Mail enviado, nos pondremos en contacto pronto"
      render :contactos
    else
      flash.now[:alert] = "No pasa la validación del captcha"
      flash.delete :recaptcha_error
      render :contactos
    end
  end
end
