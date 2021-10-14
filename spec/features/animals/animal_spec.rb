require 'rails_helper'

RSpec.describe 'animal index' do 
  it 'shows the attributes of all the animals' do 
    zoo = Zoo.create!(name: "Zoo1", open: true, num_of_people: 200, created_at: DateTime.now, updated_at: DateTime.now)
    animal = zoo.animals.create!(name: "Fred", has_covid: false, age: 10, created_at: DateTime.now, updated_at: DateTime.now)
  
    visit "/animals"

    expect(page).to have_content(animal.name)
    expect(page).to have_content(animal.has_covid)
    expect(page).to have_content(animal.age)
    expect(page).to have_content(animal.created_at)
    expect(page).to have_content(animal.updated_at)
  end 
end 