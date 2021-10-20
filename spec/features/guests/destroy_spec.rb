require 'rails_helper'

RSpec.describe 'Destory Guest' do
  describe 'When I visit the guest show page' do 
    it 'Deletes an Instance of a Child' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)

      visit "/guests/#{maximus.id}"
      click_link "Delete Guest"
      expect(current_path).to eq("/guests")
      expect(page).to_not have_content("Maximus")
    end 
  end

  describe 'When I visit the guests index page' do 
    it 'can delete a guest' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)

      visit "/guests"

      click_link "Delete"

      expect(page).to_not have_content("Maximus")
    end 
  end 
end