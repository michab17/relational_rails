require 'rails_helper'
RSpec.describe 'Zoo Show Page' do
  describe 'When I visit the Zoo Show Page' do
    it 'Displays the Zoo and its attributes' do
      zoo = Zoo.create(name: "Zoo1", open: true, num_of_people: 200)
      visit "/zoos/#{zoo.id}"

      expect(page).to have_content(zoo.name)
      expect(page).to have_content(zoo.open)
      expect(page).to have_content(zoo.num_of_people)
      expect(page).to have_content(zoo.created_at)
      expect(page).to have_content(zoo.updated_at)
    end

    it 'Displays the number of Animals' do
      zoo = Zoo.create!(name: "zoo1", open: true, num_of_people: 200)
      animal1 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10)
      animal2 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10)
      animal3 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10)

      visit "/zoos/#{zoo.id}"

      expect(page).to have_content(zoo.animals.length)
    end

    it 'I see a link to take me to the associated Animals page' do
      zoo = Zoo.create!(name: "zoo1", open: true, num_of_people: 200)
      animal1 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10)
      animal2 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10)
      animal3 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10)

      visit "/zoos/#{zoo.id}"

      expect(page).to have_link("Animals")
      click_link "Animals"

      expect(current_path).to eq("/zoos/#{zoo.id}/animals") 
    end
  end
end