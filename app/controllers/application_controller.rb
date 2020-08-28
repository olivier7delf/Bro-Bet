class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  ### Ajouter Tournoi dans la navbar de la show ?!

  def bet_progress
    dt = DateTime.now
    if !@bet.result.nil?
      @progress = "resulted"
    elsif @bet.user == current_user && dt > @bet.resulted_at
      @progress = "result_input"
    elsif dt >= @bet.closed_at
      @progress = "result_pending"
    else
      @progress = "joined"
    end
  end

  def tournament_progress
    dt = DateTime.now
    if dt > @tournament.resulted_at
      @tournament_progress = "resulted"
    elsif dt > @tournament.closed_at
      @tournament_progress = "result_pending"
    else
      @tournament_progress = "joined"
    end
  end

  def bet_user_result
    if @progress == "resulted"
      @user_result = (@bet.result == BetParticipation.find_by(user: current_user, bet: @bet).user_choice)
      return @user_result
    end
  end
end
