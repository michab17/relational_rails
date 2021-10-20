require 'rails_helper'

RSpec.describe 'Zoo Index' do
  describe 'When I visit the Zoo Index Page' do
    it 'Displays the name of each Zoo' do 
      zoo = Zoo.create(name: "Zoo1", open: true, num_of_people: 200)
      zoo2 = Zoo.create(name: "Zoo2", open: false, num_of_people: 0)
      visit "/zoos"
      
      expect(page).to have_content("Zoos")
      expect(page).to have_content(zoo.name)
      expect(page).to have_content(zoo2.name)
      expect(page).to_not have_content("Zoo 3")
    end

    it 'Is ordered by most recently created' do
      zoo1 = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      zoo4 = Zoo.create!(name: "Zoo4", open: true, num_of_people: 1000)
      zoo3 = Zoo.create!(name: "Zoo3", open: true, num_of_people: 100)
      zoo2 = Zoo.create!(name: "Zoo2", open: false, num_of_people: 0)
  
      visit "/zoos"
  
      expect(Zoo.reverse_order).to eq([zoo1, zoo4, zoo3, zoo2])
    end

    it 'Shows next to each Hotel when it was created' do
      zoo1 = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      zoo4 = Zoo.create!(name: "Zoo4", open: true, num_of_people: 1000)
      zoo3 = Zoo.create!(name: "Zoo3", open: true, num_of_people: 100)
      zoo2 = Zoo.create!(name: "Zoo2", open: false, num_of_people: 0)
  
      visit "/zoos"
      
      expect(page).to have_content(zoo1.created_at)
      expect(page).to have_content(zoo4.created_at)
      expect(page).to have_content(zoo3.created_at)
      expect(page).to have_content(zoo2.created_at)
    end

  end

  describe 'When I visit any page on the site' do
    it 'Takes user back to the Zoo index' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)

      visit "/zoos/#{zoo.id}"

      expect(page).to have_link("Zoos")

      click_link "Zoos"

      expect(current_path).to eq("/zoos")
      expect(current_path).to_not eq("/zoos/#{zoo.id}")

      visit 'zoos/new'

      expect(page).to have_link("Zoos")

      click_link "Zoos"

      expect(current_path).to eq("/zoos")

      visit '/animals'

      click_link "Zoos"

      expect(current_path).to eq("/zoos")
    end
  end
end