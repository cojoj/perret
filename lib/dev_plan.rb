require 'rest_client'
require 'singleton'

class DevPlan
  include Singleton

  BASE_API_URL = "http://cash.dev.uek.krakow.pl/api" # base URL for devPlan resources
  GROUPS_URL = "groups"
  PLACES_URL = "places"
  AVAILABLE_PLACES_URL = "places/available"

  def initialize
    @client = RestClient::Resource.new(BASE_API_URL)
  end

  def groups
    groups = JSON.parse(@client[GROUPS_URL].get).map { |g| Group.new(g) }
  end

  def places
    places = JSON.parse(@client[PLACES_URL].get)
  end

  def available_places(id, start_date, end_date, block_size = 2)
    places = JSON.parse(@client[AVAILABLE_PLACES_URL].get params: {
                                                   group_id:  id,
                                                   start_date: start_date,
                                                   end_date: end_date,
                                                   block_size: block_size
                                               })
  end

end