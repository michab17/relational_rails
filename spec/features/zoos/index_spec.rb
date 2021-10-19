require 'rails_helper'

RSpec.describe 'Zoo tests' do
  describe '/zoo' do
    it 'displays Zoos' do
      visit "/zoos"

      expect(page).to have_content("Zoos")
    end

    it 'displays all the zoos in the database' do
      zoo = Zoo.create(name: "Zoo1", open: true, num_of_people: 200)
      zoo2 = Zoo.create(name: "Zoo2", open: false, num_of_people: 0)
      visit "/zoos"

      expect(page).to have_content(zoo.name)
      expect(page).to have_content(zoo2.name)
    end

    it 'the instances of zoo should be ordered by created at' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      zoo4 = Zoo.create!(name: "Zoo4", open: true, num_of_people: 1000)
      zoo3 = Zoo.create!(name: "Zoo3", open: true, num_of_people: 100)
      zoo2 = Zoo.create!(name: "Zoo2", open: false, num_of_people: 0)
  
      visit "/zoos"
  
      expect(page).to have_content(zoo.name)
      expect(page).to have_content(zoo.created_at)
      expect(page).to have_content(zoo4.name)
      expect(page).to have_content(zoo4.created_at)
      expect(page).to have_content(zoo3.name)
      expect(page).to have_content(zoo3.created_at)
      expect(page).to have_content(zoo2.name)
      expect(page).to have_content(zoo2.created_at)
    end
  end

  describe 'Parent Index Link' do
    it 'takes the user back to the parent index' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)

      visit "/zoos/#{zoo.id}"

      expect(page).to have_link("Zoos")

      click_link "Zoos"

      expect(current_path).to eq("/zoos")
      expect(current_path).to_not eq("/zoos/#{zoo.id}")

      visit 'zoos/new'

      expect(page).to have_link("Zoos")

      click_link "Zoos"

      expect(current_path).to eq("/zoos")

      visit '/animals'

      click_link "Zoos"

      expect(current_path).to eq("/zoos")
    end
  end
end