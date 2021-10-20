require 'rails_helper'

RSpec.describe 'Zoo Edit' do
  describe 'When I visit the zoo show page' do 
    it 'Has a link to update zoo' do 
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 200)

      visit "/zoos/#{zootopia.id}"

      click_link "Update Zoo"

      expect(current_path).to eq("/zoos/#{zootopia.id}/edit")
      
      fill_in 'zoo[name]', with: 'Fred'
      check 'zoo[open]'
      fill_in 'zoo[num_of_people]', with: '10'

      click_button "Update Zoo"

      expect(current_path).to eq("/zoos/#{zootopia.id}")
      expect(page).to have_content("Fred")
    end 
  end 

  describe 'When I visit the zoo index page' do 
    it 'takes user to parent update page' do 
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 200)

      visit "/zoos"

      click_link "Update Zootopia"

      expect(current_path).to eq("/zoos/#{zootopia.id}/edit")

      fill_in 'zoo[name]', with: 'Fred'
      check 'zoo[open]'
      fill_in 'zoo[num_of_people]', with: '10'


      click_button "Update Zoo"

      expect(current_path).to eq("/zoos/#{zootopia.id}")
      expect(page).to have_content("Fred")
    end 
  end
end