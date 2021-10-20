require 'rails_helper'

RSpec.describe Animal, type: :model do 
  it {should belong_to :zoo}

  describe '::only_true' do
    it 'only displays animals with a true boolean' do
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 100)
      fred = zootopia.animals.create!(name: "Fred", has_covid: false, age: 20)
      prometheus = zootopia.animals.create!(name: "Prometheus", has_covid: true, age: 109)
      
      visit '/animals'
      
      expect(page).to have_content("Prometheus")
      expect(page).to_not have_content("Fred")
    end
  end
end 