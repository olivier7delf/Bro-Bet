

class UsersController < ApplicationController
  def show
    @user = current_user

    # query = "
    # SELECT
    #   COUNT (*)
    # FROM bets b
    #   JOIN bet_participations bp
    #   ON b.id = bp.bet_id
    #   AND b.result = bp.user_choice
    # WHERE b.user_id = #{@user.id}
    #   AND bp.user_id = #{@user.id}"
  end

def count_my_victories
      compteur = 0
    bp_bs = BetParticipation.joins(:bet).where(user: User.last)
    # Joiture automatique de BetParticipation (model) et bet (la table is au singulier car belongs_to :bet in le modele)
    # where le user est celui choisit (ici le dernier)
    bp_b = bp_bs.last
    if bp_b.bet.result == bp_b.user_choice
      compteur += 1
    end
  end

  compteur = 0
  bp_bs = BetParticipation.joins(:bet).where(user: User.last)
  # bp_bs est une liste qu'il faut parcourir
  bp_bs.each do |bp_b|
  if bp_b.bet.result == bp_b.user_choice
    compteur += 1
  end
end

