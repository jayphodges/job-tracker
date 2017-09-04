require 'rails_helper'

describe "User visits the categories path" do
  scenario "and edits an existing category" do
    Category.create!(title: "Underwater Basket Weaving")

    visit categories_path

    click_on "Edit"
    fill_in "category[title]", with: "Networking"
    click_on "Update Category"

    expect(page).to have_content("Networking")
    expect(page).not_to have_content("Underwater")
  end
end
