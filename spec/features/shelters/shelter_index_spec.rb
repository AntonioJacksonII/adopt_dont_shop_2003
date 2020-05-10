require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can see the name of each shelter in the system" do
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

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end

  it "has the Create Shelter link and redirects to the shelter new page" do
    visit "/shelters"
    expect(page).to have_link("New Shelter")
    click_link "New Shelter"
    expect(current_path).to eq("/shelters/new")
  end

  it "has links on each shelter name that take you to that shelter's show page" do
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
    visit "/shelters"
    expect(page).to have_link("Pablo's Puppies")
    expect(page).to have_link("Matt's Mutts")
    click_link "Pablo's Puppies"
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
  end

    it "has links next to every shelter that take you to that shelter's edit page" do
      shelter_1 = Shelter.create(name: "Pablo's Puppies",
                                address: "123 Main St",
                                city: "Denver",
                                state: "CO",
                                zip: "80202")

      visit "/shelters"
      expect(page).to have_link("Edit Shelter")
      click_link "Edit Shelter"
      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
    end

    it "has links next to every shelter to delete that shelter" do
      shelter_1 = Shelter.create(name: "Pablo's Puppies",
                                address: "123 Main St",
                                city: "Denver",
                                state: "CO",
                                zip: "80202")

      visit "/shelters/"

      click_link "Delete Shelter"

      expect(current_path).to eq("/shelters")
      expect(page).to_not have_content("Pablo's Puppies")
    end

    it "has a link to the Pet index" do
      shelter_1 = Shelter.create(name: "Pablo's Puppies",
                                address: "123 Main St",
                                city: "Denver",
                                state: "CO",
                                zip: "80202")
      pet_1 = Pet.create( image: "/img/fido.jpg",
                          name: "Fido",
                          age: 4,
                          sex: "male",
                          shelter: shelter_1,
                          description: "cute puppy",
                          adoption_status: "adoptable")

      visit "/shelters"

      expect(page).to have_link("Pet Index")

      click_link "Pet Index"

      expect(current_path).to eq("/pets")
    end

    it "has a link to the Shelter index" do
      shelter_1 = Shelter.create(name: "Pablo's Puppies",
                                address: "123 Main St",
                                city: "Denver",
                                state: "CO",
                                zip: "80202")
      pet_1 = Pet.create( image: "/img/fido.jpg",
                          name: "Fido",
                          age: 4,
                          sex: "male",
                          shelter: shelter_1,
                          description: "cute puppy",
                          adoption_status: "adoptable")

      visit "/shelters"

      expect(page).to have_link("Shelter Index")

      click_link "Shelter Index"

      expect(current_path).to eq("/shelters")
    end
end
