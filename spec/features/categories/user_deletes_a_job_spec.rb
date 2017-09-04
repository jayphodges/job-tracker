require 'rails_helper'

describe "User deletes a job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    company.jobs.create!(title: "Plumber", level_of_interest: 99, city: "Italy")
    visit company_jobs_path(company)

    first(:link, "Delete").click

    expect(page).not_to have_content("Developer")
    expect(page).to have_content("Plumber")
  end
end
