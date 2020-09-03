class BetsController < ApplicationController
  before_action :set_bet, only: [:show]
  def index
    @user = current_user

    @finished_bets = @user.in_bets.where.not(result: nil)
    @finished_bets.order(resulted_at: :desc)

    @pending_bets = @user.in_bets.where(result: nil)
    @pending_bets.order(resulted_at: :desc)
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
