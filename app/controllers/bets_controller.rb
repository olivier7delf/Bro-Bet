class BetsController < ApplicationController
  before_action :set_bet, only: [:show]
  def index
    @user = current_user

    @finished_bets = @user.in_bets.where.not(result: nil).order(resulted_at: :asc)

    @pending_bets = @user.in_bets.where(result: nil).order(resulted_at: :asc)
  end

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
