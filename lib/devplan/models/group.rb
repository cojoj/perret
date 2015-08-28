module Devplan
  module Models

    class Group
      include ActiveModel::Model
      attr_accessor :id, :name, :type, :type_name
    end

  end
end
