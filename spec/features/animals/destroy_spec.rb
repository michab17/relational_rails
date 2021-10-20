require 'rails_helper'

RSpec.describe 'Destroy Animal' do
  describe 'When I visit the animal show page' do 
    it 'Deletes an Instance of a Child' do 
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal = zoo.animals.create!(name: "Fred", has_covid: false, age: 10)

      visit "/animals/#{animal.id}"
      click_link "Delete Animal"
      expect(current_path).to eq("/animals")
      expect(page).to_not have_content("Fred")
    end 
  end

  describe 'When I visit the animals index page' do 
    it 'can delete an animal' do 
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal = zoo.animals.create!(name: "Fred", has_covid: true, age: 10)

      visit "/animals"

      click_link "Delete"

      expect(page).to_not have_content("Fred")
    end 
  end 
end 