require 'rails_helper'

RSpec.describe Guest, type: :model do 
  it {should belong_to :hotel}

  describe '#self.only_true' do
    it 'only displays guests with a true boolean' do
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
      jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: false, room_number: 444)

      visit '/guests'

      expect(page).to have_content("Maximus")
      expect(page).to_not have_content("Jenifer")
    end
  end

  describe '#self.threshold' do 
    xit 'returns guests over given number threshold' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
      jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: false, room_number: 444)

      expect(hotel_micha.guests.threshold(200)).to eq(jenifer)
    end 
  end 
end 