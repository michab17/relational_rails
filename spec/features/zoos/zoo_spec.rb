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

      expect(current_path).to eq("/zoos/#{zoo.id}/animals")

      visit '/zoos/new'

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

  describe 'Update From Parent Index' do 
    it 'takes user to parent update page' do 
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 200)

      visit "/zoos"

      expect(page).to have_link("Update Zootopia")

      click_link "Update Zootopia"

      expect(current_path).to eq("/zoos/#{zootopia.id}/edit")
    end 
  end 

  describe 'Delete Parent and its Children' do 
    it 'Deletes a Parent and all Child Records' do 
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 100)
      fred = zootopia.animals.create!(name: "Fred", has_covid: false, age: 20)
      prometheus = zootopia.animals.create!(name: "Prometheus", has_covid: false, age: 109)

      visit "/zoos/#{zootopia.id}"
      expect(page).to have_link("Delete Zoo")
      click_link "Delete Zoo"
      expect(current_path).to eq("/zoos")
      expect(page).to_not have_content("Zootopia")

      visit "/animals"
      expect(page).to_not have_content("Fred")
      expect(page).to_not have_content("Prometheus")
    end 
  end 

  describe 'Records Over a Given Threshold' do 
    xit 'Displays Records Over the Given Number' do 
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 100)
      fred = zootopia.animals.create!(name: "Fred", has_covid: false, age: 20)
      prometheus = zootopia.animals.create!(name: "Prometheus", has_covid: false, age: 109)
 
      visit "/zoos/#{zootopia.id}/animals"
      expect(page).to have_button('Only return records with animals older than the given number')

      fill_in 'age', with: '50'
      click_button 'Only return records with animals older than the given number'

      expect(page).to have_content("Prometheus")
      expect(page).to_not have_content("Fred")
    end 
  end 

  describe 'Delete from Parent Index' do 
    it 'has a delete link' do 
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 100)
      fred = zootopia.animals.create!(name: "Fred", has_covid: false, age: 20)
      prometheus = zootopia.animals.create!(name: "Prometheus", has_covid: false, age: 109)

      visit "/zoos"

      expect(page).to have_link("Delete")
    end 
  end 
end