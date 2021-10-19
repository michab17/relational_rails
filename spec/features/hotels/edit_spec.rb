require 'rails_helper'

RSpec.describe 'Hotel Update' do
  describe 'Parent Update' do 
    it 'has a link to update parent' do 
      hotel = Hotel.create!(name: "hotel1", vacancy: true, occupancy: 200, created_at: DateTime.now, updated_at: DateTime.now)

      visit "/hotels/#{hotel.id}"

      click_link "Update Hotel"

      expect(current_path).to eq("/hotels/#{hotel.id}/edit")
    end 
  end
  
  describe 'Update From Parent Index' do 
    it 'takes user to parent update page' do 
      hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)

      visit "/hotels"

      expect(page).to have_link("Update Hotel Micha")

      click_link "Update Hotel Micha"

      expect(current_path).to eq("/hotels/#{hotel_micha.id}/edit")
    end 
  end 
end