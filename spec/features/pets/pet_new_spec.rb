require 'rails_helper'

describe "pet new page", type: :feature do
  it "shows a form to enter a new pet" do
    shelter_1 = Shelter.create(name: "Pablo's Puppies",
                              address: "123 Main St",
                              city: "Denver",
                              state: "CO",
                              zip: "80202")

    visit "/shelters/#{shelter_1.id}/pets/new"

    expect(page).to have_button("Create Pet")
  end

  it "redirects to the shelter pet index page" do
    shelter_1 = Shelter.create(name: "Pablo's Puppies",
                              address: "123 Main St",
                              city: "Denver",
                              state: "CO",
                              zip: "80202")
    visit "/shelters/#{shelter_1.id}/pets/new"
    fill_in "image", with: "/img/fido.jpg"
    fill_in "name", with: "Fido"
    fill_in "description", with: "cute puppy"
    fill_in "age", with: "2"
    fill_in "sex", with: "male"
    click_button "Create Pet"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content("Fido")
  end
end
