class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bet_participations
  has_many :bets
  has_many :in_bets, through: :bet_participations, class_name: "Bet", foreign_key: "bet_id", source: :bet

  has_one_attached :photo
  # has_many :created_bets, class_name: :bet, foreign_key: :user_id #  through: :bet_participations, source: :bets

  has_many :tournaments
  has_many :tournament_participations
  has_many :in_tournaments, through: :tournament_participations, class_name: "Tournament", foreign_key: "tournament_id", source: :tournament
  has_many :tournament_bets, through: :in_tournaments
  has_many :in_in_bets, through: :tournament_bets, class_name: "Bet", foreign_key: "bet_id", source: :bet

  validates :nickname, presence: true, uniqueness: true
  validates :description, length: { maximum: 140 }
end
