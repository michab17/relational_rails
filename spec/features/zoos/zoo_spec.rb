require 'rails_helper'

RSpec.describe 'Zoo tests' do
  describe '/zoo' do
    it 'displays Zoos' do
      visit "/zoos"

      expect(page).to have_content("Zoos")
    end

    it 'displays a New Zoo button' do
      visit "/zoos"

      expect(page).to have_content("New Zoo")
    end

    it 'takes you to zoos/new if button is clicked' do
      visit "/zoos"
      click_link "New Zoo"

      expect(page).to have_content("Enter a new zoo:")
    end

    it 'displays all the zoos in the database' do
      zoo = Zoo.create(name: "Zoo1", open: true, num_of_people: 200, opening_day: DateTime.new(1776, 11, 10, 23, 22, 0), animal_added: DateTime.now)
      zoo2 = Zoo.create(name: "Zoo2", open: false, num_of_people: 0, opening_day: DateTime.new(1986, 11, 10, 23, 22, 0), animal_added: DateTime.now)
      visit "/zoos"

      expect(page).to have_content(zoo.name)
      expect(page).to have_content(zoo2.name)
    end
  end

  describe '/zoos/:id' do
    it 'displays all the zoos in the database' do
      zoo = Zoo.create(name: "Zoo1", open: true, num_of_people: 200, opening_day: DateTime.new(1776, 11, 10, 23, 22, 0), animal_added: DateTime.now)
      visit "/zoos/#{zoo.id}"

      expect(page).to have_content(zoo.name)
      expect(page).to have_content(zoo.open)
      expect(page).to have_content(zoo.num_of_people)
      expect(page).to have_content(zoo.opening_day)
      expect(page).to have_content(zoo.animal_added)
    end
  end
end