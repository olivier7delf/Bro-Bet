class BetParticipationsController < ApplicationController
  def index
    @user = current_user

    @finished_bets = @user.in_bets.where.not(result: nil)
    @finished_bets.order(resulted_at: :desc)

    @pending_bets = @user.in_bets.where(result: nil)
    @pending_bets.order(resulted_at: :desc)
  end
end
