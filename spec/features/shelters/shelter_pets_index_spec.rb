require 'rails_helper'

describe "Shelter Pets Index Page", type: :feature do
  it "can see the name of each pet belonging to that shelter in the system" do
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
    pet_1 = Pet.create( image: "/img/fido.jpg",
                    name: "Fido",
                    age: 4,
                    sex: "male",
                    shelter: shelter_1,
                    description: "cute puppy",
                    adoption_status: "adoptable")
    pet_2 = Pet.create( image: "/img/spot.jpg",
                    name: "Spot",
                    age: 1,
                    sex: "female",
                    shelter: shelter_2,
                    description: "spotted puppy",
                    adoption_status: "adoptable")

    visit "/shelters/#{shelter_1.id}/pets"
    expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)

    expect(page).to_not have_content(pet_2.image)
    expect(page).to_not have_content(pet_2.name)
    expect(page).to_not have_content(pet_2.age)
    expect(page).to_not have_content(pet_2.sex)
  end

  it "has a link to add a new adoptable pet" do
      shelter_1 = Shelter.create(name: "Pablo's Puppies",
                                address: "123 Main St",
                                city: "Denver",
                                state: "CO",
                                zip: "80202")

      visit "/shelters/#{shelter_1.id}/pets"
      expect(page).to have_link("Create Pet")
      click_link("Create Pet")
      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")
  end

  it "has links next to each pet to edit that pet" do
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

      visit "/shelters/#{shelter_1.id}/pets"
      expect(page).to have_link("Edit Pet")
      click_link("Edit Pet")
      expect(current_path).to eq("/pets/#{pet_1.id}/edit")
  end

  it "has links next to each pet to delete that pet" do
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

      visit "/shelters/#{shelter_1.id}/pets"
      expect(page).to have_content("Fido")
      expect(page).to have_link("Delete Pet")
      click_link("Delete Pet")
      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("Fido")
  end

  it "has links on each pet name that take you to that pet's show page" do
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

      visit "/shelters/#{shelter_1.id}/pets"
      expect(page).to have_link("Fido")
      click_link("Fido")
      expect(current_path).to eq("/pets/#{pet_1.id}")
  end
end
