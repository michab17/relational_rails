require "rails_helper"

RSpec.describe 'Animals Index' do
  describe 'When I visit the Animal Index Page' do
    it 'Displays the name of each Animal' do 
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal = zoo.animals.create!(name: "Fred", has_covid: true, age: 10)
      visit "/animals"
    
      expect(page).to have_content(animal.name)
      expect(page).to have_content(animal.has_covid)
      expect(page).to have_content(animal.age)
      expect(page).to have_content(animal.created_at)
      expect(page).to have_content(animal.updated_at)
    end

    it 'only displays animals with a true boolean' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal1 = zoo.animals.create!(name: "Fred", has_covid: false, age: 10)
      animal2 = zoo.animals.create!(name: "Jack", has_covid: true, age: 10)

      visit '/animals'

      expect(page).to have_content("Jack")
    end
  end 
  
  describe 'When I visit any page on the site' do 
    it 'Takes the user back to the Animal index' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      
      visit "/zoos/#{zoo.id}"
      
      expect(page).to have_link("Animals")

      click_link "Animals"

      expect(current_path).to eq("/zoos/#{zoo.id}/animals")

      visit '/zoos/new'

      expect(page).to have_link("Animals")

      click_link "Animals"

      expect(current_path).to eq("/animals")

      visit '/zoos'

      click_link "Animals"

      expect(current_path).to eq("/animals")
    end
  end
end