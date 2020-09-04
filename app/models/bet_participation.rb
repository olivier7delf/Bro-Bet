class BetParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :bet

  # validates :user_choice, presence: true
  def self.get_user_choice(bet, user)
    bet_participation = BetParticipation.find_by(bet: bet, user: user)
    if bet_participation
      if bet_participation.user_choice
        "BRO"
      else
        "NO BRO"
      end
    elsif bet.closed_at < DateTime.now
      "Trop tard"
    else
      "En attente"
    end
  end

  def self.get_user_result(bet)
    if bet
      if bet.user_choice
        "BRO"
      else
        "NO BRO"
      end
    elsif bet.closed_at < DateTime.now
      "Trop tard"
    else
      "En attente"
    end
  end
end
