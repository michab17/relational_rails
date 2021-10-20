require 'rails_helper'

RSpec.describe Hotel, type: :model do 
  it {should have_many :guests}

  describe '#sort_by_name' do
    it 'sorts the guests alphabetically' do
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
      jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: true, room_number: 444)
      fred = hotel_micha.guests.create!(name: "Fred", royalty_member: false, room_number: 999)

      visit "hotels/#{hotel_micha.id}/guests"

      expect(page).to have_link("Alphabetize")

      expect(hotel_micha.guests_sort_by_name).to eq([fred, jenifer, maximus])
    end
  end

  describe '#guests_threshold' do 
    it 'returns guests over given number threshold' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
      maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
      jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: false, room_number: 444)

      expect(hotel_micha.guests_threshold(200)).to eq([jenifer])
    end 
  end

  describe '::num_of_guests' do
    it 'sorts by number of guests' do
      hotel1 = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 25, created_at: DateTime.now, updated_at: DateTime.now)
      guest1 = hotel1.guests.create!(name: "Maximus", royalty_member: false, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)
      
      hotel2 = Hotel.create!(name: "hotel2", vacancy: true, occupancy: 25, created_at: DateTime.now, updated_at: DateTime.now)
      guest1 = hotel2.guests.create!(name: "Maximus", royalty_member: false, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)
      guest2 = hotel2.guests.create!(name: "Jack", royalty_member: true, room_number: 10, created_at: DateTime.now, updated_at: DateTime.now)

      expect(Hotel.num_of_guests).to eq([hotel2, hotel1])
    end
  end
end 