require 'rest_client'
require 'singleton'

class DevPlan
  include Singleton

  BASE_API_URL = "http://cash.dev.uek.krakow.pl/api" # base URL for devPlan resources
  GROUPS_URL = "groups"
  PLACES_URL = "places"
  AVAILABLE_PLACES_URL = "places/available"
  ROOM_URL = "places"

  def initialize
    @client = RestClient::Resource.new(BASE_API_URL)
  end

  def groups
    groups = JSON.parse(@client[GROUPS_URL].get).map { |g| Group.new(g) }
  end

  def places
    places = JSON.parse(@client[PLACES_URL].get)
  end

  def available_places(id, start_date, end_date, block_size = 2, internal = false)
    uri = CGI.unescape({
        group_id: id,
        start_date: start_date,
        end_date: end_date,
        block_size: block_size,
        internal_only: internal
    }.to_query)

    places = JSON.parse(@client[AVAILABLE_PLACES_URL+"?"+uri].get)
  end

  def available_room(id, start_date)

    rooms = JSON.parse(@client["place/" + id + "/availability?date=" + start_date])
  end

end