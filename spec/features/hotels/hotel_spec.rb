require 'rails_helper'

RSpec.describe 'Hotel tests' do
  describe '/hotel' do
    it 'displays Hotels' do
      visit "/hotels"

      expect(page).to have_content("Hotels")
    end

    it 'displays a New Hotel button' do
      visit "/hotels"

      expect(page).to have_content("New Hotel")
    end

    it 'takes you to hotels/new if button is clicked' do
      visit "/hotels"
      click_link "New Hotel"

      expect(page).to have_content("Enter a new hotel:")
    end

    it 'displays all the hotels in the database' do
      hotel = Hotel.create(name: "hotel1", vacancy: true, occupancy: 200, opening_day: DateTime.new(1776, 11, 10, 23, 22, 0), newest_check_in: DateTime.now)
      hotel2 = Hotel.create(name: "hotel2", vacancy: false, occupancy: 0, opening_day: DateTime.new(1986, 11, 10, 23, 22, 0), newest_check_in: DateTime.now)
      visit "/hotels"

      expect(page).to have_content(hotel.name)
      expect(page).to have_content(hotel2.name)
    end
  end

  describe '/hotel/:id' do
    it 'displays all the hotels in the database' do
      hotel = Hotel.create(name: "hotel1", vacancy: true, occupancy: 200, opening_day: DateTime.new(1776, 11, 10, 23, 22, 0), newest_check_in: DateTime.now)
      visit "/hotels/#{hotel.id}"

      expect(page).to have_content(hotel.name)
      expect(page).to have_content(hotel.vacancy)
      expect(page).to have_content(hotel.occupancy)
      expect(page).to have_content(hotel.opening_day)
      expect(page).to have_content(hotel.newest_check_in)
    end
  end
end