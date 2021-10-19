class Guest < ApplicationRecord 
  belongs_to :hotel 

  def self.only_true
    Guest.where("royalty_member = true")
  end
end 