require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "see the shelter with that id including the name, address, city, state and zip" do
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
    shelter_3 = Shelter.create(name: "Don's Doggos",
                              address: "123 Main St",
                              city: "Omaha",
                              state: "NE",
                              zip: "68102")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)

    visit "/shelters/#{shelter_2.id}"

    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_2.address)
    expect(page).to have_content(shelter_2.city)
    expect(page).to have_content(shelter_2.state)
    expect(page).to have_content(shelter_2.zip)

    visit "/shelters/#{shelter_3.id}"
    expect(page).to have_content(shelter_3.name)
    expect(page).to have_content(shelter_3.address)
    expect(page).to have_content(shelter_3.city)
    expect(page).to have_content(shelter_3.state)
    expect(page).to have_content(shelter_3.zip)
  end

  it "shows a form to edit the shelter's data and redirects to the edit page" do
    shelter_1 = Shelter.create(name: "Pablo's Puppies",
                              address: "123 Main St",
                              city: "Denver",
                              state: "CO",
                              zip: "80202")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link("Update Shelter")
    click_link "Update Shelter"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
  end
end
