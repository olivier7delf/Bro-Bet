class My::BetsController < ApplicationController
  def show
    @bet = Bet.find(params[:id])
  end

  def new
    @bet = Bet.new()
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.title = params["titre"]
    @bet.description = params["description"]
    @bet.stake = params["stake"]
    @bet.user = current_user

    if @bet.save
      redirect_to my_bet_path(@bet)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def bet_params
    params.require(:bet).permit(:owner_choice, :closed_at, :resulted_at)
  end
end
