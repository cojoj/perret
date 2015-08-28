module Devplan
  module Models

    class Place
      include ActiveModel::Model
      attr_accessor :id, :name, :full_name, :regular
    end

  end
end
