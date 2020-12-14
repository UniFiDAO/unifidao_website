class User < ApplicationRecord
  #

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :logo

  enum user_type:  { admin: "admin", team: "team", investor: "investor" }
end
