class ProjectsController < ApplicationController
  def index
    @projects = Project.all
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

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated!"
      redirect_to @project
    else
      render 'edit'
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :outcome, :due_date, :due_time, :completed)
    end
end
