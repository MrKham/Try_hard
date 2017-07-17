class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
<<<<<<< 8aa6ac46ac9fd6a11b2f35a093379eef0b5606f4
    mail to: user.email, subject: t("account_activation")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("password_reset")
=======
    mail to: user.email, subject: t("Account_activation")
  end

  def password_reset
    @greeting = t "hi"
    mail to: t("email_example")
>>>>>>> account activated
  end
end
