class My::BetsController < ApplicationController
  def show
    @bet = Bet.find(params[:id])
  end

  def new
    @bet = Bet.new()
  end

  def create
    raise
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
