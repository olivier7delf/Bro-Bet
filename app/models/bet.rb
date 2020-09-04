class Bet < ApplicationRecord
  PROGRESS = {
    "join_pending": 0,
    "joined": 1,
    "result_pending": 2,
    "result_input": 3,
    "resulted": 4
  }

  belongs_to :user
  has_many :bet_participations
  has_many :in_users, through: :bet_participations, class_name: "User", foreign_key: "user_id", source: :user

  has_one :chatroom

  has_many :tournament_bets
  has_many :tournaments, through: :tournament_bets
  # has_many :users_as_participation, through: :bet_participations, source: :users

  # validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 4, maximum: 80 }
  validates :description, length: { maximum: 180 }
  validates :stake, presence: true, length: { minimum: 1, maximum: 60 }
  # validates :owner_choice, presence: true # else bug in seed when value = false !
  validates :closed_at, presence: true
  validates :resulted_at, presence: true
  attribute :closed_at, default: -> { Time.now + 3600 * 12 }
  attribute :resulted_at, default: -> { Time.now + 3600 * 24 }

  #validates :in_users, uniqueness: true

  private

  def resulted_at_after_closed_at
    return if resulted_at.blank? || closed_at.blank?
    if resulted_at < closed_at
      errors.add(:resulted_at, "La date de résultat doit être après celle de clôture")
    end
  end
end
