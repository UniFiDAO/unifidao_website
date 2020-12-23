class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :logo

  enum user_type:  { admin: "admin", team: "team", investor: "investor" }

  has_many :email_links, dependent: :delete_all


  validates_presence_of :user_type, message: 'Please choose a team type.'
end
