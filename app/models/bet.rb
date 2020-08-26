class Bet < ApplicationRecord
  belongs_to :user
  has_many :bet_participations
  has_many :in_users, through: :bet_participations, class_name: "User", foreign_key: "user_id", source: :user
  # has_many :users, through: :bet_participations
  # belongs_to :creator, class_name: :user, foreign_key: :creator_id

  has_many :tournament_bets
  # has_many :users_as_participation, through: :bet_participations, source: :users

  # validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 10, maximum: 80 }
  validates :description, length: { maximum: 140 }
  validates :stake, presence: true, length: { minimum: 1, maximum: 60 }
  # validates :owner_choice, presence: true # else bug in seed when value = false !
  validates :closed_at, presence: true
  validates :resulted_at, presence: true
  attribute :closed_at, default: -> { Time.now + 3600 * 12 }
  attribute :resulted_at, default: -> { Time.now + 3600 * 24 }

  private

  def resulted_at_after_closed_at
    return if resulted_at.blank? || closed_at.blank?
    if resulted_at < closed_at
      errors.add(:resulted_at, "La date de résultat doit être après celle de clôture")
    end
  end
end
