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
end 