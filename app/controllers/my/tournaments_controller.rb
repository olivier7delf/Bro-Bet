class My::TournamentsController < ApplicationController
  def show
    # raise
    @tournament = Tournament.find(params[:id])
    if @tournament.user != current_user
      redirect_to tournament_path(@tournament)
    end
    tournament_progress
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.user = current_user

    if @tournament.save
      redirect_to my_tournament_path(@tournament)
    else
      render :new
    end
  end

  def edit
    raise
  end

  def update
    @tournament = Tournament.find(params[:id])
    @tournament.result = params[:tournament][:result]
    @tournament.save!
    redirect_to tournament_path(@tournament)
  end

  def destroy
  end

  private

  def tournament_params
    params.require(:tournament).permit(:title, :description, :stake, :owner_choice, :closed_at, :resulted_at)
  end
end
