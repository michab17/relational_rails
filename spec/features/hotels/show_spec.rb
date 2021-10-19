require 'rails_helper'

RSpec.describe 'Hotel tests' do
  describe '/hotel/:id' do
    it 'displays all the hotels in the database' do
      hotel = Hotel.create(name: "hotel1", vacancy: true, occupancy: 200, created_at: DateTime.now, updated_at: DateTime.now)
      visit "/hotels/#{hotel.id}"

      expect(page).to have_content(hotel.name)
      expect(page).to have_content(hotel.vacancy)
      expect(page).to have_content(hotel.occupancy)
      expect(page).to have_content(hotel.created_at)
      expect(page).to have_content(hotel.updated_at)
    end

    it 'displays the number of children' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200, created_at: DateTime.now, updated_at: DateTime.now)
      guest1 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)
      guest2 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)
      guest3 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)

      visit "/hotels/#{hotel.id}"

      expect(page).to have_content('3')
    end
  end
end