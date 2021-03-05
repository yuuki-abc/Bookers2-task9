class ThanksMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.thanks_mailer.greeting.subject
  #
  def greeting(user)
    @user = user
    mail to: user.email, subject: "Thanks for signing me up!"
  end

end
