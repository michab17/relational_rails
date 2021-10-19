require 'rails_helper'

RSpec.describe Zoo do 
  it {should have_many :animals}

  describe '#sort_by_name' do
    it 'sorts the animals alphabetically' do
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 100)
      fred = zootopia.animals.create!(name: "Fred", has_covid: false, age: 20)
      prometheus = zootopia.animals.create!(name: "Prometheus", has_covid: false, age: 109)      
      elizabeth = zootopia.animals.create!(name: "Elizabeth", has_covid: true, age: 2)
      
      visit "zoos/#{zootopia.id}/animals"

      expect(page).to have_link("Alphabetize")

      expect(zootopia.animals_sort_by_name).to eq([elizabeth, fred, prometheus])
    end
  end

  describe '#animals_threshold' do 
    it 'returns guests over given number threshold' do 
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 100)
      fred = zootopia.animals.create!(name: "Fred", has_covid: false, age: 20)
      prometheus = zootopia.animals.create!(name: "Prometheus", has_covid: true, age: 109)

      expect(zootopia.animals_threshold(21)).to eq([prometheus])
    end 
  end 
end 