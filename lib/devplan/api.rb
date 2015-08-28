require 'rest_client'
require 'singleton'

require 'devplan/models/group'
require 'devplan/models/place'

module Devplan

  class Api

    include Singleton

    BASE_API_URL = Rails.configuration.x.devplan_url # base URL for devPlan resources
    GROUPS_ENDPOINT = "groups"
    PLACES_ENDPOINT = "places"
    AVAILABLE_PLACES_ENDPOINT = "places/available"

    def initialize
      @client = RestClient::Resource.new(BASE_API_URL)
    end

    def groups
      JSON.parse(@client[GROUPS_ENDPOINT].get).map { |g| Models::Group.new(g) }
    end

    def places
      JSON.parse(@client[PLACES_ENDPOINT].get).map { |r| Models::Place.new(r)}
    end

    def available_places(id, start_date, end_date, block_size, internal)

      uri = CGI.unescape({
          group_id: id,
          start_date: start_date,
          end_date: end_date,
          block_size: block_size,
          internal_only: internal == "1" ? "true" : "false"
      }.to_query)

      JSON.parse(@client[AVAILABLE_PLACES_ENDPOINT+"?"+uri].get)

    end

  end
end