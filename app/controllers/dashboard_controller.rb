class DashboardController < ApplicationController

  def index
    @top_three_by_interest = Company.top_three_by_interest
    @jobs_by_interest = Job.jobs_by_interest
    @job_count_by_location = Job.locations_and_jobs
    @jobs = Job.all
  end

end
