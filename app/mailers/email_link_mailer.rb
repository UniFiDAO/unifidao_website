class EmailLinkMailer < ApplicationMailer
  def sign_in_mail(email_link)
    @email_link = email_link
    @user = email_link.user

    mail to: @user.email, subject: "Here is your login link! 🚀"
  end

  def welcome_mail(email_link, user)
    @email_link = email_link
    @user = user

    mail to: @user.email, subject: "Welcome to UniFiDAO! 🚀"
  end
end
