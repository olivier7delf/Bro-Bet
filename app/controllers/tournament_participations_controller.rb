class TournamentParticipationsController < ApplicationController
  def index
    @tournament = Tournament.find(params["tournament_id"])
    @participations = @tournament.tournament_participations.order(score: :desc)
  end

  def create
    @tournament = Tournament.find(params["tournament_id"])
    tp = TournamentParticipation.new(tournament_id: params[:tournament_id])
    tp.tournament = @tournament
    tp.user = current_user
    tp.save
    redirect_to tournament_path(@tournament)
  end

  private

  # def tournament_participation_params
  #   params.require(:tournament_participation).permit(:score)
  # end
end
