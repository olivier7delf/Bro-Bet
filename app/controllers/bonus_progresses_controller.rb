class BonusProgressesController < ApplicationController
  def create
    @bet = Bet.find(params["bet"].to_i)
    tournament = Tournament.find(params["tournament"].to_i)
    bonuse = BonusProgress.find(params["bonus"]).bonuse
    bonus_used = BonusProgress.new(bet: @bet, tournament: tournament, user: current_user, bonuse: bonuse, progress: "used")
    bonus_used.save
    redirect_to bet_path(@bet)
  end

  private

  def bet_participation_params
    params.require(:bet_participation).permit(:user_choice)
  end
end
