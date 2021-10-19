require 'rails_helper'

RSpec.describe 'Destroy Zoo' do
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