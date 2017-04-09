class PollutionEntsController < ApplicationController
  def index
    @pollution_ents = PollutionEnt.all
  end
end
