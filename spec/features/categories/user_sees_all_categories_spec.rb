require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    Category.create!(title: "Government")
    Category.create!(title: "Development")

    visit categories_path

    expect(page).to have_content("Government")
    expect(page).to have_content("Development")
  end

end
