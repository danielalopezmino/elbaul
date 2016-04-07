class NotificacionesMailer < ActionMailer::Base

  def contactos_email (nombre, email, titulo, mensaje)
    @nombre = nombre
    @email = email
    @mensaje = mensaje
    mail(subject: "[CONTACTOS] #{titulo}", from: 'contactos@maleboxgifts.com', to: 'faustodelatog@gmail.com')
  end
end