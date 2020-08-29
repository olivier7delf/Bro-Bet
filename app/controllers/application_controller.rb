class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def bet_progress
    dt = Time.now
    dt_parsed = Time.zone.local_to_utc(dt)
    if @bet.user == current_user
      if @bet.resulted_at > dt_parsed
        return "created"
      elsif @bet.resulted_at < dt_parsed && @bet.result == nil
        return "result_to_put"
      else
        return "finished"
      end
    end
    if @bet.closed_at > dt_parsed && BetParticipation.where(bet: @bet, user: current_user).empty?
      return "to join"
    elsif @bet.resulted_at > dt_parsed && @bet.closed_at < dt_parsed && !BetParticipation.where(bet: @bet, user: current_user).empty?
      return "joined"
    elsif @bet.resulted_at < dt_parsed && !BetParticipation.where(bet: @bet, user: current_user).empty?
      return "finished"
    end

    # if !@bet.result.nil?
    #   @progress = "resulted"
    # elsif @bet.user == current_user && dt > @bet.resulted_at #&& dt >= @bet.closed_at
    #   @progress = "result_input"
    # elsif dt >= @bet.closed_at
    #   @progress = "result_pending"
    # else
    #   @progress = "joined"
    # end
  end

  def bet_user_result
    if @progress == "resulted"
      @user_result = (@bet.result == BetParticipation.find_by(user: current_user, bet: @bet).user_choice)
      return @user_result
    end
  end
end
