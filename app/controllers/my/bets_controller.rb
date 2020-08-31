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
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.user = current_user

    if @bet.save
      BetParticipation.create(bet: @bet, user: current_user, user_choice: @bet.owner_choice)
      redirect_to my_bet_path(@bet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @bet = Bet.find(params[:id])
    @bet.result = params[:bet][:result]
    @bet.save!
    redirect_to bet_path(@bet)
  end

  def destroy
  end

  private

  def bet_params
    params.require(:bet).permit(:title, :description, :stake, :owner_choice, :closed_at, :resulted_at)
  end
end
