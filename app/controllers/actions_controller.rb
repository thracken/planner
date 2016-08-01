class ActionsController < ApplicationController
  def index
    @actions = Action.all
  end

  def create
    @action = Action.new(action_params)
    #something for project_id here
    if @action.save
      flash[:success] = "Action saved."
      redirect_to actions_url
    else
      render 'new'
    end
  end

  def new
    @action = Action.new
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
      params.require(:action).permit(:text,:due_date,:due_time,:completed,:context)
    end
end
