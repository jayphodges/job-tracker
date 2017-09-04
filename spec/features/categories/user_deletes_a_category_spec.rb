require 'rails_helper'

describe "User deletes a category" do
  scenario "a user can delete a category" do
    Category.create!(title: "Government")
    Category.create!(title: "Development")
    visit categories_path

    first(:link, "Delete").click

    expect(page).to have_content("Government was successfully deleted!")
  end
end
