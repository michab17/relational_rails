require 'rails_helper'

RSpec.describe 'Destroy Animal' do
  describe 'Delete Child' do 
    it 'Deletes an Instance of a Child' do 
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal = zoo.animals.create!(name: "Fred", has_covid: false, age: 10)

      visit "/animals/#{animal.id}"
      expect(page).to have_link("Delete Animal")
      click_link "Delete Animal"
      expect(current_path).to eq("/animals")
      expect(page).to_not have_content("Fred")
    end 
  end

  describe 'Delete from Child Index' do 
    it 'has a delete link' do 
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal = zoo.animals.create!(name: "Fred", has_covid: true, age: 10)

      visit "/animals"
      expect(page).to have_link("Delete")
    end 
  end 
end 