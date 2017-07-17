class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("Account_activation")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("email_example")
  end
end
