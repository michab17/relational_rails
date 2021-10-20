require 'rails_helper'

RSpec.describe 'Hotel tests' do
  describe 'When I visit the Hotel Index page' do 
    it 'Displays a New Hotel button' do
      visit "/hotels"

      click_link "New Hotel"

      expect(current_path).to eq("/hotels/new")

      fill_in 'hotel[name]', with: 'Fred'
      check 'hotel[vacancy]'
      fill_in 'hotel[occupancy]', with: '10'

      click_button "Create Hotel"

      expect(current_path).to eq("/hotels")
      expect(page).to have_content("Fred")
    end
  end 
end