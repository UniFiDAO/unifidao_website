class EmailLink < ApplicationRecord
  belongs_to :user

  def self.generate(email)
    user = User.find_by(email: email)

    return nil if !user

    email_link = create(user: user, expires_at: Date.today + 1.day, token: generate_token)

    EmailLinkMailer.sign_in_mail(email_link).deliver_now

    email_link
  end

  def self.generate_welcome(email)
    user = User.find_by(email: email)

    return nil if !user

    email_link = create(user: user, expires_at: Date.today + 1.day, token: generate_token)

    EmailLinkMailer.welcome_mail(email_link, user).deliver_now

    email_link
  end

  def self.generate_token
    Devise.friendly_token.first(16)
  end
end
