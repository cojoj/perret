class Search
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_accessor :group_id, :start_date, :end_date

  def persisted?
    false
  end
end