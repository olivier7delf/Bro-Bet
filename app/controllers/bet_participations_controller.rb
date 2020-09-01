class BetParticipationsController < ApplicationController
  def index
    @user = current_user

    @finished_bets = @user.in_bets.where.not(result: nil)
    @finished_bets.order(resulted_at: :desc)

    @pending_bets = @user.in_bets.where(result: nil)
    @pending_bets.order(resulted_at: :desc)
  end

  def create
    @bet = Bet.find(params["bet_id"])
    bp = BetParticipation.new(bet_participation_params)
    bp.bet = @bet
    bp.user = current_user
    bp.save
    redirect_to bet_path(@bet)
  end

  private

  def bet_participation_params
    params.require(:bet_participation).permit(:user_choice)
  end
end
