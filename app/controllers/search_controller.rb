require 'dev_plan'

class SearchController < ApplicationController

  before_filter :get_groups, :only  => [ :search, :autocomplete ]

  def search
  end

  def available_places
    search_params = params[:search]
    ids = search_params[:groups].split(",").map(&:to_i)
    start_date = search_params[:start_date]
    end_date = search_params[:end_date]

    @places = DevPlan.instance.available_places(ids, start_date, end_date)
  end

  def autocomplete
    render json: @groups.map { |g| { name: g.name, id: g.id } }
  end

  private

  def get_groups
    @groups = DevPlan.instance.groups
  end

end