class Hotel < ApplicationRecord
  has_many :guests

  def self.reverse_order
    Hotel.order("created_at").reverse
  end

  def self.sort_by_name
    Hotel.animals.order("name")
  end
end