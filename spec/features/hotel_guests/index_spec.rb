require 'rails_helper'

RSpec.describe 'Hotel Guests Index' do
  describe 'Child Index Link' do
    it 'takes the user back to the child index' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200, created_at: DateTime.now, updated_at: DateTime.now)

      visit "/hotels/#{hotel.id}"

      expect(page).to have_link("Guests")

      click_link "Guests"

      expect(current_path).to eq("/hotels/#{hotel.id}/guests")

      visit '/hotels/new'

      expect(page).to have_link("Guests")

      click_link "Guests"

      expect(current_path).to eq("/guests")

      visit '/hotels'

      click_link "Guests"

      expect(current_path).to eq("/guests")
    end
  end

  describe 'Child Table Link' do
    it 'takes you to /hotels/:id/guests' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200, created_at: DateTime.now, updated_at: DateTime.now)

      visit "/hotels/#{hotel.id}"

      click_link "Guests"

      expect(current_path).to eq("/hotels/#{hotel.id}/guests")
    end
  end

  describe 'Show Parents Children' do
    it 'displays the given parents children' do
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
      jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: true, room_number: 444)

      visit "/hotels/#{hotel_micha.id}/guests"

      expect(page).to have_content("Maximus")
      expect(page).to have_content("Jenifer")
    end
  end

  describe 'Records Over a Given Threshold' do 
    it 'Displays Records Over the Given Number' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
      jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: true, room_number: 444)
 
      visit "/hotels/#{hotel_micha.id}/guests"
      expect(page).to have_button('Only return records with room number greater than the given number')

      expect(hotel_micha.guests_threshold(200)).to eq([jenifer])
    end 
  end 
end