require 'rails_helper'

RSpec.describe Hotel, type: :model do 
  it {should have_many :guests}

  describe '#sort_by_name' do
    xit 'sorts the guests alphabetically' do
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
      jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: true, room_number: 444)
      fred = hotel_micha.guests.create!(name: "Fred", royalty_member: false, room_number: 999)

      visit "hotels/#{hotel_micha.id}/guests"

      expect(page).to have_link("Alphabetize")

      click_link "Alphabetize"

      expect(page).to have_content("Fred")
    end
  end
end 