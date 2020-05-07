require 'rails_helper'

describe "shelter new page", type: :feature do
  it "shows a form to enter a new shelter" do

    visit "/shelters/new"

    expect(page).to have_button("Create Shelter")
  end

  it "redirects to the shelter index page" do
    visit "/shelters/new"
    fill_in "name", with: "Shelter A"
    fill_in "address", with: "123 Main St"
    fill_in "city", with: "Denver"
    fill_in "state", with: "CO"
    fill_in "zip", with: "80202"
    click_button "Create Shelter"
    expect(current_path).to eq("/shelters")
    expect(page).to have_content("Shelter A")
  end
end
