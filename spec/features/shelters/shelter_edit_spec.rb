require 'rails_helper'

describe "shelter edit page", type: :feature do
  it "shows a form to edit the shelter's data" do
    shelter_1 = Shelter.create(name: "Pablo's Puppies",
                              address: "123 Main St",
                              city: "Denver",
                              state: "CO",
                              zip: "80202")
    shelter_2 = Shelter.create(name: "Matt's Mutts",
                              address: "321 Niam St",
                              city: "Boulder",
                              state: "CO",
                              zip: "80001")

    visit "/shelters/#{shelter_1.id}/edit"

    fill_in :name, with: "Pedro's Puppies"
    fill_in :address, with: "100 Dodge St"
    fill_in :city, with: "Omaha"
    fill_in :state, with: "NE"
    fill_in :zip, with: "68102"

    click_button "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("Pedro's Puppies")
    expect(page).to have_content("100 Dodge St")
    expect(page).to have_content("Omaha")
    expect(page).to have_content("NE")
    expect(page).to have_content("68102")
  end
end
