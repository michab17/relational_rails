require 'rails_helper'

RSpec.describe 'Hotel Index' do
  describe 'When I visit the Hotel Index Page' do
    it 'Displays the name of each Hotel' do
      hotel = Hotel.create(name: "hotel1", vacancy: true, occupancy: 200)
      hotel2 = Hotel.create(name: "hotel2", vacancy: false, occupancy: 0)
      visit "/hotels"

      expect(page).to have_content("Hotels")
      expect(page).to have_content(hotel.name)
      expect(page).to have_content(hotel2.name)
      expect(page).to_not have_content("Hotel 3")

    end
    
    it 'Is ordered by most recently created' do
      hotel1 = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200)
      hotel4 = Hotel.create!(name: "hotel4", vacancy: true, occupancy: 1000)
      hotel3 = Hotel.create!(name: "hotel3", vacancy: true, occupancy: 100)
      hotel2 = Hotel.create!(name: "hotel2", vacancy: false, occupancy: 0)
      
      visit "/hotels"
      
      expect(Hotel.reverse_order).to eq([hotel1, hotel4, hotel3, hotel2])
    end

    it 'Shows next to each Hotel when it was created' do
      hotel1 = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200)
      hotel4 = Hotel.create!(name: "hotel4", vacancy: true, occupancy: 1000)
      hotel3 = Hotel.create!(name: "hotel3", vacancy: true, occupancy: 100)
      hotel2 = Hotel.create!(name: "hotel2", vacancy: false, occupancy: 0)
      
      visit "/hotels"
      
      expect(page).to have_content(hotel1.created_at)
      expect(page).to have_content(hotel4.created_at)
      expect(page).to have_content(hotel3.created_at)
      expect(page).to have_content(hotel2.created_at)
    end

    it 'has a link to sort instances by number of guests' do
      hotel1 = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 25, created_at: DateTime.now, updated_at: DateTime.now)
      guest1 = hotel1.guests.create!(name: "Maximus", royalty_member: false, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)
      
      hotel2 = Hotel.create!(name: "hotel2", vacancy: true, occupancy: 25, created_at: DateTime.now, updated_at: DateTime.now)
      guest1 = hotel2.guests.create!(name: "Maximus", royalty_member: false, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)
      guest2 = hotel2.guests.create!(name: "Jack", royalty_member: true, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)

      visit '/hotels?sort=true'

      expect(hotel2.name).to appear_before(hotel1.name) 
      expect(page).to have_content('Number of guests: 2')
      expect(page).to have_content('Number of guests: 1')
    end
  end

  describe 'When I visit any page on the site' do
    it 'Takes the user back to the Hotel index' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200)

      visit "/hotels/#{hotel.id}"

      expect(page).to have_link("Hotels")

      click_link "Hotels"

      expect(current_path).to eq("/hotels")
      expect(current_path).to_not eq("/hotels/#{hotel.id}")

      visit '/hotels/new'

      expect(page).to have_link("Hotels")

      click_link "Hotels"

      expect(current_path).to eq("/hotels")

      visit '/guests'

      click_link "Hotels"

      expect(current_path).to eq("/hotels")
    end
  end
end