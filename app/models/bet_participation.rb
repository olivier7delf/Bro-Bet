class BetParticipation < ApplicationRecord
  belongs_to :bet
  belongs_to :user

  validates :user_choice, presence: true
end
