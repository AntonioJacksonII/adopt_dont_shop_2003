require 'rails_helper'

Rspec.describe "pet index page", type: :feature do
  it "can see the name, approximate age, sex, and shelter name for each pet in the system" do
    pet_1 = Pet.create( name: "Fido",
                        age: 4,
                        sex: "male",
                        shelter: "Pablo's Puppies")
    pet_2 = Pet.create( name: "Spot",
                        age: 1,
                        sex: "female",
                        shelter: "Matt's Mutts")

    visit "/pets"

    expect(page).to have_content("Name: #{pet_1.name}")
    expect(page).to have_content("Age: #{pet_1.age}")
    expect(page).to have_content("Sex: #{pet_1.sex}")
    expect(page).to have_content("Shelter: #{pet_1.shelter}")
    expect(page).to have_content("Name: #{pet_2.name}")
    expect(page).to have_content("Age: #{pet_2.age}")
    expect(page).to have_content("Sex: #{pet_2.sex}")
    expect(page).to have_content("Shelter: #{pet_2.shelter}")
  end
end
