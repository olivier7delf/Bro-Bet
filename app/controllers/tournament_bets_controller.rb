class TournamentBetsController < ApplicationController
  # def index
  #   @user = current_user

  #   @finished_bets = @user.in_bets.where.not(result: nil)
  #   @finished_bets.order(resulted_at: :desc)

  #   @pending_bets = @user.in_bets.where(result: nil)
  #   @pending_bets.order(resulted_at: :desc)
  # end

  def create
    @bet = Bet.find(params["bet_id"])
    @tournament = Tournament.find(params["tournament_id"])
    tournamet_bet = TournamentBet.new(bet: @bet, tournament: @tournament)
    tournamet_bet.save
    redirect_to tournament_path(@tournament)
  end

  private

  def bet_participation_params
    params.require(:bet_participation).permit(:user_choice)
  end
end
