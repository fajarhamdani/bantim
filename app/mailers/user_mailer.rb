class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.sendMail.subject
  #
  def sendMail(recipient)
    @greeting = "Hi"

    mail to: recipient, subject: 'testing'
  end
end
