class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bets
  has_many :bet_participations
  has_many :tournaments
  has_many :tournament_participations

  validates :nickname, presence: true, uniqueness: true
  validates :description, length: { maximum: 140 }
end
