require 'rails_helper'

describe "shelter new page", type: :feature do
  it "shows a form to enter a new shelter" do

    visit "/shelters/new"

    expect(page).to have_button("Create Shelter")
  end
end
