class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("Account_activation")
  end

  def password_reset
    @greeting = t "hi"
    mail to: t("email_example")
  end
end
