class BetParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :bet

  #validates :user_choice, presence: true
end
