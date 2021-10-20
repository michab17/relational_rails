class Hotel < ApplicationRecord
  has_many :guests

  def self.reverse_order
    order("created_at")
  end

  def guests_sort_by_name
    guests.order("name")
  end

  def guests_threshold(num)
    guests.where("room_number > #{num}") 
  end
end