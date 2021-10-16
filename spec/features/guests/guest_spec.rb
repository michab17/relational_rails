require 'rails_helper'

RSpec.describe 'guest index' do 
  it 'shows the attributes of all the guests' do 
    hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 25, created_at: DateTime.now, updated_at: DateTime.now)
    guest = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)
  
    visit "/guests"

    expect(page).to have_content(guest.name)
    expect(page).to have_content(guest.royalty_member)
    expect(page).to have_content(guest.room_number)
    expect(page).to have_content(guest.created_at)
    expect(page).to have_content(guest.updated_at)
  end 

  describe 'Create Child' do
    it 'creates a new child for given parent' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200)
  
      visit "/hotels/#{hotel.id}/guests"

      expect(page).to have_link("Create Guest")

      click_link "Create Guest"

      expect(current_path).to eq("/hotels/#{hotel.id}/guests/new")
      expect(page).to have_button("Create Guest")

      fill_in 'name', with: 'Fred'
      check 'royalty_member'
      fill_in 'room_number', with: '10'

      click_button "Create Guest"

      expect(current_path).to eq("/hotels/#{hotel.id}/guests")
      expect(page).to have_content("Fred")
    end
  end

  describe 'Update' do
    it 'updates the childs attributes' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 25)
      guest = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10)
      
      visit "/guests/#{guest.id}"

      expect(page).to have_link("Update Guest")

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
end 