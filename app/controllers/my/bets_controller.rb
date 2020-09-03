class My::BetsController < ApplicationController

  before_action :set_bet, only: [:show, :update]

  def show
    # @bet = Bet.find(params[:id])

    if @bet.user != current_user
      redirect_to bet_path(@bet)
    end




    bet_after_action_show
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.user = current_user

    if @bet.save
      BetParticipation.create(bet: @bet, user: current_user, user_choice: @bet.owner_choice)
      Chatroom.create(name: "bet-#{@bet.id}", bet: @bet)
      redirect_to my_bet_path(@bet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tournament = @bet.tournaments.first
    @participations = TournamentParticipationsController.get_participations(@tournament)
    @used_bonuses = BonusProgress.includes(:bonuse).where(tournament: @tournament, bet: @bet, progress: "used")
    @used_bonuses.each do |used_bonus|
      if used_bonus.bonuse.title == "champignon"
        used_bonus_to_update = BonusProgress.find_by(tournament: @tournament, bet: @bet, progress: "used", user: used_bonus.user)
        used_bonus_to_update.impact_score = (3 * 2).to_i
        # TODO query to check result true ! else 0 !
        used_bonus_to_update.save!
        # raise
      end
    end
    @used_bonuses.each do |used_bonus|
      if used_bonus.bonuse.title == "éclair"
        @used_bonuses.each do |tmp_used_bonus|
          if tmp_used_bonus.user != used_bonus.user
            used_bonus_to_update = BonusProgress.find_by(tournament: @tournament, bet: @bet, progress: "used", user: tmp_used_bonus.user)
            used_bonus_to_update.impact_score = -2
            used_bonus_to_update.save!
          end
        end
      end
    end
    @used_bonuses.each do |used_bonus|
      if used_bonus.bonuse.title == "étoile"
        used_bonus_to_update = BonusProgress.find_by(tournament: @tournament, bet: @bet, progress: "used", user: used_bonus.user)
        used_bonus_to_update.impact_score = 0
        used_bonus_to_update.save!
      end
    end

    @bet.result = params[:bet][:result]
    @bet.save!

    # find each user who re gonna be hitted by the bonus (user in tournament)
    # using their ranking (funtion in tournament_participation_controller)
    # if @bet.tournaments
    #   @tournament = @bet.tournaments.first
    #   get_participations
    #   raise

    # end

    redirect_to bet_path(@bet)
  end

  def destroy
  end

  private

  def bet_params
    params.require(:bet).permit(:title, :description, :stake, :owner_choice, :closed_at, :resulted_at)
  end
end
