require 'rails_helper'

RSpec.describe 'Zoo tests' do
  describe 'When I visit the Zoo Index page' do 

    it 'Displays a New Zoo button' do
      visit "/zoos"

      click_link "New Zoo"

      expect(current_path).to eq("/zoos/new")

      fill_in 'zoo[name]', with: 'Fred'
      check 'zoo[open]'
      fill_in 'zoo[num_of_people]', with: '10'

      click_button "Create Zoo"

      expect(current_path).to eq("/zoos")
      expect(page).to have_content("Fred")
    end
  end 
end