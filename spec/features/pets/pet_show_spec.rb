require 'rails_helper'

describe "pet show page", type: :feature do
  it "see the pet wtih that id including image, name, description, age, sex, and adoption_status" do
    shelter_1 = Shelter.create(name: "Pablo's Puppies",
                              address: "123 Main St",
                              city: "Denver",
                              state: "CO",
                              zip: "80202")

    pet_1 = Pet.create( image: "/img/fido.jpg",
                        name: "Fido",
                        description: "Cute puppy",
                        age: 4,
                        sex: "male",
                        shelter: shelter_1,
                        adoption_status: "adoptable")

    visit "/pets/#{pet_1.id}"

    expect(page).to have_xpath("//img[@src='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.adoption_status)
  end

  it "shows a link to edit the pet's data" do
    shelter_1 = Shelter.create(name: "Pablo's Puppies",
                              address: "123 Main St",
                              city: "Denver",
                              state: "CO",
                              zip: "80202")
    pet_1 = Pet.create( image: "/img/fido.jpg",
                        name: "Fido",
                        description: "Cute puppy",
                        age: 4,
                        sex: "male",
                        shelter: shelter_1,
                        adoption_status: "adoptable")

    visit "/pets/#{pet_1.id}"

    expect(page).to have_link("Update Pet")
    click_link "Update Pet"
    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
  end

  it "has a link on the pet's name to the pet's show page" do
    shelter_1 = Shelter.create(name: "Pablo's Puppies",
                              address: "123 Main St",
                              city: "Denver",
                              state: "CO",
                              zip: "80202")
    pet_1 = Pet.create( image: "/img/fido.jpg",
                        name: "Fido",
                        description: "Cute puppy",
                        age: 4,
                        sex: "male",
                        shelter: shelter_1,
                        adoption_status: "adoptable")

    visit "/pets/#{pet_1.id}"

    expect(page).to have_link("Fido")
    click_link "Fido"
    expect(current_path).to eq("/pets/#{pet_1.id}")
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

    visit "/pets/#{pet_1.id}"

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

    visit "/pets/#{pet_1.id}"

    expect(page).to have_link("Shelter Index")

    click_link "Shelter Index"

    expect(current_path).to eq("/shelters")
  end

end
