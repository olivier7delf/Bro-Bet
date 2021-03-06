class Tournament < ApplicationRecord
  PROGRESS = {
    "join_pending": 0,
    "joined": 1,
    "result_pending": 2,
    "resulted": 3
  }
  # result_pending : you cannot invit friend ? or useless and we delete closed_at
  belongs_to :user
  has_many :tournament_bets
  has_many :tournament_participations
  has_one :chatroom

  has_many :in_users, through: :tournament_participations, class_name: "User", foreign_key: "user_id", source: :user

  # has_many :in_bets, through: :bet_participations, class_name: "Bet", foreign_key: "bet_id", source: :bet
  # has_many :in_bets, through: :tournament_bets, class_name: "Tournament", foreign_key: "tournament_id", source: :tournament
  has_many :bets, through: :tournament_bets

  validates :title, presence: true, length: { minimum: 10, maximum: 80 }
  validates :description, length: { maximum: 280 }
  validates :stake, presence: true, length: { minimum: 1, maximum: 60 }
  validates :closed_at, presence: true
  validates :resulted_at, presence: true
  validates :max_bets_number, length: { maximum: 100 }

  attribute :max_bets_number, default: 100
  attribute :closed_at, default: -> { Time.now + 3600 * 24 }
  attribute :resulted_at, default: -> { Time.now + 3600 * 24 * 7 }

  private

  def resulted_at_after_closed_at
    return if resulted_at.blank? || closed_at.blank?
    if resulted_at < closed_at
      errors.add(:resulted_at, "La date de résultat doit être après celle de clôture")
    end
  end
end
