require 'rails_helper'

RSpec.describe 'Edit Animal' do
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
end