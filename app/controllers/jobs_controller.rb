class JobsController < ApplicationController
    before_action :set_company
    before_action :set_job,
              only: [:show, :edit, :update, :destroy]
  
    def index
      @jobs = @company.jobs
    end
  
    def show
    end
  
    def new
      @job = @company.jobs.new
    end

    def edit
    end
    
    def update
      if @job.update(job_params)
        redirect_to company_job_path(@company, @job)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def create 
      @job = @company.jobs.new(job_params)
      if @job.save 
        redirect_to company_jobs_path(@company)
      else
        render :new, status: :unprocessable_entity
      end
    end
    
    def destroy
      @job.destroy
      redirect_to company_jobs_path(@company)
    end
    
  
    private
  
    def set_company
      @company = Company.find(params[:company_id])
    end
  
    def set_job
      @job = @company.jobs.find(params[:id])
    end

    def job_params
      params.require(:job).permit(
        :title,
        :description,
        :salary,
        :location,
        :employment_type,
        :experience_level
      )
    end
  end