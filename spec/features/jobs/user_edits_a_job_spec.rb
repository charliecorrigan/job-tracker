require 'rails_helper'

RSpec.feature "User edits an existing job" do
  scenario "they enter data to update job" do
    company = create(:company_with_a_job)
    job = company.jobs.first
    new_name = "Completely New Never Before Seen Job Title"

    visit company_job_path(company, job)
    click_on "Edit job"
    fill_in 'job_title', with: new_name
    click_on "Update Job"

    expect(page).to have_content(new_name)
    expect(page).to have_current_path(company_job_path(company, job))
  end
end
