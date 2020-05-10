require 'rails_helper'

describe "Destroy a Pet" do
  describe "When I visit a pet's show page" do
    it "can delete a pet" do
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
        pet_2 = Pet.create( image: "/img/spot.jpg",
                            name: "Spot",
                            age: 1,
                            sex: "female",
                            shelter: shelter_1,
                            description: "spotted puppy",
                            adoption_status: "adoptable")

        visit "/pets/#{pet_1.id}"

        click_link "Delete Pet"

        expect(current_path).to eq("/pets")
        expect(page).to_not have_content("Fido")
        expect(page).to have_content(pet_2.name)
      end
    end
  end
