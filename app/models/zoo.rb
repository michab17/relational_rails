class Zoo < ApplicationRecord
  has_many :animals

  def self.reverse_order
    Zoo.order("created_at").reverse
  end

  def animals_sort_by_name
    animals.order("name") 
  end

  def animals_threshold(num)
    animals.where("age > #{num}") 
  end
end