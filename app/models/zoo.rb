class Zoo < ApplicationRecord
  has_many :animals

  def self.reverse_order
    Zoo.order("created_at").reverse
  end

  def self.sort_by_name
    Zoo.animals.order("name").reverse 
  end
end