class BetsController < ApplicationController
  def show
    @bet = Bet.find(params[:id])
    if @bet.user == current_user
      redirect_to my_bet_path(@bet)
    end
  end
end
