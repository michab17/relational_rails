require 'rails_helper'

RSpec.describe 'Zoo Animals Index' do
  describe 'When I visit the Zoos Animal index page' do
    it 'Displays all of the given Zoos animals and their given attributes' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal1 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10)
      animal2 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10)
      animal3 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 10)

      visit "/zoos/#{zoo.id}/animals"
      expect(page).to have_content(animal1.name)
      expect(page).to have_content(animal1.has_covid)
      expect(page).to have_content(animal1.age)
      expect(page).to have_content(animal2.name)
      expect(page).to have_content(animal2.has_covid)
      expect(page).to have_content(animal2.age)
      expect(page).to have_content(animal3.name)
      expect(page).to have_content(animal3.has_covid)
      expect(page).to have_content(animal3.age)
    end
  end

  describe 'Show Parents Children' do
    it 'displays the given parents children' do
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 100)
      fred = zootopia.animals.create!(name: "Fred", has_covid: false, age: 20)
      prometheus = zootopia.animals.create!(name: "Prometheus", has_covid: false, age: 109)
      
      visit "zoos/#{zootopia.id}/animals"

      expect(page).to have_content("Fred")
      expect(page).to have_content("Prometheus")
    end
  end

  describe 'When I visit the zoo animals index page' do 
    it 'Displays Records Over the Given Number' do 
      zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 100)
      fred = zootopia.animals.create!(name: "Fred", has_covid: false, age: 20)
      prometheus = zootopia.animals.create!(name: "Prometheus", has_covid: false, age: 109)
 
      visit "/zoos/#{zootopia.id}/animals"
      expect(page).to have_button('Only return records with animals older than the given number')

      expect(zootopia.animals_threshold(50)).to eq([prometheus])
    end 
  end 

  describe 'Zoo Animals index sorted' do
    it 'can set different values to the animals array' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal1 = zoo.animals.create!(name: "Alex", has_covid: false, age: 10)
      animal2 = zoo.animals.create!(name: "Charlie", has_covid: false, age: 10)
      animal3 = zoo.animals.create!(name: "Ben", has_covid: false, age: 10)
      visit "/zoos/#{zoo.id}/animals?sort=true"

      expect(animal1.name).to appear_before(animal3.name)
      expect(animal3.name).to appear_before(animal2.name)
    end
  end

  describe 'Zoo Animals index threshold' do
    it 'can set different values to the animals array' do
      zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200)
      animal1 = zoo.animals.create!(name: "test2", has_covid: false, age: 10)
      animal2 = zoo.animals.create!(name: "test1", has_covid: false, age: 100)
      animal3 = zoo.animals.create!(name: "Maximus", has_covid: false, age: 200)
      visit "/zoos/#{zoo.id}/animals?num=101&commit=Only+return+records+with+animals+older+than+the+given+number"

      expect(page).to have_content(animal3.name)
      expect(page).to_not have_content(animal1.name)
      expect(page).to_not have_content(animal2.name)
    end
  end
end