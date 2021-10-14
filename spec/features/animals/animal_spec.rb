require 'rails_helper'

RSpec.describe 'animal index' do 
  it 'shows the attributes of all the animals' do 
    zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200, opening_day: DateTime.new(1776, 11, 10, 23, 22, 0), animal_added: DateTime.now)
    animal = zoo.animals.create!(name: "Fred", has_covid: false, age: 10, day_added: DateTime.new(2020, 5, 2, 7, 25, 0), release_date: DateTime.new(2024, 3, 5, 9, 15, 0))
  
    visit "/animals"

    expect(page).to have_content(animal.name)
    expect(page).to have_content(animal.has_covid)
    expect(page).to have_content(animal.age)
    expect(page).to have_content(animal.day_added)
    expect(page).to have_content(animal.release_date)
  end 
end 