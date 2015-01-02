require 'dev_plan'

class SearchController < ApplicationController

  def search
    @places = JSON.parse(DevPlan.instance.places)
  end

end