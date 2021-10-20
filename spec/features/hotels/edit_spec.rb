require 'rails_helper'

RSpec.describe 'Hotel Update' do
  describe 'Parent Update' do 
    it 'Has a link to update parent' do 
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200, created_at: DateTime.now, updated_at: DateTime.now)

      visit "/hotels/#{hotel.id}"

      click_link "Update Hotel"

      expect(current_path).to eq("/hotels/#{hotel.id}/edit")
      
      fill_in 'hotel[name]', with: 'Fred'
      check 'hotel[vacancy]'
      fill_in 'hotel[occupancy]', with: '10'


      click_button "Update Hotel"

      expect(current_path).to eq("/hotels/#{hotel.id}")
      expect(page).to have_content("Fred")
    end 
  end 
end