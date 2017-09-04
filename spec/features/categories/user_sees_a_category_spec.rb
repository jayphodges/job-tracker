require 'rails_helper'

describe "User sees a specific category" do
  scenario "a user sees a category" do
  category = Category.create!(title: "Underwater Basket Weaving")

    visit category_path(category)

    expect(page).to have_content("Underwater")
  end
end
