class TournamentBet < ApplicationRecord
  belongs_to :tournament
  belongs_to :bet
end
