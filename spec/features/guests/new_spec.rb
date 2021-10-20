require 'rails_helper'

RSpec.describe 'Create Guest' do
  describe 'When I visit the Zoo Animals Index page' do
    it 'creates a new guest for given hotel' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200)

      visit "/hotels/#{hotel.id}/guests"

      click_link "Create Guest"

      expect(current_path).to eq("/hotels/#{hotel.id}/guests/new")

      fill_in 'name', with: 'Fred'
      check 'royalty_member'
      fill_in 'room_number', with: '10'

      click_button "Create Guest"

      expect(current_path).to eq("/hotels/#{hotel.id}/guests")
      expect(page).to have_content("Fred")
    end
  end
end