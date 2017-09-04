class CommentsController < ApplicationController
  before_action :set_company, only: [:new, :create]
  before_action :set_job, only: [:new, :create]

  def new
		@comment = Comment.new
  end

	def create
		@comment = @job.comments.new(comment_parmas)
		if @comment.save
			flash[:success] = "You created a comment for #{@company.name} with the job title: #{@job.title}"
			redirect_to company_job_path(@company, @job)
		else
			render :new
		end
	end

	private

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_job
      @job = Job.find(params[:job_id])
    end

  	def comment_parmas
  		params.require(:comment).permit(:body)
  	end
end
