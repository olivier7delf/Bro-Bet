class Bet < ApplicationRecord
  belongs_to :user
  has_many :tournament_bets
  has_many :bet_participations

  # validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 10, maximum: 80 }
  validates :description, length: { maximum: 140 }
  validates :stake, presence: true, length: { minimum: 1, maximum: 60 }
  validates :owner_choice, presence: true
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
