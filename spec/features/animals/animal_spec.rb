require 'rails_helper'

RSpec.describe 'animal index' do 
  it 'shows the attributes of all the animals' do 
    zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
    animal = zoo.animals.create!(name: "Fred", has_covid: true, age: 10)
  
    visit "/animals"

    expect(page).to have_content(animal.name)
    expect(page).to have_content(animal.has_covid)
    expect(page).to have_content(animal.age)
    expect(page).to have_content(animal.created_at)
    expect(page).to have_content(animal.updated_at)
  end

  describe 'Create Child' do
    it 'creates a new child for given parent' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
  
      visit "/zoos/#{zoo.id}/animals"

      expect(page).to have_link("Create Animal")

      click_link "Create Animal"

      expect(current_path).to eq("/zoos/#{zoo.id}/animals/new")
      expect(page).to have_button("Create Animal")

      fill_in 'name', with: 'Fred'
      check 'has_covid'
      fill_in 'age', with: '10'

      click_button "Create Animal"

      expect(current_path).to eq("/zoos/#{zoo.id}/animals")
      expect(page).to have_content("Fred")
    end
  end

  describe 'Update' do
    it 'updates the childs attributes' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal = zoo.animals.create!(name: "Fred", has_covid: false, age: 10)
  
      visit "/animals/#{animal.id}"

      expect(page).to have_link("Update Animal")

      click_link "Update Animal"

      expect(current_path).to eq("/animals/#{animal.id}/edit")

      fill_in 'animal[name]', with: 'Elizabeth'
      check 'animal[has_covid]'
      fill_in 'animal[age]', with: '8'

      click_button "Update Animal"

      expect(current_path).to eq("/animals/#{animal.id}")
      expect(page).to have_content('Elizabeth')
      expect(page).to have_content('8')
    end
  end

  describe 'Update From Child Index' do 
    it 'takes user to child update page' do 
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal = zoo.animals.create!(name: "Fred", has_covid: true, age: 10)

      visit "/animals"

      expect(page).to have_link("Update Fred")

      click_link "Update Fred"

      expect(current_path).to eq("/animals/#{animal.id}/edit")
    end 
  end 

  describe 'Update From Parent Child Index' do 
    it 'takes user to parent update page' do 
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal = zoo.animals.create!(name: "Fred", has_covid: false, age: 10)

      visit "/zoos/#{zoo.id}/animals"

      expect(page).to have_link("Update Fred")

      click_link "Update Fred"

      expect(current_path).to eq("/animals/#{animal.id}/edit")
    end 
  end 

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