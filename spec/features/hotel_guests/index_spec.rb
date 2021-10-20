require 'rails_helper'

RSpec.describe 'Hotel Guests Index' do
  describe 'When I visit the Hotels Guestindex page' do
    it 'Displays all of the given Hotels Guest and their given attributes' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200)
      guest1 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10)
      guest2 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10)
      guest3 = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10)

      visit "/hotels/#{hotel.id}/guests"
      expect(page).to have_content(guest1.name)
      expect(page).to have_content(guest1.royalty_member)
      expect(page).to have_content(guest1.room_number)
      expect(page).to have_content(guest2.name)
      expect(page).to have_content(guest2.royalty_member)
      expect(page).to have_content(guest2.room_number)
      expect(page).to have_content(guest3.name)
      expect(page).to have_content(guest3.royalty_member)
      expect(page).to have_content(guest3.room_number)
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

  describe 'When I visit the hotel guests index page' do 
    it 'Displays Records Over the Given Number' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
      jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: true, room_number: 444)
 
      visit "/hotels/#{hotel_micha.id}/guests"
      expect(page).to have_button('Only return records with room number greater than the given number')

      expect(hotel_micha.guests_threshold(200)).to eq([jenifer])
    end 
  end 

  describe 'Hotel Guests index sorted' do
    it 'can set different values to the animals array' do
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
      jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: true, room_number: 444)
      fred = hotel_micha.guests.create!(name: "Fred", royalty_member: true, room_number: 444)
      visit "/hotels/#{hotel_micha.id}/guests?sort=true"

      expect(fred.name).to appear_before(jenifer.name)
      expect(jenifer.name).to appear_before(maximus.name)
    end
  end

  describe 'Hotel Guests index threshold' do
    it 'can set different values to the animals array' do
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
      jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: true, room_number: 444)
      fred = hotel_micha.guests.create!(name: "Fred", royalty_member: true, room_number: 1000)
      visit "/hotels/#{hotel_micha.id}/guests?num=500&commit=Only+return+records+with+room+number+greater+than+the+given+number'"

      expect(page).to have_content(fred.name)
      expect(page).to_not have_content(jenifer.name)
      expect(page).to_not have_content(maximus.name)
    end
  end
end