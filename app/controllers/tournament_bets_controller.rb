class TournamentBetsController < ApplicationController
  def index
    @user = current_user
    @tournament = Tournament.find(params["tournament_id"])
    @finished_tournament_bets = @tournament.bets.where("resulted_at < ?", DateTime.now).order(resulted_at: :asc)
    @pending_tournament_bets = @tournament.bets.where("resulted_at > ?", DateTime.now).order(resulted_at: :asc)

  end

  def create
    @bet = Bet.find(params["bet_id"])
    @tournament = Tournament.find(params["tournament_id"])
    tournamet_bet = TournamentBet.new(bet: @bet, tournament: @tournament)
    tournamet_bet.save
    redirect_to tournament_tournament_bets_path(@tournament)
  end

  private

  def bet_participation_params
    params.require(:bet_participation).permit(:user_choice)
  end
end


