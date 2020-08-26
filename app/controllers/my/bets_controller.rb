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
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
