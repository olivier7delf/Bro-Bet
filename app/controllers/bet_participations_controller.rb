class BetParticipationsController < ApplicationController
  def index
    @bet_participations = BetParticipations.all
  end
end
