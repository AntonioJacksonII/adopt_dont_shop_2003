require 'rails_helper'

RSpec.describe "pet index page", type: :feature do
  it "can see the image, name, approximate age, sex, and shelter name for each pet in the system" do
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

    visit "/pets"

    expect(page).to have_content("Name: #{pet_1.name}")
    expect(page).to have_content("Age: #{pet_1.age}")
    expect(page).to have_content("Sex: #{pet_1.sex}")
    expect(page).to have_content("Shelter: #{pet_1.shelter.name}")
    expect(page).to have_content("Name: #{pet_2.name}")
    expect(page).to have_content("Age: #{pet_2.age}")
    expect(page).to have_content("Sex: #{pet_2.sex}")
    expect(page).to have_content("Shelter: #{pet_2.shelter.name}")
  end

  it "has links for each pet name that take you to that pet's show page" do
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
    pet_2 = Pet.create( image: "/img/spot.jpg",
                        name: "Spot",
                        age: 1,
                        sex: "female",
                        shelter: shelter_1,
                        description: "spotted puppy",
                        adoption_status: "adoptable")

    visit "/pets"

    expect(page).to have_link("Fido")
    expect(page).to have_link("Spot")
    click_link "Spot"
    expect(current_path).to eq("/pets/#{pet_2.id}")
  end

  it "has links next to every pet that take you to that pet's edit page" do
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

    visit "/pets"

    expect(page).to have_link("Edit Pet")
    click_link "Edit Pet"
    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
  end

  it "has links next to every pet that delete that pet" do
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

    visit "/pets"

    expect(page).to have_content("Fido")
    expect(page).to have_link("Delete Pet")
    click_link "Delete Pet"
    expect(current_path).to eq("/pets")
    expect(page).to_not have_content("Fido")
  end

  it "has links on every shelter name that take you to that shelter's show page" do
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

    visit "/pets"

    expect(page).to have_link("Pablo's Puppies")
    click_link "Pablo's Puppies"
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
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

    visit "/pets"

    expect(page).to have_link("Pet Index")

    click_link "Pet Index"

    expect(current_path).to eq("/pets")
  end
end
