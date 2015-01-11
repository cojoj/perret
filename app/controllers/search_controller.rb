require 'dev_plan'

class SearchController < ApplicationController

  before_filter :get_groups, :only  => [ :search, :autocomplete ]

  def search
  end

  def available_places
    search_params = params[:search]
    ids = search_params[:groups].split(",")
    start_date = search_params[:start_date]
    end_date = search_params[:end_date]
    block_size = search_params[:block_size]
    internal = search_params[:internal]

    @places = DevPlan.instance.available_places(ids, start_date, end_date, block_size, internal)
  end

  def autocomplete
    render json: @groups.map { |g| { name: g.name, id: g.id } }
  end

  private

  def get_groups
    @groups = DevPlan.instance.groups
  end


  def rooms

  end

  def available_rooms

  end
end