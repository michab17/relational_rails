require 'rails_helper'

RSpec.describe 'Zoo tests' do
  it 'displays a New Zoo button' do
    visit "/zoos"

    expect(page).to have_content("New Zoo")
  end

  it 'takes you to zoos/new if button is clicked' do
    visit "/zoos"
    click_link "New Zoo"

    expect(current_path).to eq("/zoos/new")
  end
end