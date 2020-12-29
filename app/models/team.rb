class Team < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged
  has_one_attached :logo

  has_many :users

  def logo_image
    return logo if logo.attached?

    users.each do |user|
      return user.logo if user.logo.attached?
    end

    nil
  end
end
