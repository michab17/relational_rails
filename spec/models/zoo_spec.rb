require 'rails_helper'

RSpec.describe Zoo do 
  it {should have_many :animals}

  describe '#sort_by_name' do
    xit 'sorts the animals alphabetically' do
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 100)
      fred = zootopia.animals.create!(name: "Fred", has_covid: false, age: 20)
      prometheus = zootopia.animals.create!(name: "Prometheus", has_covid: false, age: 109)      
      elizabeth = zootopia.animals.create!(name: "Elizabeth", has_covid: true, age: 2)
      
      visit "zoos/#{zootopia.id}/animals"

      expect(page).to have_link("Alphabetize")

      click_link "Alphabetize"

      page.body.should =~ /elizabeth.*fred.*prometheus/
    end
  end
end 