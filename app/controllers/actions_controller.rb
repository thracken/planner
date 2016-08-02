class ActionsController < ApplicationController
  def index
    @actions = Action.all
  end

  def create
    @project = Project.find(params[:project_id])
    @action = @project.actions.build(action_params)
    if @action.save
      flash[:success] = "Action saved."
      redirect_to @project
    else
      render 'new'
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @action = @project.actions.build
  end

  def edit
    @action = Action.find(params[:id])
  end

  def show
    @action = Action.find(params[:id])
  end

  def update
    @action = Action.find(params[:id])
    if @action.update_attributes(action_params)
      flash[:success] = "Action updated."
      redirect_to @action
    else
      render 'edit'
    end
  end

  def destroy
    Action.find(params[:id]).destroy
    flash[:success] = "Action deleted."
    redirect_to actions_url
  end

  private
    def action_params
      params.require(:project_new_action).permit(:text,:due_date,:due_time,:completed,:context)
    end
end
