class Animal < ApplicationRecord 
  belongs_to :zoo

  def self.only_true
    Animal.where("has_covid = true")
  end
end 