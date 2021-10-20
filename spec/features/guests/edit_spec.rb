require 'rails_helper'

RSpec.describe 'Edit Guest' do
  describe 'When I visit the guest show page' do
    it 'updates the childs attributes' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 25)
      guest = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10)
      
      visit "/guests/#{guest.id}"

      click_link "Update Guest"

      expect(current_path).to eq("/guests/#{guest.id}/edit")

      fill_in 'guest[name]', with: 'Fred'
      check 'guest[royalty_member]'
      fill_in 'guest[room_number]', with: '144'

      click_button "Update Guest"

      expect(current_path).to eq("/guests/#{guest.id}")
      expect(page).to have_content('Fred')
      expect(page).to have_content('144')
    end
  end

  describe 'When I visit the guest index page' do 
    it 'takes user to child update page' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      guest = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 10)

      visit "/guests"

      click_link "Update Maximus"

      expect(current_path).to eq("/guests/#{guest.id}/edit")

      fill_in 'guest[name]', with: 'Fred'
      check 'guest[royalty_member]'
      fill_in 'guest[room_number]', with: '144'

      click_button "Update Guest"

      expect(current_path).to eq("/guests/#{guest.id}")
      expect(page).to have_content('Fred')
      expect(page).to have_content('144')
    end 
  end 

  describe 'Update From Parent Child Index' do 
    it 'takes user to parent update page' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      guest = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 10)

      visit "/hotels/#{hotel_micha.id}/guests"

      expect(page).to have_link("Update Maximus")

      click_link "Update Maximus"

      expect(current_path).to eq("/guests/#{guest.id}/edit")
    end 
  end 
end