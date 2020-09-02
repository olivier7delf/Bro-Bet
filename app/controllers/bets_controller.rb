class BetsController < ApplicationController
  def show
    @bet = Bet.find(params[:id])
    bet_progress
    bet_user_result

    if @bet.user == current_user
      redirect_to my_bet_path(@bet)
    end
    @chatroom = @bet.chatroom
    @message = Message.new()
  end
end
