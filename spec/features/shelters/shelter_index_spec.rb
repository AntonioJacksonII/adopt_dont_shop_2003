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
end
