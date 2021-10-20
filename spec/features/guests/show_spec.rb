require 'rails_helper'

RSpec.describe 'Animal Show' do 
  describe 'When I visit the Animal show page' do 
    it 'Displays the Animal and its Attributes' do 
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal = zoo.animals.create!(name: "Fred", has_covid: true, age: 10)
      visit "/animals/#{animal.id}"

      expect(page).to have_content(animal.name)
      expect(page).to have_content(animal.has_covid)
      expect(page).to have_content(animal.age)
    end 
  end 
end 
