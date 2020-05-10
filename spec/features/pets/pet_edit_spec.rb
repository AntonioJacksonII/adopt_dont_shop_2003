require 'rails_helper'

describe "pet edit page", type: :feature do
  it "shows a form to edit the pet's data" do
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

    visit "/pets/#{pet_1.id}/edit"

    fill_in :image, with: "image_1.jpg"
    fill_in :name, with: "New Name"
    fill_in :description, with: "New Description"
    fill_in :age, with: "10"
    fill_in :sex, with: "female"

    click_button "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("image_1.jpg")
    expect(page).to have_content("New Name")
    expect(page).to have_content("New Description")
    expect(page).to have_content("10")
    expect(page).to have_content("female")
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

    visit "/pets/#{pet_1.id}/edit"

    expect(page).to have_link("Pet Index")

    click_link "Pet Index"

    expect(current_path).to eq("/pets")
  end
end
