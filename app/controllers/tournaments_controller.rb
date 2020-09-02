class TournamentsController < ApplicationController
  def index
    @user = current_user
    @finished_tournaments = @user.in_tournaments.where("resulted_at < ?", DateTime.now)
    @finished_tournaments.order(resulted_at: :desc)

    @pending_tournaments = @user.in_tournaments.where("resulted_at > ?", DateTime.now)
    @pending_tournaments.order(resulted_at: :desc)
  end
  def show
    # raise

    # Récupérer tous les paris n'étant pas dans ce tournoi, ayant une date de cloture & résultat "OK"
    # Les afficher dans une partial et ajouter un bouton + pour ajouter au tournoi, avec une validation
    # Récupérer tous les paris dans le tournoi et les affichers dans une partial
    # Réflechir aux infos utilent à montrer.
    @tournament = Tournament.find(params[:id])
    @bets = @tournament.bets
    @available_bets = Bet.all.where(
      "resulted_at < '#{@tournament.resulted_at}'
      AND resulted_at > '#{DateTime.now}'
      AND result IN (true, false)"
      )

    #raise
    tournament_progress
    if @tournament.user == current_user
      redirect_to my_tournament_path(@tournament)
    end

    @chatroom = @tournament.chatroom
    @message = Message.new()
  end
end
