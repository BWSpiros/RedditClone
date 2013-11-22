class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # layout 'a'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def self.password_reset(user)
    @user = user
    flash = nil

    mail to: user.email, subject: "Password Reset"

  end


end
