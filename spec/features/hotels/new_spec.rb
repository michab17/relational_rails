require 'rails_helper'

RSpec.describe 'Hotel tests' do
  it 'displays a New Hotel button' do
    visit "/hotels"

    expect(page).to have_content("New Hotel")
  end

  it 'takes you to hotels/new if button is clicked' do
    visit "/hotels"

    click_link "New Hotel"

    expect(current_path).to eq("/hotels/new")
    click_button "Create Hotel"

    expect(current_path).to eq("/hotels")
  end
end