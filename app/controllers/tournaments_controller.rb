class TournamentsController < ApplicationController
  def show
    raise
    @tournament = Tournament.find(params[:id])
    tournament_progress
    if @tournament.user == current_user
      redirect_to my_tournament_path(@tournament)
    end
  end
end
