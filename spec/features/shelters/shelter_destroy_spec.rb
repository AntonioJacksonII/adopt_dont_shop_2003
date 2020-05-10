require 'rails_helper'

describe "Destroy a Shelter" do
  describe "When I visit a shelter's show page" do
    it "can delete a shelter" do
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

      visit "/shelters/#{shelter_1.id}"

      click_link "Delete Shelter"

      expect(current_path).to eq("/shelters")
      expect(page).to_not have_content("Pablo's Puppies")
      expect(page).to have_content(shelter_2.name)
    end
  end
end
