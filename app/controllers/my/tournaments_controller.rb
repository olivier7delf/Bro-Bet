class My::TournamentsController < ApplicationController
  def show
    # raise
    @tournament = Tournament.find(params[:id])
    if @tournament.user != current_user
      redirect_to tournament_path(@tournament)
    end
    tournament_progress

    @available_bets = current_user.in_bets.where(
      "resulted_at > ? AND resulted_at < ?", DateTime.now, DateTime.now+500)
    @available_bets.select { |bet| not in @tournament.bets }
    #modify here to delete bets which are already in the tournament
    @chatroom = @tournament.chatroom
    @message = Message.new()
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.user = current_user

    if @tournament.save
      TournamentParticipation.create(
        tournament: @tournament,
        user: current_user
      )
      Chatroom.create(name: "tournament-#{@tournament.id}", tournament: @tournament)

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
