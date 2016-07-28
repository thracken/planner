class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      flash[:success] = "Project added!"
      redirect_to projects_url
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  private
    def project_params
      params.require(:project).permit(:name, :outcome, :due_date, :due_time, :completed)
    end
end
