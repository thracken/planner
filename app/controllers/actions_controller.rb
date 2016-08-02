class ActionsController < ApplicationController
  def index
    @actions = Action.all
  end

  def create
    @project = Project.find(params[:project_id])
    @action = @project.actions.new(action_params)
    if @action.save
      flash[:success] = "Action saved."
      redirect_to @project
    else
      render 'new'
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @action = @project.actions.new
  end

  def edit
    @project = Project.find(params[:project_id])
    @action = Action.find(params[:id])
  end

  def show
    @action = Action.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @action = Action.find(params[:id])
    if @action.update_attributes(action_params)
      flash[:success] = "Action updated."
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    Action.find(params[:id]).destroy
    flash[:success] = "Action deleted."
    redirect_to @project
  end

  private
    def action_params
      params.require(:project_new_action).permit(:text,:due_date,:due_time,:completed,:context)
    end
end
