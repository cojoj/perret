require 'dev_plan'

class SearchController < ApplicationController

  before_filter :get_groups, :only  => [ :search, :available_places, :autocomplete ]

  def search
  end

  def available_places
    search_params = params[:search]
    groups = @groups.select { |g| g.name == search_params[:group_name] }
    id = groups.first.id
    start_date = search_params[:start_date]
    end_date = search_params[:end_date]

    @places = DevPlan.instance.available_places(id, start_date, end_date)
  end

  def autocomplete
    render json: @groups.map { |g| { name: g.name, id: g.id } }
  end

  private

  def get_groups
    @groups = DevPlan.instance.groups
  end

end