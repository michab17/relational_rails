require 'rails_helper'

RSpec.describe 'Guest Index' do 
  describe 'When I visit the Animal Index Page' do
    it 'Displays the name of each Guest' do 
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 25, created_at: DateTime.now, updated_at: DateTime.now)
      guest = hotel.guests.create!(name: "Maximus", royalty_member: true, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)
      visit "/guests"

      expect(page).to have_content(guest.name)
      expect(page).to have_content(guest.royalty_member)
      expect(page).to have_content(guest.room_number)
      expect(page).to have_content(guest.created_at)
      expect(page).to have_content(guest.updated_at)
    end 

    it 'only displays guests with a true boolean' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 25, created_at: DateTime.now, updated_at: DateTime.now)
      guest1 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)
      guest2 = hotel.guests.create!(name: "Jack", royalty_member: true, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)
      
      visit "/guests"

      expect(page).to have_content('Jack')
    end
  end 

  describe 'When I visit any page on the site' do
    it 'Takes the user back to the Guest index' do
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
end