require 'rails_helper'

RSpec.describe 'Destroy Hotel' do
  describe 'When I visit the hotel show page' do 
    it 'Can delete a Parent and all Child Records' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
      jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: true, room_number: 444)

      visit "/hotels/#{hotel_micha.id}"

      click_link "Delete Hotel"
      expect(current_path).to eq("/hotels")
      expect(page).to_not have_content("Hotel Micha")

      visit "/guests"
      expect(page).to_not have_content("Maximus")
      expect(page).to_not have_content("Jenifer")
    end 
  end 

  describe 'Delete from Parent Index' do 
    it 'can delete a hotel' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
      jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: true, room_number: 444)

      visit "/hotels"

      click_link "Delete"

      expect(page).to_not have_content("Hotel Micha")
    end 
  end 
end