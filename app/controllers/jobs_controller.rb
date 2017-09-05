class JobsController < ApplicationController
  before_action :set_company, only: [:index, :new, :create, :edit, :destroy, :update]

  def index
    @jobs = @company.jobs
  end

  def new
    @categories = Category.all
    @job = Job.new()
  end

  def create
    @categories = Category.all
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job, @category)
    else
      render :new
    end
  end

  def show
    @categories = Category.all
    @job = Job.find(params[:id])
  end

  def edit
    @categories = Category.all
    @job = @company.jobs.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job = @company.jobs.find(params[:id])
    @job.destroy

    redirect_to company_jobs_path(@company)
  end

  private

    def job_params
      params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

end
