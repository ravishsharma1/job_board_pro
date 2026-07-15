class ApplicantsController < ApplicationController
  before_action :set_company
  before_action :set_job
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]

  def index
    @applicants = @job.applicants
  end

  def show
  end

  def new
    @applicant = @job.applicants.new
  end

  def create
    @applicant = @job.applicants.new(applicant_params)

    if @applicant.save
      redirect_to company_job_applicants_path(@company, @job)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @applicant.update(applicant_params)
      redirect_to company_job_applicant_path(@company, @job, @applicant)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @applicant.destroy
    redirect_to company_job_applicants_path(@company, @job)
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = @company.jobs.find(params[:job_id])
  end

  def set_applicant
    @applicant = @job.applicants.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(
      :name,
      :email,
      :phone,
      :cover_letter,
      :resume
    )
  end
end