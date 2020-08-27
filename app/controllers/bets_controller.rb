class BetsController < ApplicationController
  def show
    @bet = Bet.find(params[:id])
    bet_progress
    bet_user_result

    #BetParticipation.where(bet: Bet.last).left_outer_joins(:bet).distinct.select("*")

    if @bet.user == current_user
      redirect_to my_bet_path(@bet)
    end
  end
end
