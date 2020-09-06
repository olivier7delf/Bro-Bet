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

  def two_values_possible(a, b, a_probability)
    # a_probability : integer between 1 and 99
    if Random.rand(1..100) < a_probability
      return a
    else
      return b
    end
  end

  def update
    @tournament = @bet.tournaments.first
    @participations = TournamentParticipationsController.get_participations(@tournament)
    @used_bonuses = BonusProgress.includes(:bonuse).where(tournament: @tournament, bet: @bet, progress: "used")
    @used_bonuses.each do |used_bonus|
      if used_bonus.bonuse.title == "champignon"
        # raise
        used_bonus_to_update = BonusProgress.find_by(tournament: @tournament, bet: @bet, progress: "used", user: used_bonus.user)
        if bet_user_result(@bet, used_bonus.user)
          used_bonus_to_update.impact_score = (3 * 2).to_i
          used_bonus_to_update.save!
        end
      elsif used_bonus.bonuse.title == "brollard"
        used_bonus_to_update = BonusProgress.find_by(tournament: @tournament, bet: @bet, progress: "used", user: used_bonus.user)
        if bet_user_result(@bet, used_bonus.user) && Random.rand(1..100) >= 90
          used_bonus_to_update.impact_score = (3 * 2).to_i
          used_bonus_to_update.save!
        end
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
      if used_bonus.bonuse.title == "tortue bleue"
        user_target = User.find(TournamentParticipationsController.get_participations(@tournament).first["id"])
        used_bonus_to_update = BonusProgress.find_by(tournament: @tournament, bet: @bet, progress: "used", user: user_target)
        used_bonus_to_update.impact_score = two_values_possible(-2, 0, 90)
        used_bonus_to_update.save!
      end
    end

    @used_bonuses.each do |used_bonus|
      if used_bonus.bonuse.title == "tortue rouge"
        target_id = nil
        owner = false
        TournamentParticipationsController.get_participations(@tournament).to_a.reverse.map do |u|
          if owner
            target_id = u.id
            owner = false
          elsif u.id == used_bonus.user.id
            owner = true
          end
        end
        user_target = User.find(target_id)
        used_bonus_to_update = BonusProgress.find_by(tournament: @tournament, bet: @bet, progress: "used", user: user_target)
        used_bonus_to_update.impact_score = two_values_possible(-2, 0, 85)
        used_bonus_to_update.save!
      end
    end

    dynamite_used = false
    @used_bonuses.each do |used_bonus|
      if used_bonus.bonuse.title == "dynamite"
        while not dynamite_used
          @used_bonuses.each do |tmp_used_bonus|
            if tmp_used_bonus.user == used_bonus.user  && Random.rand(1..100) < 20
              used_bonus_to_update = BonusProgress.find_by(tournament: @tournament, bet: @bet, progress: "used", user: tmp_used_bonus.user)
              used_bonus_to_update.impact_score = -5
              used_bonus_to_update.save!
              dynamite_used = true
            elsif tmp_used_bonus.user != used_bonus.user  && Random.rand(1..100) < 10
              used_bonus_to_update = BonusProgress.find_by(tournament: @tournament, bet: @bet, progress: "used", user: tmp_used_bonus.user)
              used_bonus_to_update.impact_score = -5
              used_bonus_to_update.save!
              dynamite_used = true
            end
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
