class BetsController < ApplicationController
  before_action :set_bet, only: [:show]

  def show
    # @bet = Bet.find(params[:id])

    if @bet.user == current_user
      redirect_to my_bet_path(@bet)
    end
    # bet_progress
    # bet_user_result
    # @chatroom = @bet.chatroom
    # @message = Message.new()
    # get_available_tournaments

    bet_after_action_show

  end
end
