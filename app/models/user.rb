class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :logo

  enum user_type:  { admin: "admin", team: "team", investor: "investor" }

  has_many :email_links, dependent: :delete_all
  belongs_to :team, optional: true

  validates_length_of :description, :maximum => 1000


  validates_presence_of :user_type, message: 'Please choose a team type.'

  def join_team
    update(team_id: Team.find_or_create_by(name: name).id)
  end

  def create_team
    team = Team.find_or_create_by(name: name)
    update(team_id: team.id)
    team.update(website: website,
                twitter: twitter,
                telegram: telegram,
                discord: discord,
                github: github,
                uniswap_pool: uniswap_pool,
                description: description)
  end

  def self.to_csv
    attributes = %w{id email name website partner linkedin twitter}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
end
