require 'rails_helper'

RSpec.feature "User deletes an existing job" do
  scenario "they click the delete button" do
    company = create(:company_with_jobs)
    job = company.jobs.first

    visit company_job_path(company, job)
    click_on "Delete job"

    expect(page).to_not have_content(job.title)
    expect(page).to have_current_path(company_jobs_path(company))
  end
end
