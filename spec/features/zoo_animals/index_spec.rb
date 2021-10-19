require 'rails_helper'

RSpec.describe 'Zoo Animals Index' do
  describe 'Child Table Link' do
    it 'takes you to /zoos/:id/animals' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)

      visit "/zoos/#{zoo.id}"

      click_link "Animals"

      expect(current_path).to eq("/zoos/#{zoo.id}/animals")
    end
  end

  describe 'Show Parents Children' do
    it 'displays the given parents children' do
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 100)
      fred = zootopia.animals.create!(name: "Fred", has_covid: false, age: 20)
      prometheus = zootopia.animals.create!(name: "Prometheus", has_covid: false, age: 109)
      
      visit "zoos/#{zootopia.id}/animals"

      expect(page).to have_content("Fred")
      expect(page).to have_content("Prometheus")
    end
  end

  describe 'Records Over a Given Threshold' do 
    it 'Displays Records Over the Given Number' do 
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 100)
      fred = zootopia.animals.create!(name: "Fred", has_covid: false, age: 20)
      prometheus = zootopia.animals.create!(name: "Prometheus", has_covid: false, age: 109)
 
      visit "/zoos/#{zootopia.id}/animals"
      expect(page).to have_button('Only return records with animals older than the given number')

      expect(zootopia.animals_threshold(50)).to eq([prometheus])
    end 
  end 
end