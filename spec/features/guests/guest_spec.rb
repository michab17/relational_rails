require 'rails_helper'

RSpec.describe 'guest index' do 
  it 'shows the attributes of all the guests' do 
    hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 25, opening_day: DateTime.new(1776, 11, 10, 23, 22, 0), newest_check_in: DateTime.now)
    guest = hotel.guests.create!(name: "Maximus", royalty_member: false, room_number: 10, check_in: DateTime.new(2021, 5, 2, 7, 25, 0), expected_check_out: DateTime.new(2021, 10, 14, 9, 15, 0))
  
    visit "/animals"

    expect(page).to have_content(animal.name)
    expect(page).to have_content(animal.has_covid)
    expect(page).to have_content(animal.age)
    expect(page).to have_content(animal.day_added)
    expect(page).to have_content(animal.release_date)
  end 
end 