require 'rails_helper'

RSpec.describe 'Hotel Show Page' do
  describe 'When I visit the Hotel Show Page' do
    it 'Displays the Hotel and its attributes' do
      hotel = Hotel.create(name: "hotel1", vacancy: true, occupancy: 200, created_at: DateTime.now, updated_at: DateTime.now)
      visit "/hotels/#{hotel.id}"

      expect(page).to have_content(hotel.name)
      expect(page).to have_content(hotel.vacancy)
      expect(page).to have_content(hotel.occupancy)
      expect(page).to have_content(hotel.created_at)
      expect(page).to have_content(hotel.updated_at)
    end

    it 'Displays the number of Guests' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200)
      guest1 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10)
      guest2 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10)
      guest3 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10)

      visit "/hotels/#{hotel.id}"

      expect(page).to have_content(hotel.guests.length)
    end

    it 'I see a link to take me to the associated Animals page' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200)
      guest1 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10)
      guest2 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10)
      guest3 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10)

      visit "/hotels/#{hotel.id}"

      expect(page).to have_link("Guests")
      click_link "Guests"

      expect(current_path).to eq("/hotels/#{hotel.id}/guests") 
    end

  end
end