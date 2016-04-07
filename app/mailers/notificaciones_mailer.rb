class NotificacionesMailer < ActionMailer::Base
  default from: "contactos@maleboxgifts.com"
  default to: "faustodelatog@gmail.com"

  def contactos_email (nombre, email, titulo, mensaje)
    @nombre = nombre
    @email = email
    @mensaje = mensaje
    mail(subject: titulo)
  end
end