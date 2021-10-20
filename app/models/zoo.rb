class Zoo < ApplicationRecord
  has_many :animals

  def self.reverse_order
    Zoo.order("created_at")
  end

  def animals_sort_by_name
    animals.order("name") 
  end

  def animals_threshold(num)
    animals.where("age > #{num}") 
  end

  def self.num_of_animals
    all.sort_by do |zoo|
      zoo.animals.length
    end.reverse
  end
end