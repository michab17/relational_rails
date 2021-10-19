require 'rails_helper'

RSpec.describe 'Zoo edit' do
  describe 'Update From Parent Index' do 
    it 'takes user to parent update page' do 
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 200)

      visit "/zoos"

      expect(page).to have_link("Update Zootopia")

      click_link "Update Zootopia"

      expect(current_path).to eq("/zoos/#{zootopia.id}/edit")
    end 
  end
end