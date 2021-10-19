require 'rails_helper'

RSpec.describe 'Zoo tests' do
  describe '/zoos/:id' do
    it 'displays all the zoos in the database' do
      zoo = Zoo.create(name: "Zoo1", open: true, num_of_people: 200)
      visit "/zoos/#{zoo.id}"

      expect(page).to have_content(zoo.name)
      expect(page).to have_content(zoo.open)
      expect(page).to have_content(zoo.num_of_people)
      expect(page).to have_content(zoo.created_at)
      expect(page).to have_content(zoo.updated_at)
    end

    it 'displays the number of children' do
      zoo = Zoo.create!(name: "zoo1", open: true, num_of_people: 200)
      animal1 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10)
      animal2 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10)
      animal3 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10)

      visit "/zoos/#{zoo.id}"

      expect(page).to have_content('3')
    end
  end
end