class TournamentsController < ApplicationController
  def index
    @user = current_user
    @finished_tournaments = @user.in_tournaments.where("resulted_at < ?", DateTime.now).order(resulted_at: :desc)

    @pending_tournaments = @user.in_tournaments.where("resulted_at > ?", DateTime.now).order(resulted_at: :desc)
  end
  def show
    # raise

    # Récupérer tous les paris n'étant pas dans ce tournoi, ayant une date de cloture & résultat "OK"
    # Les afficher dans une partial et ajouter un bouton + pour ajouter au tournoi, avec une validation
    # Récupérer tous les paris dans le tournoi et les affichers dans une partial
    # Réflechir aux infos utilent à montrer.
    @tournament = Tournament.find(params[:id])
    @bets = @tournament.bets

    #raise
    tournament_progress
    if @tournament.user == current_user
      redirect_to my_tournament_path(@tournament)
    end

    @chatroom = @tournament.chatroom
    @message = Message.new()
    @available_bets = current_user.in_bets.where.not(id: @tournament.bets).where(
      "resulted_at > ? AND resulted_at < ?", DateTime.now, DateTime.now+500)
  end
end
