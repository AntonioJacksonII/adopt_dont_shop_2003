require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can see the name of each shelter in the system" do
    shelter_1 = Shelter.create(name: "Pablo's Puppies")
    shelter_2 = Shelter.create(name: "Matt's Mutts")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
