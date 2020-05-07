require 'rails_helper'

describe "shelter new page", type: :feature do
  it "shows a form to enter a new shelter" do

    visit "/shelters/new"

    expect(page).to have_button("Create Shelter")
  end

  it "redirects to the shelter index page" do
    visit "/shelters/new"
    fill_in "shelter[name]", with: "Shelter A"
    fill_in "shelter[address]", with: "123 Main St"
    fill_in "shelter[city]", with: "Denver"
    fill_in "shelter[state]", with: "CO"
    fill_in "shelter[zip]", with: "80202"
    click_button "Create Shelter"
    expect(current_path).to eq("/shelters")
  end
end
