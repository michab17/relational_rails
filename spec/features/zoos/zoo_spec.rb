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
      zoo = Zoo.create(name: "Zoo1", open: true, num_of_people: 200, created_at: DateTime.now, updated_at: DateTime.now)
      zoo2 = Zoo.create(name: "Zoo2", open: false, num_of_people: 0, created_at: DateTime.now, updated_at: DateTime.now)
      visit "/zoos"

      expect(page).to have_content(zoo.name)
      expect(page).to have_content(zoo2.name)
    end
  end

  describe '/zoos/:id' do
    it 'displays all the zoos in the database' do
      zoo = Zoo.create(name: "Zoo1", open: true, num_of_people: 200, created_at: DateTime.now, updated_at: DateTime.now)
      visit "/zoos/#{zoo.id}"

      expect(page).to have_content(zoo.name)
      expect(page).to have_content(zoo.open)
      expect(page).to have_content(zoo.num_of_people)
      expect(page).to have_content(zoo.created_at)
      expect(page).to have_content(zoo.updated_at)
    end
  end

  describe '/zoos' do
    it 'the instances of zoo should be ordered by created at' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200, created_at: DateTime.now, updated_at: DateTime.now)
      zoo2 = Zoo.create!(name: "Zoo2", open: false, num_of_people: 0, created_at: DateTime.now, updated_at: DateTime.now)
      zoo3 = Zoo.create!(name: "Zoo3", open: true, num_of_people: 100, created_at: DateTime.now, updated_at: DateTime.now)
      zoo4 = Zoo.create!(name: "Zoo4", open: true, num_of_people: 1000, created_at: DateTime.now, updated_at: DateTime.now)
  
      visit "/zoos"
  
      save_and_open_page
  
      expect(page).to have_content(zoo.name)
    end
  end
end