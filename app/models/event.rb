class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :logo
end
