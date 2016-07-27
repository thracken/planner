class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save

    else
      render 'new'
    end
  end

  def edit
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  private
    def project_params
      params.require(:project).permit(:name, :outcome, :due_date, :due_time, :completed, :user_id)
    end
end
