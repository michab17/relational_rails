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

      expect(current_path).to eq("/zoos/new")
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

    it 'displays the number of children' do
      zoo = Zoo.create!(name: "zoo1", open: true, num_of_people: 200, created_at: DateTime.now, updated_at: DateTime.now)
      animal1 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10, created_at: DateTime.now, updated_at: DateTime.now)
      animal2 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10, created_at: DateTime.now, updated_at: DateTime.now)
      animal3 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10, created_at: DateTime.now, updated_at: DateTime.now)

      visit "/zoos/#{zoo.id}"

      expect(page).to have_content('3')
    end
  end

  describe '/zoos' do
    it 'the instances of zoo should be ordered by created at' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200, created_at: DateTime.now, updated_at: DateTime.now)
      zoo4 = Zoo.create!(name: "Zoo4", open: true, num_of_people: 1000, created_at: DateTime.now, updated_at: DateTime.now)
      zoo3 = Zoo.create!(name: "Zoo3", open: true, num_of_people: 100, created_at: DateTime.now, updated_at: DateTime.now)
      zoo2 = Zoo.create!(name: "Zoo2", open: false, num_of_people: 0, created_at: DateTime.now, updated_at: DateTime.now)
  
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
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200, created_at: DateTime.now, updated_at: DateTime.now)

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

  describe 'Child Index Link' do
    it 'takes the user to the child index' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200, created_at: DateTime.now, updated_at: DateTime.now)

      visit "/zoos/#{zoo.id}"

      expect(page).to have_link("Animals")

      click_link "Animals"

      expect(current_path).to eq("/animals")
      expect(current_path).to_not eq("/zoos/#{zoo.id}")

      visit 'zoos/new'

      expect(page).to have_link("Animals")

      click_link "Animals"

      expect(current_path).to eq("/animals")

      visit '/zoos'

      click_link "Animals"

      expect(current_path).to eq("/animals")
    end
  end

  describe 'Child Table Link' do
    it 'takes you to /zoos/:id/animals' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200, created_at: DateTime.now, updated_at: DateTime.now)

      visit "/zoos/#{zoo.id}"

      click_link "Animals"

      expect(current_path).to eq("/zoos/#{zoo.id}/animals")
    end
  end
end