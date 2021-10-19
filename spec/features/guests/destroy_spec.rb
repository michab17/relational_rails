require 'rails_helper'

RSpec.describe 'Destory Guest' do
  describe 'Delete Child' do 
    it 'Deletes an Instance of a Child' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)

      visit "/guests/#{maximus.id}"
      expect(page).to have_link("Delete Guest")
      click_link "Delete Guest"
      expect(current_path).to eq("/guests")
      expect(page).to_not have_content("Maximus")
    end 
  end

  describe 'Delete from Child Index' do 
    it 'has a delete link' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)

      visit "/guests"

      expect(page).to have_link("Delete")
    end 
  end 
end