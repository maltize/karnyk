class UserMailer < ActionMailer::Base

  SYSTEM_EMAIL = "to@karnykutas.com"

  def notify(message)
    @message = message
    mail(:from => SYSTEM_EMAIL, :to => message.target_email,
      :subject => "Karny Kutas - od kogo dostałeś?")
  end

end
