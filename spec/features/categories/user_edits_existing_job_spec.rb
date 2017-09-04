require 'rails_helper'

describe "User visitis the company job path" do
  scenario "and edits an existing job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_path(company)
    
    click_on "Edit"
    fill_in "job[title]", with: "Plumber"
    click_on "Update Job"

    expect(page).to have_content("Plumber")
    expect(page).not_to have_content("Developer")
  end
end
