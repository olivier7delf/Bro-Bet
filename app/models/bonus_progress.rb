class BonusProgress < ApplicationRecord
  belongs_to :bonuse
  belongs_to :bet
  belongs_to :user
  belongs_to :tournament

  def self.calcul_available_bonuses(score, score_best_player)
    bonuses = Bonuse.all
    bonuses = bonuses.each { |bonus| bonus.probability = bonus.probability * (1.5 - score / (score_best_player + 1)) }
    available_bonuses = bonuses.select { |bonus| bonus.probability * 100 > Random.rand(1..100) }

  end

  def self.get_available_bonuses(user, bet, tournament)
    # raise
    BonusProgress.includes(:bonuse).where(user: user, bet: bet, tournament: tournament, progress: "available")
  end
end
