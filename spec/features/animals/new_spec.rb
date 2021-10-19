require 'rails_helper'

RSpec.describe 'New Animal' do
  describe 'Create Animal' do
    it 'creates a new child for given parent' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)

      visit "/zoos/#{zoo.id}/animals"

      expect(page).to have_link("Create Animal")

      click_link "Create Animal"

      expect(current_path).to eq("/zoos/#{zoo.id}/animals/new")
      expect(page).to have_button("Create Animal")

      fill_in 'name', with: 'Fred'
      check 'has_covid'
      fill_in 'age', with: '10'

      click_button "Create Animal"

      expect(current_path).to eq("/zoos/#{zoo.id}/animals")
      expect(page).to have_content("Fred")
    end
  end
end