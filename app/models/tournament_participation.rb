class TournamentParticipation < ApplicationRecord
  belongs_to :tournament
  belongs_to :user

  attribute :score, default: 0
end
