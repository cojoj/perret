require 'dev_plan'

class SearchController < ApplicationController

  def search
    @groups = JSON.parse(DevPlan.instance.groups).map { |g| Group.new(g) }
  end

  def available_places
    search_params = params[:search]
    id = search_params[:group_id]
    start_date = search_params[:start_date]
    end_date = search_params[:end_date]

    @places = DevPlan.instance.available_places(id, start_date, end_date)
  end

end