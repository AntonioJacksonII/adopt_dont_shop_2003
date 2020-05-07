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

    expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.adoption_status)
  end
end
