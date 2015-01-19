require 'dev_plan'

class SearchController < ApplicationController

  before_filter :get_groups, only: [ :search_group, :autocomplete_groups ]
  before_filter :get_rooms, only: [ :search_room, :autocomplete_rooms ]

  def index
  end

  def about_project
  end

  def search_group
  end

  def search_room
  end

  def available_places
    search_params = params[:search_group]
    ids = search_params[:groups].split(",")
    start_date = search_params[:start_date]
    end_date = search_params[:end_date]
    block_size = search_params[:block_size]
    internal = search_params[:internal]

    @places = DevPlan.instance.available_places(ids, start_date, end_date, block_size, internal)
  end

  def available_hours
    room_params = params[:search_room]

    @available_hours = DevPlan.instance.available_rooms(room_params[:room], room_params[:date])
  end

  def autocomplete_groups
    render json: @groups.map { |g| { name: g.name, id: g.id } }
  end

  def autocomplete_rooms
    render json: @rooms.map { |g| { name: g.name, id: g.id } }
  end

  private

    def get_groups
      @groups = DevPlan.instance.groups
    end

    def get_rooms
      @rooms = DevPlan.instance.places
    end

end