class UserMailer < ActionMailer::Base

  SYSTEM_EMAIL = "info@karnykutas.com"

  def notify(message)
    @message = message
    mail(:from => SYSTEM_EMAIL, :to => message.target_email, :bcc => ENV['BCC_EMAIL'],
      :subject => "Otrzymujesz Karnego Kutasa?")
  end

  def attach_logo
    attachments.inline['kk_logo.gif'] = File.read("#{Rails.root}/public/images/email_logo.gif")    
  end
end