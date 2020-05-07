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
                        shelter: shelter_1)
    pet_2 = Pet.create( image: "/img/spot.jpg",
                        name: "Spot",
                        age: 1,
                        sex: "female",
                        shelter: shelter_2)

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
end
