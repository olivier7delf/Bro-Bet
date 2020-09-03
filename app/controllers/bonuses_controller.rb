class BonusesController < ApplicationController
  def index
    @bonuses = Bonuse.all
  end
end
