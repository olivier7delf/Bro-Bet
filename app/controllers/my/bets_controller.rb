class My::BetsController < ApplicationController
  def show
    # raise
    @bet = Bet.find(params[:id])
    if @bet.user != current_user
      redirect_to bet_path(@bet)
    end
    bet_progress
    bet_user_result

  end

  def new
    @bet = Bet.new()
  end

  def create
    @bet = Bet.last
    redirect_to my_bet_path(@bet)
  end

  def edit
    raise
  end

  def update
    @bet = Bet.find(params[:id])
    @bet.result = params[:bet][:result]
    @bet.save!
    redirect_to bet_path(@bet)
  end

  def destroy
  end
end
