class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def create
    @notable = find_notable
    @note = @notable.comment.new(note_params)
    if @note.save
      flash[:success] = "Note saved!"
      redirect_to @notable
    else
      render 'new'
    end
  end

  def new
    @notable = find_notable
    @note = @notable.comment.new
  end

  def edit
    @notable = find_notable
    @note = Note.find(params[:id])
  end

  def show
    @notable = find_notable
    @note = Note.find(params[:id])
  end

  def update
    @notable = find_notable
    @note = Note.find(params[:id])
    if @note.update_attributes(note_params)
      flash[:success] = "Note updated."
      redirect_to @notable
    else
      render 'edit'
    end
  end

  def destroy
    @notable = find_notable
    Note.find(params[:id]).destroy
    flash[:success] = "Note deleted."
    redirect_to @project
  end

  private
    def note_params
      params.require(:note).permit(:title,:body)
    end

    def find_notable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
end
