require 'rails_helper'

RSpec.describe 'Hotel tests' do
  describe '/hotel' do
    it 'displays Hotels' do
      visit "/hotels"

      expect(page).to have_content("Hotels")
    end

    it 'displays all the hotels in the database' do
      hotel = Hotel.create(name: "hotel1", vacancy: true, occupancy: 200, created_at: DateTime.now, updated_at: DateTime.now)
      hotel2 = Hotel.create(name: "hotel2", vacancy: false, occupancy: 0, created_at: DateTime.now, updated_at: DateTime.now)
      visit "/hotels"

      expect(page).to have_content(hotel.name)
      expect(page).to have_content(hotel2.name)
    end
  end

  describe '/hotels' do
    it 'the instances of hotel should be ordered by created at' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200, created_at: DateTime.now, updated_at: DateTime.now)
      hotel4 = Hotel.create!(name: "hotel4", vacancy: true, occupancy: 1000, created_at: DateTime.now, updated_at: DateTime.now)
      hotel3 = Hotel.create!(name: "hotel3", vacancy: true, occupancy: 100, created_at: DateTime.now, updated_at: DateTime.now)
      hotel2 = Hotel.create!(name: "hotel2", vacancy: false, occupancy: 0, created_at: DateTime.now, updated_at: DateTime.now)
  
      visit "/hotels"
  
      expect(page).to have_content(hotel.name)
      expect(page).to have_content(hotel.created_at)
      expect(page).to have_content(hotel4.name)
      expect(page).to have_content(hotel4.created_at)
      expect(page).to have_content(hotel3.name)
      expect(page).to have_content(hotel3.created_at)
      expect(page).to have_content(hotel2.name)
      expect(page).to have_content(hotel2.created_at)
    end
  end

  describe 'Parent Index Link' do
    it 'takes the user back to the parent index' do
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200, created_at: DateTime.now, updated_at: DateTime.now)

      visit "/hotels/#{hotel.id}"

      expect(page).to have_link("Hotels")

      click_link "Hotels"

      expect(current_path).to eq("/hotels")
      expect(current_path).to_not eq("/hotels/#{hotel.id}")

      visit '/hotels/new'

      expect(page).to have_link("Hotels")

      click_link "Hotels"

      expect(current_path).to eq("/hotels")

      visit '/guests'

      click_link "Hotels"

      expect(current_path).to eq("/hotels")
    end
  end
end