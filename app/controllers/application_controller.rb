class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :description])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def bet_progress
    dt = Time.now
    now = Time.zone.local_to_utc(dt)

    if !current_user.in_bets.include?(@bet)
      if @bet.closed_at > now
        @progress = "join_pending"
        @bet_participation = BetParticipation.new(bet: @bet, user: current_user)
      else
        @progress = "not_joined"
      end
    else
      if @bet.closed_at > now
        @progress = "joined"

      elsif @bet.resulted_at > now
        @progress = "result_pending"

      elsif @bet.resulted_at < now && @bet.result.nil? && current_user == @bet.user
        @progress =  "result_input"

      elsif !@bet.result.nil?
        @progress =  "resulted"
      else
        @progress = "result_pending"
      end
    end
  end

  def tournament_progress
    dt = Time.now
    now = Time.zone.local_to_utc(dt)
    if !current_user.in_tournaments.include?(@tournament)
      if @tournament.closed_at > now
        @tournament_progress = "join_pending"
        @tournament_participation = TournamentParticipation.new(tournament: @tournament, user: current_user)
      else
        @tournament_progress = "not_joined"
      end
    else
      if now > @tournament.resulted_at
        @tournament_progress = "resulted"
      elsif now > @tournament.closed_at
        @tournament_progress = "result_pending"
      else
        @tournament_progress = "joined"
      end
    end
  end

  def bet_user_result
    if @progress == "resulted"
      @user_result = (@bet.result == BetParticipation.find_by(user: current_user, bet: @bet).user_choice)
      return @user_result
    end
  end

  def get_available_tournaments
    @available_tournaments = current_user.in_tournaments.where.not(id: @bet.tournaments).where(
      "resulted_at > ? AND resulted_at > ?", DateTime.now, @bet.resulted_at)
    @available_tournaments = current_user.in_tournaments.where.not(id: @bet.tournaments).where(
      "resulted_at > ? ", DateTime.now)
  end
end
